# SQL-to-FIR Bundle Upgrade — Cumulative r7 to r9

This package is for a client AVD currently running:

`20260724-warehouse-cost-rollover-client-avd-r7`

It contains the full r8 source overlay plus all subsequent r9 SQL-to-FIR,
semantic-bundle, preview, FIR approval, DDL, bootstrap, and deployment changes.
The newest r9 version wins wherever the releases overlap.

## Upgrade

1. Back up the client checkout and Snowflake metadata schema.
2. Extract this ZIP into the repository root and overwrite matching files.
3. Merge `CLIENT_ENV_DELTA.md` into the existing client environment file.
4. Record the current FIR task state.
5. Run `scripts/bootstrap_sttm_metadata_infra.ps1`.
6. Run `scripts/deploy_spcs_client_snow_safe.ps1`.
7. Verify the new tables and procedures, then resume the FIR task graph using
   the rendered `infra/snowflake/fir_system/tasks/fir_tasks_resume.sql`.

The bootstrap re-applies task definitions, which leaves replaced tasks
suspended. Streams do not have a suspended/resumed state.

Verify at minimum:

```sql
SHOW TABLES LIKE 'TBL_FIR_TARGET_MAPPING_PATTERNS' IN SCHEMA <metadata_namespace>;
SHOW TABLES LIKE 'TBL_SEMANTIC_BUNDLE_VERSIONS' IN SCHEMA <metadata_namespace>;
SHOW PROCEDURES LIKE 'SP_FIR_PROCESS_LEARNING_QUEUE' IN SCHEMA <metadata_namespace>;
SHOW TASKS LIKE 'TSK_FIR_%' IN SCHEMA <metadata_namespace>;
```

For SELECT-only uploads, provide a fully qualified target hint or select the
target after applying the preview. After a learning job completes, an
administrator can approve its supported output with:

`POST /workbench/fir/jobs/{learning_job_id}/approve-generated`

For an end-to-end task-independent workflow, use:

```powershell
scripts\manage_client_fir_learning.ps1 workflow `
  --file C:\mappings\mapping.sql `
  --project-id 1101 `
  --target-table DB.SCHEMA.TARGET `
  --max-rounds 30
```

See `docs/CLIENT_FIR_LEARNING_CLI.md` for status, watch, processing, and
explicit approval commands.
