# UAT Auto-map remediation plan

Prepared November 11, 2026. Status: investigation and implementation plan; application changes and deployment have not been performed.

## 1. Goal and agreed behavior

Auto-map must provide a useful first draft. Low confidence, incomplete historical metadata, or a failed optional knowledge service must not erase useful mappings or prevent unrelated targets from completing. Users remain responsible for business review.

The user confirmed:

- Search both linked-project and other accessible cross-project FIR. Give linked projects priority; retain the context-window limits.
- Return mappings supported by the current graph first. For remaining targets, suggest missing CTEs, joins, and transformations grounded in FIR or published mappings. Do not invent dependency recommendations or add them automatically.
- Include an isolated Snowflake/SPCS deployment and end-to-end acceptance tests.
- Exclude client.env and other environment files from source synchronization.

Operational failures cannot be eliminated absolutely. The engineering contract is to preserve completed work, isolate failures, return an honest outcome for every requested target, and make retry/recovery usable. A provider outage must not be disguised as successful inference or filled with fabricated mappings.

## 2. Baseline and verified findings

### Source comparison

The supplied ZIP's UAT HEAD is `e924e3e090302bfaa7ad1252f4a40553db3d295c`. A read-only CodeCommit lookup confirmed both remote UAT and develop at `9f6b16f34d63d9b18ef44e3ba0ad699743185242`.

After normalizing CRLF for comparison and excluding environment paths, the client application delta is four files: `auto_mapping_proxy.py`, `automap_restart.py`, the existing durable-v2 regression suite, and the new `test_automap_durable_json.py`.

The four-file fix preserves exact JSON across Snowflake numeric normalization, reads worker diagnostics from the correct nested field, and retains a proven mapping when a later retry makes zero model calls. These changes are worth importing. Do not disable their integrity checks.

CodeCommit also has a newer four-file session-shell change absent from the ZIP. Preserve it. Additional ZIP manifests are historical packaging metadata; six locally retained documents absent from the ZIP are not automatic deletions. Do not merge the client's `.git` ancestry or overwrite the checkout with the ZIP.

### Findings confirmed in source or local reproduction

| Boundary | Finding | Consequence |
|---|---|---|
| FIR ranking | `automap_learning_pack.py` makes T4 cross-project history guidance-only, independently of source compatibility. | A useful accessible recipe may not reach the normal reuse path. |
| FIR compatibility | `target_mapping_patterns.py` requires positive type/grain compatibility even for exact dependencies. Physical snapshot nodes normally omit grain. | Missing metadata can suppress a valid-looking historical expression. |
| FIR discovery | Unresolved canonical candidates are removed before initial positive evidence selection; only some guidance-only pack entries are restored. | Useful incomplete recipes and dependency details can disappear between retrieval and the model. |
| Evidence review | `automap_batch.py` requires model-generated block reviews before source selection; malformed quotations, identities, or the three-call budget can stop every unfinished target in that batch. | Protocol compliance can consume inference capacity and prevent any mapping call. |
| Source identity | Evidence record IDs and SQL source references occupy different namespaces, but rejected proposals can retain record IDs in draft fields. | Text such as `src:mapper_hh_master.LEGACYHHNAME` can leak into working SQL. |
| Transformation | `sttm_builder.py` selects transformation work only from primary mappings with source attributes. Candidate-only proposals are outside that selection. | A useful source proposal can reach the UI without ever receiving executable transformation SQL. |
| Suggestions | `automap_suggestions.py` prefills join details only from an existing graph edge. | A historical join absent from the graph loses its useful details precisely when the user needs a suggestion. |
| Learning capture | One acceptance channel requires original confidence >= 0.7 even after explicit acceptance; the target-pattern publication channel is separate. | Human acceptance is represented inconsistently across FIR channels. |
| Coverage | Both mapping persistence paths fall back to rule labels; aggregate counts treat nonempty transformation text as mapped. | `Select...` can inflate coverage to 100%. |
| Preview output | Schema `field.name` and `Row.as_dict()` can use different quoted-name representations; the grid directly indexes `row[column.name]`. Reproduced locally. | Actual output values become `Not sampled`, while the per-target trace can still display them. |
| Preview sources | Source comparison can emit a generated CTE alias not present in the approved query's outer scope. Reproduced locally. | The optional source comparison fails independently of successful output execution. |
| Publication | With the supplied Contacts SQL, qualified sources and test firm values, the real importer/compiler/validator rejects the upload after upstream CTEs become nested within JimsContacts. | Reconstructed SQL shape and original uploaded shape disagree at the publication check. |
| Error handling | Publication translates ValueError into a validation error, while other exceptions reach the generic 500 handler. Background thread preparation also replaces its exception without preserving a useful public cause. | Screenshots and operational diagnostics do not identify the failing SQL/session operation. |

The screenshot's exact publication exception and the client `thread_persist` SQL/session failure remain unproven. The supplied history's live FIR row contents and job outcomes are reported evidence, not independently re-read client database records.

Fixture sizes matter: `contacts_actual.sql` has 49 outer outputs, 11 physical sources, and four CTEs. The screenshot shows 49/66 mapping targets. The household fixture has 35 outputs, six sources, and four CTEs. Preserve authored outputs and separately assess additional catalog targets.

## 3. Implementation sequence

### A. Import the client corrections without losing the local baseline

Create a `codex/` repair branch from the freshly verified CodeCommit UAT revision. Apply only the four client code/test changes after reviewing their normalized diffs. Preserve the newer session-shell changes and local documentation. Exclude `.git`, `.env*`, `*.env`, and the existing environment-profile directory, including its JSON profiles. Record excluded paths and before/after hashes in the sync report.

Keep durable-v2 admission, caller identity, recovery reservations, and dispatch reconciliation. This task does not need another admission-pool migration, framework, or global capacity increase.

### B. Make FIR a usable ranked knowledge source

Use a single shared applicability assessment across learning-pack retrieval and candidate hydration. Separate evidence relevance, current source binding, and execution readiness; do not let project tier silently mean SQL incompatibility.

- Rank current-project evidence first, linked projects second, matching source-system evidence next, then other accessible cross-project history. Within that order, prefer trusted published/accepted recipes whose current dependencies resolve. Explicit applicable corrections and current user intent govern conflicts. Preserve suppression, archive, authorization, and supersession rules.
- Search all relevant accessible evidence server-side. Keep a small per-target initial packet and page additional alternatives only for unresolved targets. Report deferred evidence rather than implying that a top-four result set is the entire history. Deduplicate equivalent recipes without collapsing different filters, dependencies, or project-specific values.
- Treat unknown grain, unknown historical type, missing CRM labels, and absent project linkage as review warnings. Preserve relevant recipes for generation. Actual missing columns, ambiguous ownership, unavailable dependencies, and unresolved current firm values remain explicit readiness issues.
- Carry expression, NL intent, SQL NULL, literal/value kind, logical and physical lineage, CTE dependencies, joins, population filters, publication version, and evidence IDs together. Do not substitute a physical column for a CTE output merely because the names appear equivalent.
- Preserve intentional SQL NULL as a usable neutral expression. Keep historical project-specific IDs and other literals distinct; adapt them through current-project Values or leave a specific Value suggestion. Do not copy an old firm's ID into the new project.
- Capture known source types, grain/keys, and lineage from the real publication snapshot. Backfill older FIR projections from immutable published versions in bounded, idempotent batches. Keep originals and leave genuinely unknown metadata unknown.
- Record explicit user acceptance/correction independently of the original AI confidence. Keep unreviewed autosaved proposals out of trusted learning. Invalidate relevant retrieval caches after successful learning projection, and expose queued/failed projection status so a publication cannot appear learned when projection failed.

For the reported examples: BILLINGSTREET should reach transformation generation with all three address columns and its exact expression; NEXTREVIEW should evaluate its direct published precedent separately from the JIMSHH-dependent precedent; OWNERNAME should retain the published NULL precedent without inventing a full-name rule.

### C. Simplify the model path while preserving context limits

Keep the existing source-mapping agent and transformation specialist. Both receive the same frozen current workspace and target-specific evidence. Update their instructions together with backend policy; changing a prompt alone cannot repair evidence already removed by Python.

The intended flow is:

`freeze workspace -> retrieve/rank evidence -> bind current sources -> generate draft -> generate needed scalar expressions -> check readiness -> merge and persist`

Targets requiring missing dependencies branch into evidence-backed suggestions without blocking the rest.

- Remove model quote certification as a prerequisite for mapping. Assemble factual evidence deterministically from stored records and parsed SQL. Optional model annotations may assist review, but a malformed quote or annotation envelope cannot invalidate an otherwise supported draft.
- Keep exact stored bodies available through the existing archive/read mechanism. Pack whole relevant expressions and their population/dependency closure. Do not truncate SQL, conditions, corrections, or identifier spellings to fit a packet. Oversized work splits by target or complete dependency scope; a target that still cannot fit remains explicitly deferred while siblings complete.
- Enforce both configured character and UTF-8 byte limits against the fully serialized outgoing messages. Preserve the existing 180,000 hard input ceiling and lower configured limits; do not solve overflow by raising caps. Measure the complete agent request framing too. Honor configured model/output token budgets, deadlines, call limits, and concurrency.
- Use the full server-side source inventory for retrieval. Do not reinstate a 12-table selection cap. Admit task-relevant semantic descriptions, types, synonyms, current CTE outputs, and recipe-forced source dependencies first; admit further pages on demand. An unread column is not an absent column.
- Normalize returned evidence IDs through the authoritative record-to-binding registry. Convert an ID to SQL only when it resolves uniquely to a current admitted relation and column. Never globally strip `src:` or guess an alias. Otherwise retain a diagnostic/suggestion and request focused repair.
- Separate source binding from final SQL readiness. A uniquely bound candidate awaiting an expression is eligible for the transformation stage even if evidence warnings or missing grain prevent strict acceptance. Reuse a complete compatible expression directly; call the specialist when SQL is missing or requires adaptation.
- Cover source-free expressions such as approved Values, NULL, literals, and appropriate current-date expressions; do not require every transformation to have a physical source column. Keep current firm values available to complex CASE/COALESCE expressions.
- Attempt a bounded target-specific repair for malformed source/SQL output. Keep valid siblings and the best existing draft across retries. If a model/service fails, retain supported deterministic reuse results and provide per-target reasons; never synthesize a mapping only to make a completion counter green.

Retain strict checks for access, identifier ownership, parseable SQL, and valid current Value resolution before execution. Missing historical metadata and confidence thresholds must not be draft-admission gates.

### D. Return usable drafts and evidence-backed dependency suggestions

Retain existing completeness and validation concepts rather than introduce another lifecycle framework. The internal MAPPED flag can continue indicating that a definition exists; it must not serve as proof of executable SQL or business approval.

- Preserve manual/confirmed edits and late edits during an active run. Fill unprotected empty rows with the strongest concrete draft even at low confidence. Keep alternatives and undo behavior.
- Generate all mappings possible with the current graph. For remaining targets, hydrate the actual cited FIR/publication dependency and produce a grouped suggestion containing affected targets, CTE SQL, output columns, parent dependencies, join predicate/type, transformation intent/expression, and evidence/version IDs as available.
- Suggestions may adapt evidenced names to verified current bindings. If the historical join or CTE definition cannot be recovered, show that specific missing dependency; do not invent keys, filters, SQL, or join types. Deduplicate a shared CTE across affected targets.
- Reviewing a suggestion does not mutate the graph. Use existing explicit apply/save controls to add the reviewed dependency, then rerun only affected targets. Preserve unrelated mappings and authored SQL.
- Keep unresolved source IDs and missing-expression markers out of executable SQL. Preserve their repairable proposal details in the draft/suggestion instead. Compile concrete rows only with a visible list of rows that still need work; never silently omit populated rows at publication.
- Use shared definition predicates for draft coverage in both persistence paths and aggregate metadata. `Select...`, `Direct` alone, empty text, and suggestion prose do not count. Valid NULL, zero, false, empty-string constants, and complete expressions do count. Show draft coverage separately from executable readiness and human review.

### E. Repair uploaded-SQL validation, preview, and publication as one flow

Use one captured SQL artifact, query scope, workspace revision, and firm-value revision across validation, preview, and publication. A repair becomes the active artifact only after the existing explicit approval/synchronization flow. Editing SQL, mappings, dependencies, or Values invalidates that receipt.

Preview changes:

- Serialize schema columns and row keys using one exact output-name contract. Add optional SQL-name/target association metadata where needed. Preserve quoted case and literal dots within column names; do not uppercase every label or treat a dotted output alias as a qualified source name. Reject ambiguous associations rather than selecting the first case-insensitive match.
- Render returned values including NULL, false, zero, and empty strings. Missing output-key associations are a preview contract error; reserve source-unavailable wording for unavailable source comparisons. A zero-row result is a valid empty result.
- Resolve comparison references against the approved query's actual lexical scope and relation instances, using the compiler's alias map. Keep CTEs, joins, filters, DISTINCT, grouping and QUALIFY intact. For aggregates/unions where comparison cannot be represented safely, return actual output rows and a precise source-comparison limitation.
- Keep source samples explicitly independent unless the application actually instruments the same output row. Do not claim two separately executed LIMIT queries return matching rows.

Publication changes:

- Preserve imported CTE definition SQL and query-scope metadata in the compiler graph. Add optional `definition_sql` and `query_scope` fields to RelationNode, populated from the already retained derived-source metadata; hydrate older snapshots from their stored SQL/parser contracts.
- Render imported CTEs from their original lexical definitions and dependency order instead of treating every self-contained preview envelope as the authored definition. Preserve nested scopes, self-joins, quoted names, OR predicates, filters and population. Do not broadly weaken AST comparison or ignore changed joins to admit a publication.
- Resolve unqualified physical names using captured database/schema and verified catalog bindings. Compare source dependencies as resolved identities. Preserve original SQL text for audit; ambiguous names remain actionable errors.
- Validate the exact active uploaded/repaired artifact against its synchronized rows, graph, current Values, and actual Snowflake compilation. Where upload SQL cannot be faithfully represented, expose the unsupported construct specifically rather than silently rewriting it.
- Retain atomic version/header/outbox capture, optimistic concurrency, and idempotent retry. Support both updating a version and creating a separate mapping. Preserve complete SQL, rows, CTEs, and evidence for reopening and FIR projection.
- Return typed failures for SQL compilation, stale snapshot, Value binding, missing storage/schema, and publication conflict, with a request ID and available Snowflake query ID. Keep unexpected exceptions logged with the failing stage. Diagnose the screenshot's generic failure against the isolated replay before declaring its exact cause fixed.

### F. Finish the runtime failure diagnosis without redesigning admission

At `thread_persist`, distinguish thread-reference reconciliation from durable request recording. Retain allowlisted exception type, SQL error code/state, query ID, operation name, and correlation IDs before exception replacement. Do not include credentials or parameter values in public errors.

Test expired caller sessions, unavailable storage, Snowflake contention, and failure after thread creation but before dispatch. Retry only where non-dispatch or a terminal remote outcome is established; otherwise reconcile the original operation. Do not clear quarantines or re-POST an uncertain model call. Preserve the imported exact-JSON and validated-result provenance fixes through browser polling and background restart.

## 4. Interfaces and compatibility

Keep existing job APIs, candidate arrays, validation receipts, and suggestion UI. Use additive optional fields:

- RelationNode: imported `definition_sql` and `query_scope` described above.
- MappingSuggestion: a structured dependency proposal with affected target IDs, required CTE/join/transformation content and evidence/publication references. Reuse existing JoinRecommendation and derived-source structures; add CTE/transformation suggestion kinds alongside existing kinds.
- Preview columns: exact row lookup key and optional SQL/target identifier association, while retaining display name and type for older clients.
- Job diagnostics: additive per-target generation/readiness outcome, evidence considered/deferred/used counts, payload measurements, and runtime failure correlation. User-facing text stays focused on mapping review and actionable missing inputs.

Update Python and TypeScript contracts together. Existing snapshots and jobs without new fields remain readable; existing frozen jobs retain their original protocol and integrity validation. New behavior applies to new runs. Any isolated test settings belong to generated test-service configuration, not imported client env files.

## 5. Tests, acceptance, and rollout

### Investigation checks already completed

- 680 selected backend tests passed: 410 initial persistence/FIR/SQL/publication tests, 250 additional semantic/transformation/runtime tests, and 20 fixture/context tests after supplying the existing frontend dependencies. This is not a full-suite result.
- The frontend candidate/preservation selection passed 79 tests, and the upload workflow assertion script passed.
- Local Snowpark objects reproduced quoted schema-name versus row-key mismatch.
- The production comparison-query builder reproduced an alias that is absent from the query scope.
- The real Contacts importer/compiler/publication path rejected a controlled qualified-source/test-Value fixture because of SQL structure mismatch. Snowflake compilation was stubbed in this check; it does not establish live SQL correctness or the screenshot's exact exception.
- No application source, existing environment files, agents, mappings, or deployed services were changed by this investigation.

### Required regression scenarios

| Scenario | Acceptance |
|---|---|
| Current + linked + unlinked FIR | Linked evidence wins appropriate ties; relevant cross-project recipes still generate reviewable drafts. |
| Missing historical grain/type/CRM | Warning retained, candidate reaches generation, unrelated targets complete. |
| BILLINGSTREET / direct NEXTREVIEW | Known current dependencies and expected expressions survive retrieval, generation, persistence and reopen. |
| JIMSHH-dependent NEXTREVIEW | Missing CTE becomes a cited dependency suggestion while other mappings complete. |
| OWNERNAME NULL / firm values | Intentional NULL remains distinct from a missing expression; old firm literals are not copied into a new project. |
| Candidate-only complex rule | Transformation specialist actually runs, or an existing exact executable expression is reused. |
| Evidence annotation failure | Bad quote, agent label, or note size cannot cancel source-mapping calls for otherwise supported targets. |
| Large inventory | More than 12 tables and a 600-column source retain searchable coverage; actual serialized packets respect configured limits. |
| UTF-8 / large evidence | Escaping and multibyte characters are measured; oversized targets split/defer without failing siblings or truncating SQL. |
| Partial failure and restart | Good results survive model/SQL errors, browser refresh, worker restart, stale receipts and zero-call retries. |
| Invalid record ID | Evidence IDs bind uniquely or remain suggestions; no `src:` ID becomes executable SQL. |
| Manual work and counts | Late manual edits win; placeholder-only rows do not inflate coverage; drafts and executable readiness stay distinct. |
| Contacts upload | All 49 authored outputs survive upload, validation, preview, publish, reopen and FIR projection; additional catalog targets remain separate. |
| Household upload | All 35 authored outputs, four CTEs, predicates, literals and current placeholders survive the same lifecycle. |
| Preview | Exact mixed-case/quoted/dotted aliases and NULL/zero/false/empty values render; optional source-comparison failure never hides output rows. |
| Publication modes | Version update and copy both work; stale snapshots conflict cleanly; retry creates one version/outbox event; projection failure is recoverable. |

### Isolated SPCS acceptance

Extend the existing guarded test-account harness rather than create another orchestration system. Use the configured non-client account, a unique scratch schema, separate web/worker services, test mappings and isolated FIR records/admission objects. Use sanitized Contacts/household source fixtures and test firm values. Existing client UAT services, mappings and capacity remain untouched.

Exercise the real browser/API, worker, Snowflake agent, preview SQL, publication transaction, asynchronous FIR projection, and reopen path. Publish test mappings only in that scratch environment, then create a second mapping to prove learned reuse, including a linked and an unlinked project case. Compare app output with direct execution of the identical resolved query under the same caller role/database/schema/Values. Use stable row keys/order for comparisons, not unordered LIMIT row positions.

Repeat representative successful runs and fault cases; record mapping quality against a reviewed expected result, target counts, evidence usage, payload sizes, actual model submissions, phase timings and recovery state. Acceptance requires real source/transformation calls where inference is needed, expected mappings for fixture-resolvable targets, grounded suggestions for absent dependencies, no payload overflow, and no loss of committed/manual work. Deployment readiness alone is insufficient.

Release order: reviewed four-file sync; integrated generation/FIR/context changes; uploaded-SQL and runtime fixes; isolated SPCS acceptance; then a coherent UAT release. Preserve a recorded prior image/config for rollback. Drain/reconcile in-flight work before a version switch, retain recovery inventory, and do not reinterpret existing frozen jobs using the new protocol.

Deliver the change report, regression results, evidence-backed live acceptance results, client patch/package without environment files, and any remaining target-specific business questions. Do not mark the work complete solely because unit tests or deployment passed.
