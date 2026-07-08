# ─────────────────────────────────────────────────────────────────
# BBI AI Migration Workbench — Client AVD Extract & Setup
# Release: 20260708-1923
# ─────────────────────────────────────────────────────────────────
param(
    [string]$TargetDir = "C:\workbench\bbi-mig-ai-workbench",
    [switch]$SkipExtract,
    [switch]$SkipNpmInstall
)

$ErrorActionPreference = "Stop"
$ReleaseDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Timestamp = "20260708-1923"
$Prefix = "bbi-mig-ai-workbench-$Timestamp"

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host " BBI AI Migration Workbench — Extract & Setup"             -ForegroundColor Cyan
Write-Host " Release: $Timestamp"                                       -ForegroundColor Cyan
Write-Host " Target:  $TargetDir"                                       -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# ── Step 1: Create target directory ──
if (-not $SkipExtract) {
    Write-Host "[1/4] Creating target directory..." -ForegroundColor Yellow
    if (-not (Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    }

    # ── Step 2: Extract all parts ──
    Write-Host "[2/4] Extracting release packages..." -ForegroundColor Yellow
    $parts = @(
        "$Prefix-part1-root-scripts-infra-docs.zip",
        "$Prefix-part2-frontend-source.zip",
        "$Prefix-part3-sttm-builder-service.zip"
    )

    foreach ($part in $parts) {
        $zipPath = Join-Path $ReleaseDir $part
        if (-not (Test-Path $zipPath)) {
            Write-Host "  WARNING: Missing $part" -ForegroundColor Red
            continue
        }
        Write-Host "  Extracting $part..."
        Expand-Archive -Path $zipPath -DestinationPath $TargetDir -Force
    }
    Write-Host "  Done." -ForegroundColor Green
} else {
    Write-Host "[1-2/4] Skipping extraction (already extracted)" -ForegroundColor DarkGray
}

# ── Step 3: Install frontend dependencies ──
if (-not $SkipNpmInstall) {
    Write-Host "[3/4] Installing frontend dependencies..." -ForegroundColor Yellow
    $frontendDir = Join-Path $TargetDir "frontend"
    if (Test-Path $frontendDir) {
        Push-Location $frontendDir
        try {
            npm install --legacy-peer-deps 2>&1 | Out-Null
            Write-Host "  npm install complete." -ForegroundColor Green
        } finally {
            Pop-Location
        }
    }
} else {
    Write-Host "[3/4] Skipping npm install" -ForegroundColor DarkGray
}

# ── Step 4: Setup Python environment for sttm-builder ──
Write-Host "[4/4] Setting up Python environment..." -ForegroundColor Yellow
$sttmDir = Join-Path $TargetDir "services\sttm-builder"
if (Test-Path $sttmDir) {
    Push-Location $sttmDir
    try {
        if (-not (Test-Path ".venv")) {
            python -m venv .venv
        }
        & .\.venv\Scripts\pip install -e ".[dev]" 2>&1 | Out-Null
        Write-Host "  Python environment ready." -ForegroundColor Green
    } catch {
        Write-Host "  WARNING: Python setup failed: $_" -ForegroundColor Red
        Write-Host "  You can set it up manually: cd $sttmDir && python -m venv .venv && .\.venv\Scripts\pip install -e `".[dev]`"" -ForegroundColor DarkYellow
    } finally {
        Pop-Location
    }
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Green
Write-Host " Setup complete!"                                           -ForegroundColor Green
Write-Host ""
Write-Host " Next steps:"
Write-Host "   1. Copy your .env.local to: $sttmDir\.env.local"
Write-Host "   2. Copy client.env to: $TargetDir\infra\snowflake\env\client.env"
Write-Host "   3. Run: cd $TargetDir && .\scripts\start_sttm_backend_local.ps1"
Write-Host "   4. Run: cd $frontendDir && npm run dev"
Write-Host ""
Write-Host " For SPCS deployment:"
Write-Host "   cd $TargetDir"
Write-Host "   .\scripts\deploy_spcs_client_snow.ps1"
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Green
