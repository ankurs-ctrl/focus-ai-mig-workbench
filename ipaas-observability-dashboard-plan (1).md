# iPaaS Message Flow Observability — Build Plan

**Scope:** a single containerised web app the team runs in client Azure ACA, giving three views over the existing iPaaS pipeline — a metrics dashboard, a live DAG tracker, and an AI Q&A bot. Reference use case: **household create (Salesforce → Orion)**.

**Status:** plan only. Nothing built yet. Decisions marked ✅ are settled; ❓ needs your answer before Phase 1.

---

## 1. Decisions already made

| Area | Decision |
|---|---|
| Stack ✅ | React (Vite) SPA + Python FastAPI backend, **one container image**, one ACA app |
| Metrics ✅ | Hot path (last 1 hr / today) live from Cosmos; cold path (MTD / YTD) from a pre-aggregated rollup container |
| Component health ✅ | Azure ARM + Service Bus management APIs **when RBAC is granted**; Cosmos-activity-derived fallback otherwise, switched by config |
| AI bot ✅ | Azure OpenAI with tool calling over the dashboard's own read APIs — **no raw SQL from the model** |

---

## 2. What the data actually gives us

From the Cosmos account `ffp-ipaas-db-dev`, database `ipaas_middleware`:

| Container | Doc prefix | What it is | What the dashboard uses it for |
|---|---|---|---|
| `src_payload` | `SRC-` | The inbound message as received | **The fact table.** `source_system`, `target_system`, `message_type`, `operation`, `event_timestamp`, `received_timestamp`, `sequence_number`, `idempotency_key`, `raw_payload` |
| `src_payload_tracker` | `TRK-` | Live state of one message's journey | DAG node states via `timestamps{}` + `completed_steps[]`; retry state via `retry_count` / `max_retry_count` / `next_retry_time`; per-hop bodies via `step_io{}`; `orion_client_id`, `feedback_received`, `sf_callback_sent`, `processing_duration` |
| `payload_flow_audit` | `AUD-` | Every execution event, all versions | Per-component event stream → node colour, last-1-min counters, error/DLQ detail (`stage`, `component`, `event`, `status`, `error_code`, `retry_attempt`, `duration_ms`) |
| `api_transaction_log` | `LOG-` | One row per outbound API hop | Per-hop latency + success (`api_name`, `endpoint`, `http_method`, `http_status_code`, `duration_ms`, `success_flag`, `target_system`) — this is what turns the 4-hop Orion contract into a visible sub-graph |
| `dlq_tracker` | — | Dead letters | Failure panel, DLQ counts |

Service Bus namespace `ffp-ipaas-servicebus-dev`, 6 queues: `inbound-queue`, `processing-queue`, `outbound-queue`, `response-queue`, `feedback-queue`, `retry-queue` — each with a DLQ. Runtime counts come from the management API.

### Gaps I can see in the screenshots — worth fixing at the source

These are not blockers; each has a workaround, but the workaround costs query time or accuracy.

1. **`operation` and `message_type` are `"UNKNOWN"`** in `src_payload_tracker` and `api_transaction_log`, while `src_payload` has them correctly (`HOUSEHOLD_CREATION` / `NEW_CLIENT`). → Filtering by event type currently requires joining back to `src_payload` on `correlation_id` for every row. **Ask:** propagate both fields through the pipeline.
2. **No single terminal `status` field on the tracker.** State has to be inferred from `completed_steps[]` + `feedback_received` + `retry_count` + audit rows. → **Ask:** add `status` ∈ `RECEIVED | IN_PROGRESS | COMPLETED | FAILED | RETRY_WAIT | DLQ`. This one change removes most of the dashboard's inference logic and makes the DAG far more trustworthy.
3. **No `service` / `flow_name` field.** "Household vs ACH" is currently inferred from `message_type`. Fine for now, fragile at 10 flows. **Ask:** add `flow_name`.
4. **Partition key appears to be `/correlation_id` everywhere.** Perfect for "trace one message", worst case for "count all messages this year" — every aggregate is cross-partition. This is precisely why the rollup container exists (§5).
5. **Retention/TTL unknown.** If these containers have a TTL of days, "year-to-date" is a promise we can't keep from Cosmos alone. Needs checking in Phase 0.

---

## 3. The component graph (household create)

Nodes the DAG view renders, driven by a **config file**, not code — adding ACH later means editing JSON:

**Main lane**

```
Salesforce (Pub/Sub)
  └▶ ACA Listener ─[inbound-queue]▶ ACA Inbound ─[processing-queue]▶ ACA Processing
       ─[outbound-queue]▶ ACA Outbound ──▶ APIM ──▶ Orion
                             │
                             └── the 4 Orion hops execute INSIDE ACA Outbound:
                                 1. POST /v1/Portfolio/Clients/verbose/          → response.id
                                 2. GET  /v1/Portfolio/Clients/verbose/{id}?expand=…
                                 3. (in-memory) set entityOptions[690RIONCON] = "True"
                                 4. PUT  /v1/Portfolio/Clients/verbose/{id}
                                 Orion rejects entityOptions on create, so 2–4 are a
                                 retry-inside-Outbound; a partial result never reaches Salesforce.

  ─[response-queue]▶ ─[feedback-queue]▶ ACA Feedback ──▶ Salesforce (Avro-encode → Publish RPC)
```

**Return lane**

```
  [retry-queue] ▶ ACA Retry ──▶ re-enqueues to the failed stage's source queue
                            ⟶ DLQ when max_retry_count is exhausted
```

The four Orion hops are therefore **not peer nodes** in the graph — they are a **sub-graph inside the Outbound node**, expanded on click. That matches both the `step_io{}` shape on `src_payload_tracker` (`orion_create_client_*`, `orion_get_client_*`, `orion_update_client_*` all on one tracker document) and `completed_steps[]`, which lists them as steps of a single stage.

**Topology / inventory card** (answers "how many components are there"): for the selected flow, count ACA apps, queues + DLQs, external systems, and API hops — rendered as a small stat row above the graph, derived from the same config so it can never drift from the picture.

### Node state derivation

| Dot | Meaning | Derived from |
|---|---|---|
| 🔵 Blue | Completed | step present in `completed_steps[]`, or matching `payload_flow_audit` row with `status = SUCCESS` |
| 🟢 Green | In progress | `timestamps.{stage}_received_at` set, no completion event yet |
| 🔴 Red | Failed | audit `status ∈ {ERROR, DLQ}` or `success_flag = false` on the hop |
| 🟠 Amber | Retry wait | `retry_count > 0` and `next_retry_time` in the future, or message sitting in `retry-queue` |
| ⚪ Grey | Waiting / idle | no traffic in the window, or awaiting a downstream response — **added from your mock** (Downstream and Feedback App render grey while waiting) |
| ⊘ Hollow + dashed box | **Not in this flow** | the component is deployed and healthy but this use case never routes to it. Comes from the flow config, not from data — a node absent from the flow's `path[]` renders this way |

**Why "not in this flow" is a separate code from idle.** Idle means *should be getting traffic, isn't right now* — that's a thing to watch. Not-in-this-flow means *correctly receiving nothing* — that's a thing to ignore. Collapsing them would make Processing look permanently broken on the household flow. So the node gets a dashed border, a hatched fill, a slashed hollow dot and a `NOT IN THIS FLOW` chip; its counters read `—` rather than `0`, and its queue (`processing-queue`) is marked *unused* in the queue strip rather than showing a healthy-looking zero.

**Consequence for the graph, not just the node.** Because household bypasses Processing, the live route is Inbound → `outbound-queue` → Outbound. The prototype draws that as a **solid arc over the Processing box**, with the two edges that touch Processing rendered muted and dashed. A reader sees at a glance both what is wired and what is actually running.

### DAG visual spec — from your mock

Your second image is the floor, not a sketch. Locking these in as requirements:

- **Status dot top-left of each box**, colour per the table above. (Your original brief said top-right; the mock puts it top-left. Going with the mock — say if you'd rather keep top-right.)
- **Two-line counter inside every box**: a large primary number with a unit label, and a smaller secondary line. Semantics differ by node type and are part of the config:
  - source node — `5 msgs in 5 mins`
  - mid-pipeline node — `5 msgs processed`, or `1 msg in-progress` over `4 msgs processed` when both are non-zero
  - terminal / async node — `1 waiting response` over `3 response received`
- **Edge labels carry throughput**: `Rate: 225 ms/msg`. This is a **new metric the plan didn't have** — see below.
- **Two-lane layout**: main pipeline left-to-right on the top lane; Retry App and Feedback App on lower lanes with **dashed return edges** back into the stages they feed. Solid edges = forward flow, dashed = return/retry.
- **Greyed-out styling for idle nodes** — box, text and icon all desaturate, not just the dot.
- Node chrome keeps the platform label (`ACA • send + monitor`) and the service icon, so the live view stays visually continuous with the architecture diagram.

**Edge rate metric.** `225 ms/msg` is derived from consecutive `src_payload_tracker.timestamps{}` pairs — e.g. Listener→Inbound = `inbound_received_at − inbound_queue_enqueued_at`, averaged across messages in the window. Two consequences: the tracker must carry a timestamp pair for **every** edge in the config (spot-check that `outbound_queue_enqueued_at` has a matching `outbound_received_at`, and that the response/feedback legs are timestamped at all), and the rate is a windowed mean, so it needs the same rollup treatment as the counters rather than a per-refresh scan.

---

## 4. Application architecture

```
┌────────────────────── one container image ──────────────────────┐
│  React SPA (Vite, built to static)  ←─ served by ─┐             │
│  FastAPI (uvicorn, :8000)                          │             │
│   ├─ /api/metrics/*        query layer + cache                   │
│   ├─ /api/health/*         ARM + Service Bus (or Cosmos fallback)│
│   ├─ /api/flows/*          trace + step_io detail                │
│   ├─ /ws/live              WebSocket push (5s tick)              │
│   ├─ /api/chat             Azure OpenAI tool-calling loop        │
│   └─ change-feed worker    background task → metrics_rollup      │
└──────────────────────────────────────────────────────────────────┘
        │ managed identity (no connection strings)
        ├─ Cosmos DB      (Built-in Data Reader + write on rollup/leases)
        ├─ Service Bus    (management read)
        ├─ Azure ARM      (Reader on the ACA resource group)
        └─ Azure OpenAI   (Cognitive Services OpenAI User)
```

Auth to the app itself: **ACA built-in auth (Easy Auth) with Entra ID** — no login code in the app, restricted to an Entra group.

### API surface

```
GET  /api/meta/flows                              flow + node config (drives the DAG)
GET  /api/metrics/summary    ?window=1h|today|mtd|ytd|custom &from&to
                              &source_system[]&event_type[]&flow[]&target_system[]
GET  /api/metrics/timeseries ?bucket=minute|hour|day|month  (+ same filters)
GET  /api/metrics/breakdown  ?by=flow|source_system|target_system|status
GET  /api/health/components                       per-ACA-app up/down + today's count
GET  /api/health/queues                           active / dlq / scheduled per queue
GET  /api/flows              ?status&event_type&client_id&correlation_id&limit&cursor
GET  /api/flows/{correlation_id}                  node states + timeline + captured ids
GET  /api/flows/{correlation_id}/steps/{step}     request + response bodies (step_io)
WS   /ws/live                                     node counters, status deltas, queue depths
POST /api/chat                                    { message, session_id }
```

---

## 5. The rollup — how YTD stays fast

Rather than polling Cosmos with `COUNT` queries, run a **Cosmos change feed processor** over `src_payload` and `src_payload_tracker` inside the app (background task, lease container for checkpointing). Every change increments in-memory counters that are flushed to a `metrics_rollup` container.

```
container: metrics_rollup     partition key: /bucket_key
bucket_key : "hour|2026-09-04"   (or "day|2026-09", "month|2026")
id         : "hour|2026-09-04T14|SALESFORCE|HOUSEHOLD_CREATION|COMPLETED"
fields     : count, error_count, retry_count, sum_duration_ms, p95_duration_ms
```

- **Last 1 hr / today** → live query against the current hour's buckets + a live Cosmos read for the in-flight minute.
- **MTD / YTD** → a single-partition read of day/month buckets. Sub-second regardless of volume.
- Same change feed drives the **WebSocket live push**, so the DAG updates without any client polling.

Two new containers needed in the client's Cosmos DB: `metrics_rollup` and `leases`. ❓ Confirm we're allowed to create them — if not, the fallback is a separate small Cosmos/Table account owned by the dashboard, or all-live queries with a 5–10 minute cache and a visible "YTD is approximate" note.

A **backfill command** (`python -m app.backfill --from 2026-01-01`) populates history once, so YTD works on day one.

---

## 6. The three views

### View 1 — Dashboard
Filter bar pinned to the top: date range (presets: last 1 hr / today / MTD / YTD / custom), source system, event type, flow, target system. Every panel below responds to it.

- **Stat row:** messages processed, succeeded, failed, in retry, in DLQ, avg end-to-end duration — each with a sparkline and a delta vs. the previous equivalent period.
- **Timeline:** stacked area of volume by status over the selected range, bucket auto-chosen from range width.
- **By service:** household / ACH / … volume + success rate, as a horizontal bar with a failure segment.
- **By source system:** Salesforce, Addepar, Schwab, Fidelity, Orion — count, success rate, avg latency.
- **App status strip:** one tile per ACA app — Listener, Inbound, Processing, Outbound, Retry (❓ and Feedback?) — showing running/degraded/down, replica count when ARM is available, and messages processed today.
- **Queue strip:** all 6 queues + DLQ counts, red when DLQ > 0.
- **Topology inventory:** the component counts described in §3.

### View 2 — DAG live tracking
The graph from §3 rendered to the visual spec above: two lanes, status dot top-left, two-line counters in every box, `Rate: N ms/msg` on every edge, idle nodes desaturated. Live via WebSocket, no client polling.

Two modes:
- **Aggregate** (default) — dot colour reflects the worst state seen in the last N minutes; counters are throughput. This is the mode your mock shows.
- **Trace** — enter or click a `correlation_id` and the graph shows that one message's path, with elapsed time on each edge from the tracker's `timestamps{}` instead of a windowed rate.

**Outbound drill-down.** Clicking the Outbound node expands the four Orion hops as an inline sub-graph — each with its own dot, `http_status_code` and `duration_ms` from `api_transaction_log`. This is where most household failures will actually be visible, so it gets a first-class expand rather than living only in the drawer.

Bottom drawer, opens on node click: message list filtered to that component, with columns `correlation_id`, sequence, event type, client id, status, duration, timestamp. Selecting a row shows **request and response side by side** from `step_io` / `api_transaction_log`, with a JSON diff on the Orion GET→PUT pair so the `690RIONCON` change is visible as a one-field delta. Drawer filters: message/sequence number, event type, client id, status.

### View 3 — AI bot
Docked panel available from any view, seeded with the current filter context. The model gets tools, not a database:

```
get_flow_status(correlation_id)
search_flows(status?, event_type?, client_id?, source_system?, from?, to?, limit?)
get_metrics(window, group_by?, filters?)
get_component_health()
get_queue_depths()
get_step_payload(correlation_id, step)      # redacted by default
explain_error(correlation_id)               # joins audit + api_transaction_log
```

Answers cite the `correlation_id`s they used and link into the DAG trace view. Guardrails: read-only tools only, hard row caps, PII redaction on payload tools, and a refusal path when the answer isn't in the returned data rather than a guess.

---

## 7. Packaging & deployment

Multi-stage Dockerfile: `node:20` builds the SPA → `python:3.12-slim` runtime, non-root user, static files served by FastAPI. Single port 8000, `/healthz` + `/readyz`.

Config entirely by env var, nothing baked in:
```
COSMOS_ENDPOINT, COSMOS_DATABASE
SERVICEBUS_NAMESPACE
AZURE_SUBSCRIPTION_ID, ACA_RESOURCE_GROUP
AZURE_OPENAI_ENDPOINT, AZURE_OPENAI_DEPLOYMENT
HEALTH_MODE = arm | cosmos | auto
ROLLUP_ENABLED = true|false
FLOW_CONFIG_PATH
```

Ships with an ACA `containerapp.yaml` / Bicep snippet: user-assigned managed identity, ingress external + Easy Auth, min replicas 1 (the change feed and WebSocket need a warm instance), 0.5 vCPU / 1 GiB to start. Role assignments the client must grant are listed as a single copy-pasteable block.

**Build-without-access mode:** the repo carries JSON fixtures matching the exact document shapes in your screenshots, plus a seed script for the Cosmos emulator, so the whole app can be developed and demoed with `MOCK_DATA=true` before anyone gets client credentials. This is what keeps Phases 1–4 from blocking on RBAC.

---

## 8. Phased build

| Phase | Work | Output | Est. |
|---|---|---|---|
| **0 — Recon** | Confirm partition keys, indexing policy, TTL, doc volumes, RBAC availability, environments. I'll hand you a short list of Cosmos queries + `az` commands to run. | Answers to §10 | 0.5 d |
| **1 — Foundation** | Repo, Dockerfile, FastAPI skeleton, Cosmos repository layer, fixtures + mock mode, flow config schema | App runs locally on fixtures | 1.5 d |
| **2 — Dashboard** | Live metrics queries, filter bar, stat row, timeline, breakdowns, topology card | View 1 usable | 2 d |
| **3 — DAG** | Graph render, node state derivation, trace mode, detail drawer with request/response | View 2 usable | 2.5 d |
| **4 — Live + health** | Change feed worker, `metrics_rollup`, backfill, WebSocket push, ARM + Service Bus health with fallback | Live tiles, real YTD | 2 d |
| **5 — AI bot** | Tool definitions, Azure OpenAI loop, chat UI, redaction + caps | View 3 usable | 1.5 d |
| **6 — Ship** | Easy Auth, managed identity, Bicep/YAML, image push to ACR, deploy + smoke test, runbook | Image running in client ACA | 1 d |

≈ **11 working days** for one build stream. Phases 2 and 3 are the demo-able midpoint — worth showing the team before 4–6.

**Verification built in:** each phase ends with a check — Phase 2 counts reconciled against a manual Cosmos `COUNT` for a known day; Phase 3 traced against the `TRK-ab024adb…` document end to end; Phase 4 rollup totals compared to live query totals for the same window; Phase 5 bot answers spot-checked against the UI.

---

## 9. Risks

| Risk | Impact | Mitigation |
|---|---|---|
| Cross-partition aggregates on `/correlation_id` | Slow, RU-expensive dashboards at volume | Rollup container + change feed (§5) |
| TTL shorter than a year | YTD tile is a lie | Confirm in Phase 0; if short, rollup becomes the *only* long-term store and backfill must run before data ages out |
| No ARM/Service Bus RBAC granted | App status tiles degrade to inference | Already designed as `auto` mode with Cosmos fallback |
| `UNKNOWN` operation/message_type | Event-type filter needs a join per row | Join in Phase 2; push the source fix in parallel |
| No Azure OpenAI in client tenant | Phase 5 blocked | Bot is last phase by design; Views 1–2 ship without it |
| Single replica for change feed | Restart = brief gap | Lease container makes it resumable; scale-out needs partitioned leases (out of MVP scope) |

---

## 10. Open questions

1. **Retention/TTL** on the five containers — does a year of data actually exist?
2. **Partition key** of each container — `/correlation_id` on all five?
3. ~~**Processing vs Outbound**~~ — **resolved.** Six ACA apps exist (Listener, Inbound, Processing, Outbound, Retry, Feedback). **Processing is deployed but not used by `household_create_v1`** — it stays in the architecture for future use cases and renders in the sixth state above. Still needed: the exact ACA resource names, since the tiles and the ARM health lookups key off them.
4. **Which app owns the Orion hops, now that they're in Outbound?** Confirm `payload_flow_audit.component` for those rows says `Outbound ACA` (the DLQ example in your screenshot does) so the drill-down attaches to the right node.
5. **Are all edges timestamped?** The rate labels need a `*_enqueued_at` / `*_received_at` pair per edge in `src_payload_tracker.timestamps{}`, including the response and feedback legs. If some legs are missing, those edges show no rate.
6. **Images 3 and 4 are both `src_payload_tracker`** — you labelled #4 "Payload_tracker, latest status". Is that a separate container I haven't seen, or the same one scrolled down?
7. **Environments** — dev only, or an env switcher across dev/UAT/prod?
8. **Can we create `metrics_rollup` + `leases`** in the client's Cosmos database?
9. **Azure OpenAI** — endpoint and model deployment available in the client tenant?
10. **Access for development** — do we get read creds to dev Cosmos, or do we build entirely on fixtures and integrate at the end?
11. **Volume** — messages/day today and projected, so the rollup granularity is sized right.
12. **Which flows beyond household** should the config ship with — ACH, and what else?
13. **Who sees this** — ops-only, or advisors too? Changes the PII redaction default on payload views.

---

*Next step: answer §10 (or just 3, 4, 6, 8 — those four unblock Phase 1), and I'll scaffold the repo.*
