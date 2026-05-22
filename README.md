Identify all attributes across STTM projects that use conditional transformation logic or calculated fields, and provide their source columns, data types, and associated project versions.


ALTER TABLE FFP_HDP_DLAB_DB_DEV.SCH_STTM_METADATA.TBL_SEMANTIC_BUNDLES
ADD COLUMN IF NOT EXISTS ANALYST_TOOL_NAME STRING;
