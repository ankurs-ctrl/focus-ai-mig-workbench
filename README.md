Run these exact commands from the bundle root.

Put Snow CLI on PATH for this PowerShell session:
$env:Path = "$PWD\.client-tools-venv\Scripts;$env:Path"
Verify Snow CLI works:
snow --version
Verify the Snowflake connection works:
snow connection test -c client-spcs-demo
Re-login Docker to Snowflake registry:
snow spcs image-registry login -c client-spcs-demo
Make sure Docker is running:
docker ps
Retry the image push:
.\deploy\build_and_push_demo_image.ps1 -EnvFile .\deploy\client.streamlit-demo.env
If it still fails
Then the next likely issue is wrong target path or missing permission on the repo. Check these env values:

Select-String -Path .\deploy\client.streamlit-demo.env -Pattern "SNOWFLAKE_REGISTRY_HOST|SNOWFLAKE_DATABASE|SNOWFLAKE_SCHEMA|SNOWFLAKE_IMAGE_REPOSITORY|IMAGE_TAG"
You should not have placeholders like:

your_image_repository
your_org-your_account
What success looks like

snow spcs image-registry login finishes successfully
docker push uploads layers
final line shows a digest like:
sha256:...
If you want the one-line summary:

Main error = Docker registry auth to Snowflake is invalid or missing
Fix = re-add Snow CLI to PATH, run snow spcs image-registry login -c client-spcs-demo, then rerun push




20:12
