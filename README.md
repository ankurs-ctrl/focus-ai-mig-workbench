cmd /c "copy /b bbi-mig-ai-workbench-source.zip.part-00+bbi-mig-ai-workbench-source.zip.part-01+bbi-mig-ai-workbench-source.zip.part-02+bbi-mig-ai-workbench-source.zip.part-03 bbi-mig-ai-workbench-source.zip"

To rebuild the source zip from parts:

cmd /c copy /b bbi-mig-ai-workbench-source.zip.part-00+bbi-mig-ai-workbench-source.zip.part-01+bbi-mig-ai-workbench-source.zip.part-02+bbi-mig-ai-workbench-source.zip.part-03 bbi-mig-ai-workbench-source.zip
Expand-Archive .\bbi-mig-ai-workbench-source.zip -DestinationPath .\bbi-mig-ai-workbench-source
cd .\bbi-mig-ai-workbench-source\bbi-mig-ai-workbench
For the small replacement bundle:

Expand-Archive .\bbi-mig-ai-workbench-client-replace-2026-05-29.zip -DestinationPath .\replace-pack
Copy-Item .\replace-pack\bbi-mig-ai-workbench\* .\bbi-mig-ai-workbench\ -Recurse -Force
For semantic prewarm on Windows PowerShell:

cd .\bbi-mig-ai-workbench
.\services\sttm-builder\.venv\Scripts\python.exe .\scripts\prewarm_semantic_context_bundle.py `
  --source-table BBI_STTM_TEST_DB.DL_AMOUNT.LOAN_INCOME_AMOUNT_CALCULATION `
  --source-table BBI_STTM_TEST_DB.DL_AMOUNT.NOTE `
  --target-table BBI_STTM_TEST_DB.DW_OPS.LOAN_INCOME_AMOUNT_CALCULATION `
  --requested-level L3_MAPPING_ENRICHED
If using a custom relationships file:

.\services\sttm-builder\.venv\Scripts\python.exe .\scripts\prewarm_semantic_context_bundle.py `
  --source-table ... `
  --source-table ... `
  --target-table ... `
  --relationships-file .\relationships.json
And the normal local run remains:

powershell -ExecutionPolicy Bypass -File .\start-ai-workbench-dev.ps1
