# R13 safe-performance client AVD deployment

This is a cumulative overlay from the R7 baseline and includes R8 through R13.
It can be extracted over the currently deployed R12 workspace.

R13 adds durable prepared-context caching, FIR query pruning, faster relationship
discovery, review-only low-confidence joins, reliable conversation persistence,
autosave de-duplication, smoother agent streaming, durable saved-mapping routes,
optional bounded concurrency, workload-aware warehouse routing, and rolling
performance/credit reporting.

## Safe deployment sequence

1. Back up the client workspace. Preserve the existing
   `infra/snowflake/env/client.env`; do not replace it with the example file.
2. Extract the ZIP at the repository root.
3. Apply only the R13 Snowflake objects:

   ```powershell
   .\scripts\bootstrap_sttm_metadata_infra.ps1 `
     -EnvFile ".\infra\snowflake\env\client.env" `
     -PerformanceR13Only
   ```

   This mode creates the async-job table and installs the V2 relationship and
   FIR recommendation procedures. It does not deploy agents, tasks, streams,
   stages, skills, or grants, and it does not suspend existing tasks.
4. Add the environment values from `CLIENT_ENV_DELTA.md` to the existing
   `client.env`. Keep the four shadow features disabled initially.
5. Rebuild and deploy the services. Do not use `-SkipBuild` because backend,
   frontend, and Docker build behavior changed:

   ```powershell
   .\scripts\deploy_spcs_client_snow_safe.ps1 `
     -EnvFile ".\infra\snowflake\env\client.env"
   ```

6. Hard-refresh the browser after the services are healthy.

The deployment script does not apply grants unless the separately controlled
`APPLY_CALLER_GRANTS=true` option is explicitly enabled. Leave it false in the
client environment.

## Smoke test

1. Open an existing STTM directly through `/sttm/builder/{id}` and confirm its
   target columns, mappings, hardcoded values, relationships, and derived sources load.
2. Return to table selection and reopen Mapping; the saved workspace must remain intact.
3. Load the diagnostics endpoint as an authenticated user and confirm prepared-cache
   metrics appear and conversation memory reports its runtime write capability.
4. Repeat the same selection twice and confirm the second preparation is a cache hit.
5. Confirm high-confidence joins remain active and low-confidence joins appear only
   under review; they must not enter generated SQL until approved.
6. Run Auto-map, validation, DBT conversion, and test generation once.
7. Confirm the existing FIR tasks remain in their pre-deployment state.

## Rolling report

Run this from the repository root after representative traffic:

```powershell
.\.client-tools-venv\Scripts\python.exe `
  .\scripts\report_workbench_performance.py `
  --env-file ".\infra\snowflake\env\client.env" `
  --days 7 `
  --output ".\artifacts\performance-r13.json"
```

Use `--compare <previous-report.json>` to report rolling p95 changes. Snowflake
`ACCOUNT_USAGE` can lag, so do not treat an immediately empty report as failure.

## Rollback

Each behavioral optimization has an independent environment flag. Disable the
specific flag and redeploy; the V1 FIR and relationship procedure fallbacks remain
available. The new async-job table is additive and does not need to be dropped.
