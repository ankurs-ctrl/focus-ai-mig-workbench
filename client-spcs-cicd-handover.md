# Focus SPCS CI/CD Handover

This document describes the current deployment model for the BBI AI Migration Workbench into a client Snowflake account using Snowpark Container Services (SPCS), with the app deployed as a single public service containing three containers:

- `nginx`
- `frontend`
- `sttm-builder` backend

This is the deployment path currently intended for the client AVD environment. The split auto-mapping worker service exists in the repo, but it is not the path to use for the current client deployment unless explicitly revisited later.

## 1. What gets deployed

The deployed web application is a single SPCS service with:

- a public endpoint exposed by `nginx`
- a Next.js frontend container
- a FastAPI backend container

The service spec template is:

- [infra/snowflake/service-specs/webapp.yaml.tmpl](/infra/snowflake/service-specs/webapp.yaml.tmpl)

The deployment script for the Windows/client single-service flow is:

- [scripts/deploy_spcs_client_snow_single_service.ps1](/scripts/deploy_spcs_client_snow_single_service.ps1)

The service runs with:

- `executeAsCaller: true`

so user-facing Snowflake access is based on SPCS caller-rights behavior.

## 2. Images built and pushed

The deployment builds and pushes three Docker images:

1. `services/sttm-builder`
2. `frontend`
3. `nginx`

These are tagged and pushed to the client Snowflake image registry repository under:

`/<database>/<schema>/<image_repository>/<image_name>:<image_tag>`

The build/push logic is in:

- [scripts/deploy_spcs_client_snow_single_service.ps1](/scripts/deploy_spcs_client_snow_single_service.ps1:203)

## 3. Deployment prerequisites

These must exist before a successful CI/CD deployment.

## 3A. What is typically already created vs what the pipeline still does

In the current client AVD environment, some infrastructure may already exist because we have already attempted deployment there.

That means DevOps should treat the deployment as an **update-capable flow**, not a greenfield-only flow.

### 3A.1 Usually already present after first setup

These are often already created in the client Snowflake account after the first successful or partially successful setup:

- runtime database
- runtime schema
- image repository
- compute pool
- SPCS web service object
- metadata tables
- STTM stored procedures
- Snowflake agents
- external access integration and egress rule, if the Snowflake admin has already created them

### 3A.2 What our scripts still do on every run

The normal deployment flow still performs these steps each time:

- validates the Snow CLI connection
- ensures the compute pool exists using `CREATE COMPUTE POOL IF NOT EXISTS`
- logs into the Snowflake image registry
- builds images
- pushes images
- renders the service spec
- runs service create with `--if-not-exists`
- runs service upgrade to apply the newest spec

So an existing environment is expected. A rerun should update the deployed service rather than requiring a clean rebuild from scratch.

### 3A.3 What is safe to rerun

These steps are intended to be rerunnable:

- tool bootstrap
- Snow CLI connection configuration
- metadata bootstrap
- service deployment script

The metadata bootstrap is designed to refresh or recreate Snowflake-side objects in the configured namespace rather than assuming an empty account.

### 3A.4 What still requires one-time admin involvement

Even in an existing environment, these items still depend on Snowflake-admin-managed setup or grants:

- external access integration
- egress/network rule backing that integration
- grants to use the integration
- grants to use the compute pool
- grants to push to the image repository
- grants to create or upgrade services
- grants required by Cortex agents and caller-rights runtime behavior

### 3.1 Local/runner prerequisites

For a Windows AVD or CI runner:

- Python 3.10+
- Docker Desktop or a working Docker daemon
- outbound access to Snowflake registry and control plane
- Snowflake CLI installed into the repo-local tools venv

Bootstrap script:

- [scripts/bootstrap_client_spcs_tools.ps1](/scripts/bootstrap_client_spcs_tools.ps1)

What it does:

- creates `.client-tools-venv`
- installs `snowflake-cli`
- checks Docker availability

### 3.2 Snowflake prerequisites

The target Snowflake account must already have or allow creation of:

- a runtime warehouse
- a runtime database and schema
- a Snowflake image registry host and repository
- a compute pool
- an external access integration referenced by `SNOWFLAKE_EGRESS_INTEGRATION`
- required agents, procedures, and metadata tables in the runtime namespace

In practice, for the client AVD deployment, some of the above may already exist from prior runs. The important DevOps question is not only "how do we create them", but also "how do we verify they exist and are still aligned with the current `client.env` values".

Metadata/bootstrap script:

- [scripts/bootstrap_sttm_metadata_infra.ps1](/scripts/bootstrap_sttm_metadata_infra.ps1)

This script calls:

- [scripts/bootstrap_sttm_metadata_infra.py](/scripts/bootstrap_sttm_metadata_infra.py)

to create/update Snowflake-side STTM metadata objects, agents, and procedures in the configured database/schema.

### 3.3 Access/grants expected

The deployer role must be able to:

- create or use the compute pool
- push images to the Snowflake image registry
- create and upgrade services
- use the external access integration
- create or update supporting Snowflake metadata objects if bootstrap is run

The runtime app role mapping also needs to be decided:

- `APP_ROLE_ADMIN`
- `APP_ROLE_PUBLISHER`
- `APP_ROLE_VIEWER`

These are application persona roles, not just UI labels. They affect caller-rights behavior in backend sessions.

## 4. Configuration file

The client deployment uses:

- [infra/snowflake/env/client.env.example](/infra/snowflake/env/client.env.example)

Copy it to:

- `infra/snowflake/env/client.env`

### 4.1 Required values

At minimum, the single-service deploy script requires:

- `SNOWFLAKE_CONNECTION`
- `SNOWFLAKE_ACCOUNT`
- `SNOWFLAKE_USER`
- `SNOWFLAKE_ROLE`
- `SNOWFLAKE_WAREHOUSE`
- `SNOWFLAKE_DATABASE`
- `SNOWFLAKE_SCHEMA`
- `SNOWFLAKE_REGISTRY_HOST`
- `SNOWFLAKE_IMAGE_REPOSITORY`
- `SNOWFLAKE_COMPUTE_POOL`
- `WEBAPP_SERVICE_NAME`
- `SNOWFLAKE_EGRESS_INTEGRATION`
- `USERS_TABLE`
- `APP_ROLE_ADMIN`
- `APP_ROLE_PUBLISHER`
- `APP_ROLE_VIEWER`
- `SNOWFLAKE_STTM_BUILDER_AGENT`
- `SNOWFLAKE_SOURCE_MAPPING_AGENT`
- `SNOWFLAKE_WORKBENCH_CONVERSATION_AGENT`

Source:

- [scripts/deploy_spcs_client_snow_single_service.ps1](/scripts/deploy_spcs_client_snow_single_service.ps1:77)

### 4.2 Important runtime values

The single-service backend runtime relies on these object names being correct:

- `USERS_TABLE`
- `SNOWFLAKE_STTM_BUILDER_AGENT`
- `SNOWFLAKE_SOURCE_MAPPING_AGENT`
- `SNOWFLAKE_WORKBENCH_CONVERSATION_AGENT`
- `SNOWFLAKE_SEMANTIC_MODEL_AGENT`
- `SNOWFLAKE_DBT_CONVERSION_AGENT`
- `SNOWFLAKE_RELATIONSHIPS_PROCEDURE`
- `SNOWFLAKE_SEMANTIC_MODEL_TABLE`
- `SNOWFLAKE_DERIVED_SOURCES_TABLE`
- `SNOWFLAKE_RAG_SEARCH_SERVICE`

Example format:

`<DATABASE>.<SCHEMA>.<OBJECT_NAME>`

### 4.3 Values typically left blank

Usually leave these blank for same-origin public SPCS deployment:

- `CORS_ALLOWED_ORIGINS=`
- `AUTO_MAPPING_SERVICE_URL=`

The current client deployment keeps auto-mapping in-process inside the backend container, so `AUTO_MAPPING_SERVICE_URL` should remain empty for this path.

### 4.4 Host/account behavior

The current single-service spec intentionally does not inject `SNOWFLAKE_ACCOUNT` or `SNOWFLAKE_HOST` into the backend container from the service spec, because overriding them inside SPCS can interfere with caller-rights OAuth behavior.

However:

- Snowpark caller-rights session creation and
- Cortex/REST-style calls

do not behave identically, so host handling must be validated carefully when changing backend auth or agent behavior.

## 5. One-time setup flow

For a brand-new client environment, the operational sequence is:

1. Bootstrap local tools
2. Create or refresh Snow CLI connection
3. Bootstrap Snowflake metadata/agents/procedures
4. Build images
5. Push images
6. Render service spec
7. Create service if missing
8. Upgrade service to latest spec
9. Validate health and endpoint availability

### 5.1 Bootstrap tools

Run:

```powershell
.\scripts\bootstrap_client_spcs_tools.ps1
```

This creates `.client-tools-venv` and installs the Snow CLI used by the remaining scripts.

### 5.2 Configure Snow CLI connection

Run:

```powershell
.\scripts\configure_client_snow_connection.ps1
```

Source:

- [scripts/configure_client_snow_connection.ps1](/scripts/configure_client_snow_connection.ps1)

This adds or refreshes a Snow CLI named connection using values from `client.env`.

### 5.3 Bootstrap metadata infra

Run:

```powershell
.\scripts\bootstrap_sttm_metadata_infra.ps1
```

This provisions the STTM metadata objects into the configured database/schema.

## 5A. What our team has already been doing manually

Before handing this to DevOps, our deployment flow has typically involved a mix of script-driven setup and account-specific admin coordination.

### 5A.1 Application-side steps we run

We typically do the following from the repo:

1. populate `infra/snowflake/env/client.env`
2. bootstrap tools
3. configure the Snow CLI connection
4. bootstrap STTM metadata infrastructure
5. deploy the single-service SPCS webapp
6. inspect service/container logs
7. validate the public endpoint and backend APIs

### 5A.2 Snowflake-admin-side steps we depend on

We have also had to coordinate with a Snowflake admin for:

- external access integration creation
- network/egress rule creation
- grants on the external access integration
- compute pool permissions
- image repository permissions
- role-based access needed by the runtime user sessions
- Cortex access roles where applicable

### 5A.3 Why this matters for CI/CD

The pipeline can automate the repo-side steps cleanly, but it cannot invent missing account-level privileges. DevOps will need a clear contract for which account-level prerequisites are pre-created by the Snowflake admin and which steps the pipeline owns.

## 6. Standard deployment flow

The current client single-service deploy command is:

```powershell
.\scripts\deploy_spcs_client_snow_single_service.ps1 -EnvFile .\infra\snowflake\env\client.env
```

Optional switches:

- `-ImageTag <tag>`
- `-SkipBuild`
- `-SkipLogin`

Source:

- [scripts/deploy_spcs_client_snow_single_service.ps1](/scripts/deploy_spcs_client_snow_single_service.ps1)

### 6.0 Important deployment behavior for existing environments

This script is not limited to first-time deployment.

It does both of the following:

- creates the service if it does not exist
- upgrades the service even if it already exists

That is why it is the correct operational entry point for both:

- initial client deployment
- subsequent client redeployments

DevOps should treat it as an idempotent deployment wrapper around image build/push plus service reconciliation.

### 6.1 What the script actually does

The script:

1. Loads `client.env`
2. Validates required keys
3. Tests the Snow CLI connection
4. Ensures the compute pool exists
5. Logs Docker into the Snowflake image registry through Snow CLI
6. Exports environment variables for spec rendering
7. Builds and pushes the three images
8. Renders the service spec template
9. Runs `snow spcs service create ... --if-not-exists`
10. Runs `snow spcs service upgrade ...`
11. Lists service endpoints

Key references:

- compute pool creation:
  [deploy_spcs_client_snow_single_service.ps1](/scripts/deploy_spcs_client_snow_single_service.ps1:147)
- Docker login:
  [deploy_spcs_client_snow_single_service.ps1](/scripts/deploy_spcs_client_snow_single_service.ps1:150)
- image build/push:
  [deploy_spcs_client_snow_single_service.ps1](/scripts/deploy_spcs_client_snow_single_service.ps1:203)
- spec render:
  [deploy_spcs_client_snow_single_service.ps1](/scripts/deploy_spcs_client_snow_single_service.ps1:228)
- create/upgrade:
  [deploy_spcs_client_snow_single_service.ps1](/scripts/deploy_spcs_client_snow_single_service.ps1:233)

## 7. Service spec rendering

Template rendering is done by:

- [scripts/render_spcs_spec.py](/scripts/render_spcs_spec.py)

Important behavior:

- it uses `Template.safe_substitute(os.environ)`
- unresolved variables are not rejected
- unresolved placeholders remain in the rendered file as `${VAR_NAME}`

This is operationally important for CI/CD.

### 7.1 Required validation step

After rendering the spec, the pipeline should validate that the rendered YAML contains no unresolved placeholders.

Recommended check:

- fail the pipeline if the rendered spec still contains `${`

The rendered single-service spec is written to:

- `artifacts/client-spcs-single-service/webapp.<image_tag>.yaml`

## 8. Recommended CI/CD stages

Suggested pipeline stages for the client AVD path:

1. Checkout source
2. Restore or create Python tools venv
3. Install Snow CLI into `.client-tools-venv`
4. Validate `client.env` / injected secret variables
5. Configure Snow CLI connection
6. Optional: bootstrap metadata infra
7. Docker login to Snowflake image registry
8. Build `sttm-builder`
9. Build `frontend`
10. Build `nginx`
11. Push all images
12. Render `webapp.yaml`
13. Validate rendered spec contains no unresolved placeholders
14. Create service if needed
15. Upgrade service
16. Check service/container status
17. Check endpoint availability

## 9. Post-deploy checks

After deployment, DevOps should run:

```powershell
snow spcs service status <service_name> -c <connection> --database <db> --schema <schema>
snow spcs service list-containers <service_name> -c <connection> --database <db> --schema <schema>
snow spcs service list-endpoints <service_name> -c <connection> --database <db> --schema <schema>
```

If troubleshooting is needed:

```powershell
snow spcs service logs <service_name> -c <connection> --database <db> --schema <schema> --container-name sttm-builder
snow spcs service logs <service_name> -c <connection> --database <db> --schema <schema> --container-name frontend
snow spcs service logs <service_name> -c <connection> --database <db> --schema <schema> --container-name nginx
```

## 9A. Validation checklist for an already-provisioned client account

When the client account already contains prior deployment objects, DevOps should verify these items before assuming a code problem:

1. `client.env` still points to the intended database/schema/warehouse/service/image repository
2. the service spec rendered for this run contains no unresolved placeholders
3. the image tags referenced by the rendered spec match the images that were just pushed
4. the external access integration name in `client.env` exists and is granted
5. the compute pool name in `client.env` exists and is usable by the deployer role
6. all runtime object names in `client.env` still match the namespace actually bootstrapped in Snowflake
7. the service was upgraded after the latest images were pushed

## 10. Known operational pitfalls

### 10.1 Docker Desktop provenance / attestation

We have seen pushes fail with a registry authorization-looking error when Docker Desktop emits attestation/provenance artifacts that Snowflake registry rejects.

Symptoms:

- `Authorization Failure`
- image build succeeds
- image push fails

Mitigations:

- disable provenance/attestation in Docker build behavior
- or set:

```powershell
$env:BUILDX_NO_DEFAULT_ATTESTATIONS = "1"
```

before running the deployment script

### 10.2 Missing external access integration

Service creation can fail if the external access integration referenced by:

- `SNOWFLAKE_EGRESS_INTEGRATION`

does not exist or is not granted to the deployer role/service.

This must be created by the appropriate Snowflake admin role if not already available.

### 10.3 Unresolved service spec placeholders

Because rendering uses `safe_substitute`, a missing environment variable does not fail fast.

Instead it silently leaves placeholders in the rendered spec.

This can cause confusing runtime failures later.

The CI/CD pipeline should explicitly scan the rendered YAML for unresolved `${...}` values.

### 10.4 Image registry login vs Docker login state

The intended registry auth path is:

```powershell
snow spcs image-registry login -c <connection>
```

The deploy script already uses that path. Pipeline steps should not assume a manual Docker Hub login is sufficient.

### 10.5 Runtime object mismatches

If any of these object names are wrong in `client.env`, the app may start but fail later:

- users table
- relationship procedure
- source mapping agent
- conversation agent
- semantic model agent
- dbt conversion agent
- search service

These should be treated as mandatory configuration, not optional hints.

## 11. Current client deployment notes

For the current client rollout, the intended path is:

- single public SPCS service
- no separate auto-mapping worker service
- same-origin frontend to backend through `nginx`
- backend caller-rights behavior through SPCS ingress

Also note:

- this client path assumes we may redeploy into an account where parts of the infrastructure already exist
- the current operational model is "reconcile and upgrade", not "tear down and recreate everything"
- if something breaks, we should first check for config/object drift between `client.env`, the bootstrapped Snowflake objects, and the currently deployed service spec

The deploy script itself states:

- `Auto-mapping remains in-process inside the backend container.`

Source:

- [scripts/deploy_spcs_client_snow_single_service.ps1](/scripts/deploy_spcs_client_snow_single_service.ps1:270)

## 12. Minimum handoff items DevOps needs

DevOps should receive:

1. the repository or release package
2. the exact `client.env` values for the client account
3. the required Snowflake admin-created integrations and grants
4. confirmation of compute pool name
5. confirmation of image repository name
6. the service name to deploy
7. confirmation whether metadata bootstrap is allowed in pipeline or done out-of-band
8. a list of what is already provisioned in the client account today
9. a list of what the Snowflake admin must own outside the pipeline
10. the exact rerun command used for redeployment

## 12A. What we should explicitly tell DevOps is already done

For the current client environment, we should communicate whether each of the following is already in place:

- Snow CLI connection name
- runtime database
- runtime schema
- runtime warehouse
- compute pool
- image repository
- external access integration
- egress/network rule
- webapp service name
- STTM metadata bootstrap completion
- agent creation/bootstrap completion

This reduces the chance that DevOps treats a partially prepared client account as a blank environment.

## 12B. What DevOps will still require from us

We should provide DevOps with:

- the exact `client.env` contract
- the expected namespace layout
- the image naming convention
- the service name convention
- whether bootstrap must run before every deploy or only when metadata changes
- which Snowflake admin-managed resources are prerequisites
- which post-deploy API checks indicate success

## 13. Recommended follow-up improvements

These are worth adding to the pipeline or scripts:

1. Rendered spec validation that fails on unresolved `${...}`
2. A preflight Snowflake SQL/grants check
3. A post-deploy smoke test hitting:
   - `/health`
   - `/api/v1/auth/session`
   - `/api/v1/table-selection/databases`
4. Explicit Docker build flags if provenance issues continue
5. Optional artifact upload of rendered spec per deployment

## 14. Primary files for DevOps reference

- [scripts/bootstrap_client_spcs_tools.ps1](/scripts/bootstrap_client_spcs_tools.ps1)
- [scripts/configure_client_snow_connection.ps1](/scripts/configure_client_snow_connection.ps1)
- [scripts/bootstrap_sttm_metadata_infra.ps1](/scripts/bootstrap_sttm_metadata_infra.ps1)
- [scripts/deploy_spcs_client_snow_single_service.ps1](/scripts/deploy_spcs_client_snow_single_service.ps1)
- [scripts/render_spcs_spec.py](/scripts/render_spcs_spec.py)
- [infra/snowflake/env/client.env.example](/infra/snowflake/env/client.env.example)
- [infra/snowflake/service-specs/webapp.yaml.tmpl](/infra/snowflake/service-specs/webapp.yaml.tmpl)
