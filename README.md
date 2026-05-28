What to do now
Follow this exact fix sequence.

Log out Docker from that registry host:
docker logout MHSUEJT-GD01711.registry.snowflakecomputing.com
Re-login using Snow CLI:
.\.client-tools-venv\Scripts\snow.exe spcs image-registry login -c client-spcs-demo
Immediately retry push.
If it still fails, the next strongest explanation is authorization to the repository, not login.

What to verify in Snowflake
Run:

.\.client-tools-venv\Scripts\snow.exe sql -c client-spcs-demo -q "SHOW IMAGE REPOSITORIES IN SCHEMA FFP_HDP_DLAB_DB_DEV.SCH_STTM_METADATA;"
You want to confirm:

AI_WORKBENCH_DEV_IMAGES exists
it exists in exactly FFP_HDP_DLAB_DB_DEV.SCH_STTM_METADATA
Then ask/check whether the deploy role has permission to use/push to that repo.

Key interpretation of this specific error
If the repository path were wrong, you’d more likely see not found or repo resolution issues.
If the build were wrong, failure would happen before push.
Because the registry explicitly says Authorization Failure, this is almost certainly auth/permission on the registry operation itself.

Important note about your script
The script message:

Image push complete.
is false for this run.
The script currently does not stop correctly after native Docker push failure in PowerShell. So trust:

the Docker push output
not the final success line
Best client-facing explanation
If they ask what failed:

“The container build succeeded.”
“The registry push failed due to registry authorization.”
“That means the remaining issue is authz to publish into the Snowflake image repository, not the app or deployment model.”
My recommended immediate next command

docker logout MHSUEJT-GD01711.registry.snowflakecomputing.com
.\.client-tools-venv\Scripts\snow.exe spcs image-registry login -c client-spcs-demo
