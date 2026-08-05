# R13 environment delta

Merge these values into the existing client environment. Do not replace the file.

```dotenv
# Safe defaults enabled for the first R13 deployment
PERF_DIAGNOSTICS_V1=true
PREPARED_CONTEXT_CACHE_V2=true
CONTEXT_SINGLEFLIGHT_V1=true
FIR_QUERY_PRUNING_V1=true
TARGET_SCOPED_CACHE_INVALIDATION_V1=true
RELATIONSHIP_CAPABILITY_CACHE_V1=true
RELATIONSHIP_PROC_FAST_GUARDS_V1=true
LOW_CONFIDENCE_JOIN_REVIEW_V1=true
CONVERSATION_MEMORY_V2=true
AUTOSAVE_SINGLEFLIGHT_V1=true
AGENT_STREAM_BATCHING_V1=true
DURABLE_STTM_ROUTE_V1=true

# Keep these shadowed until the rolling acceptance gates pass
SNOWFLAKE_SESSION_LEASE_POOL_V1=false
LEARNING_PARALLEL_V1=false
PREPARE_PARALLEL_V1=false
AUTOSAVE_POSTSAVE_ASYNC_V1=false
PREPARATION_WAREHOUSE_ROUTING_V1=false

# Cost and deployment controls
SNOWFLAKE_PREPARATION_WAREHOUSE=
SNOWFLAKE_PREPARATION_STATEMENT_TIMEOUT_SECONDS=300
COCO_SIDECAR_ENABLED=false
INSTALL_CORTEX_CLI=0
APPLY_CALLER_GRANTS=false
AUTO_MAPPING_COMPUTE_POOL_MIN_NODES=1
AUTO_MAPPING_COMPUTE_POOL_MAX_NODES=2
AUTO_MAPPING_COMPUTE_POOL_AUTO_SUSPEND_SECONDS=300
```

Keep the existing XS warehouse values for CONTROL, EXECUTION, AGENT, and AUTOMAP.
Do not configure a Medium preparation warehouse until the measured route-specific
p95 improvement is at least 30% and its credit gate has been approved.
