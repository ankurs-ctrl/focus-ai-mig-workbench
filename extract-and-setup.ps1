# BBI AI Migration Workbench - Client AVD Extract & Setup
param(
    [string]$TargetDir = "C:\workbench\bbi-mig-ai-workbench",
    [switch]$SkipExtract,
    [switch]$SkipNpmInstall
)

$ErrorActionPreference = "Stop"
$ReleaseDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Timestamp = "20260716-184506"
$Prefix = "bbi-mig-ai-workbench-$Timestamp"

Write-Host "BBI AI Migration Workbench release $Timestamp" -ForegroundColor Cyan
Write-Host "Target: $TargetDir" -ForegroundColor Cyan

if (-not $SkipExtract) {
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    foreach ($part in @(
        "$Prefix-part1-root-scripts-infra-docs.zip",
        "$Prefix-part2-frontend-source.zip",
        "$Prefix-part3-sttm-builder-service.zip"
    )) {
        $zipPath = Join-Path $ReleaseDir $part
        if (-not (Test-Path $zipPath)) { throw "Missing release part: $part" }
        Expand-Archive -Path $zipPath -DestinationPath $TargetDir -Force
    }
}

$frontendDir = Join-Path $TargetDir "frontend"
if (-not $SkipNpmInstall -and (Test-Path $frontendDir)) {
    Push-Location $frontendDir
    try { npm ci } finally { Pop-Location }
}

$sttmDir = Join-Path $TargetDir "services\sttm-builder"
if (Test-Path $sttmDir) {
    Push-Location $sttmDir
    try {
        if (-not (Test-Path ".venv")) { python -m venv .venv }
        & .\.venv\Scripts\pip install -e ".[dev]"
    } finally { Pop-Location }
}

Write-Host ""
Write-Host "Next steps:" -ForegroundColor Green
Write-Host "1. Create infra\snowflake\env\client.env from client.env.example."
Write-Host "2. Create services\sttm-builder\.env.local for local execution if needed."
Write-Host "3. Run scripts\bootstrap_sttm_metadata_infra.ps1 to deploy metadata, FIR, search, tasks, and agents."
Write-Host "4. Verify FIR tasks, then resume them using infra\snowflake\fir_system\tasks\fir_tasks_resume.sql."
Write-Host "5. Create and publish historical mappings with scripts\load_client_fir_knowledge.py."
Write-Host "6. Deploy SPCS with scripts\run_client_spcs_browser_deploy.ps1."
Write-Host "   This deploys the main workbench and the separate AGT_SOURCE_MAPPING auto-mapping worker service."
