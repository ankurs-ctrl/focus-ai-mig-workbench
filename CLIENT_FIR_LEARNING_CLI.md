# Client FIR Learning CLI

`scripts/manage_client_fir_learning.py` manages SQL learning directly through
Snowflake using `infra/snowflake/env/client.env`. It does not require the browser
dialog or enabled scheduled tasks when `process`, `watch --drive`, or `workflow`
is used.

## Complete workflow

Windows:

```powershell
scripts\manage_client_fir_learning.ps1 workflow `
  --file C:\mappings\households.sql `
  --project-id 1101 `
  --target-table FFP_HDP_CRM_MIG_DB_DEV.SCH_REDTAIL_EVERNEST_TARGET.EVERNEST_HH `
  --max-rounds 30
```

This uploads the SQL, resolves tables, prepares/reuses the raw semantic bundle,
creates the durable job, and drives it until it completes or cannot make further
progress. It prints both `asset_id` and `learning_job_id`.

Inspect before approval:

```powershell
scripts\manage_client_fir_learning.ps1 status --job-id <learning_job_id>
```

Approve supported output:

```powershell
scripts\manage_client_fir_learning.ps1 approve `
  --job-id <learning_job_id> `
  --yes `
  --actor ANKURS
```

Or explicitly request approval as part of the complete workflow:

```powershell
scripts\manage_client_fir_learning.ps1 workflow `
  --file C:\mappings\households.sql `
  --project-id 1101 `
  --target-table FFP_HDP_CRM_MIG_DB_DEV.SCH_REDTAIL_EVERNEST_TARGET.EVERNEST_HH `
  --max-rounds 30 `
  --approve `
  --actor ANKURS
```

`--approve` is never implied. It must be supplied explicitly.

## Individual operations

Upload only:

```powershell
scripts\manage_client_fir_learning.ps1 upload `
  --file C:\mappings\households.sql `
  --project-id 1101 `
  --target-table DB.SCHEMA.TARGET
```

For ambiguous or unqualified SQL source names, repeat:

```text
--source-table DB.SCHEMA.SOURCE_ONE
--source-table DB.SCHEMA.SOURCE_TWO
```

List jobs:

```powershell
scripts\manage_client_fir_learning.ps1 list --project-id 1101
```

Process an existing job without Snowflake tasks:

```powershell
scripts\manage_client_fir_learning.ps1 process `
  --job-id <learning_job_id> `
  --max-rounds 30
```

Continuously monitor and actively drive it:

```powershell
scripts\manage_client_fir_learning.ps1 watch `
  --job-id <learning_job_id> `
  --drive `
  --interval 15 `
  --timeout 3600
```

Without `--drive`, `watch` only observes scheduled processing.

## Approval policy

The CLI approves only output belonging to a completed job. It excludes:

- confidence below `0.55`;
- contradicted mappings or inferences;
- inferences and recommendations without evidence;
- recommendations without an action contract;
- bundle drafts whose target, semantic evidence, or context hashes are not
  promotable.

The status output includes every work-item type, attempt count, result, and
error so failed or stalled stages can be diagnosed before approval.
