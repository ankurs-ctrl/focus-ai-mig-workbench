se these exact PowerShell steps for the case where he has:

bbi-mig-ai-workbench-source.zip.part-00
bbi-mig-ai-workbench-source.zip.part-01
bbi-mig-ai-workbench-source.zip.part-02
bbi-mig-ai-workbench-source.zip.part-03
bbi-mig-ai-workbench-client-replace-2026-05-29.zip
and all of them are inside one folder like bbi_migration.

1. Go to the folder

cd .\bbi_migration
2. Check the files

dir
You should see:

bbi-mig-ai-workbench-source.zip.part-00
bbi-mig-ai-workbench-source.zip.part-01
bbi-mig-ai-workbench-source.zip.part-02
bbi-mig-ai-workbench-source.zip.part-03
bbi-mig-ai-workbench-client-replace-2026-05-29.zip
3. Combine the 4 parts into one zip

cmd /c "copy /b bbi-mig-ai-workbench-source.zip.part-00+bbi-mig-ai-workbench-source.zip.part-01+bbi-mig-ai-workbench-source.zip.part-02+bbi-mig-ai-workbench-source.zip.part-03 bbi-mig-ai-workbench-source.zip"
4. Check that the final zip was created

dir .\bbi-mig-ai-workbench-source.zip
5. Extract the main source zip

Expand-Archive .\bbi-mig-ai-workbench-source.zip -DestinationPath .\bbi-mig-ai-workbench-source -Force
6. Go into the extracted repo

cd .\bbi-mig-ai-workbench-source\bbi-mig-ai-workbench
7. Extract the replacement zip

Expand-Archive ..\..\bbi-mig-ai-workbench-client-replace-2026-05-29.zip -DestinationPath ..\..\replace-pack -Force
8. Copy the replacement files into the repo

Copy-Item ..\..\replace-pack\bbi-mig-ai-workbench\* .\ -Recurse -Force
9. Check whether backend env file exists

dir .\services\sttm-builder\.env.local
If it exists, update it.

If it does not exist, the start script will create it from .env.example, but he must edit it before the app works properly.

10. Open the env file and make sure these are set
In:

services\sttm-builder\.env.local
Set:

LOCAL_DEV_AUTH_ENABLED=true
LOCAL_DEV_BYPASS_METADATA=true

SNOWFLAKE_AUTHENTICATOR=externalbrowser
SNOWFLAKE_ACCOUNT=...
SNOWFLAKE_HOST=...
SNOWFLAKE_USER=...
SNOWFLAKE_ROLE=...
SNOWFLAKE_WAREHOUSE=...
SNOWFLAKE_DATABASE=...
SNOWFLAKE_SCHEMA=...
If not using externalbrowser, then also add:

SNOWFLAKE_PASSWORD=...
11. Start the app
From repo root:

powershell -ExecutionPolicy Bypass -File .\start-ai-workbench-dev.ps1
12. Open these URLs
Frontend:

http://127.0.0.1:3000
Backend docs:

http://127.0.0.1:8000/docs
Backend health:

http://127.0.0.1:8000/health
