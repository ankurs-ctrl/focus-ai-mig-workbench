.\scripts\load_client_fir_knowledge.ps1 `
  --env-file .\infra\snowflake\env\client.env `
  --project-id "<PROJECT_ID>" `
  --file ".\client-scripts\mapping.sql" `
  --source-table-hint CLIENT_DB.SOURCE_SCHEMA.SOURCE_TABLE `
  --target-table-hint CLIENT_DB.TARGET_SCHEMA.TARGET_TABLE `
  --create-mapping `
  --publish `
  --process-fir-now
