# R14 Backend Payload, Cache, and Storage Reliability Overlay

Apply this archive over the R13 client AVD source tree.

This is a backend-only overlay. It intentionally excludes frontend source files,
frontend Dockerfiles, backend Dockerfiles, tests, local environments, credentials,
build caches, logs, and older release packages.

Included changes:

- Cortex outbound-payload budgeting and safe oversize retry behavior.
- Target-scoped Auto-Mapping payload compaction.
- Typed workspace hydration.
- Prepared/learning cache hardening and cache diagnostics.
- Access-scoped backend response caching and single-flight reads.
- Five-minute sliding-idle project/dashboard summaries.
- Fifteen-second recommendation/evaluation cache.
- Bulk STTM source persistence and safer bound JSON writes.
- FIR semantic-version SQL bind correction and deployment variable updates.
- Low-confidence join review disabled by default.

Deployment notes:

1. Extract at the repository root and allow the listed files to overwrite R13.
2. Merge the new variables from `infra/snowflake/env/client.env.example` into the
   real `client.env`; do not replace credentials or client-specific values.
3. Rebuild and redeploy the backend services/specifications using the safe client
   deployment script.
4. A full metadata bootstrap is not required. The corrected
   `sp-fir-create-semantic-version.sql` is included for controlled procedure
   redeployment if the client environment does not already contain that correction.

Validated locally with 299 backend unit tests passing.
