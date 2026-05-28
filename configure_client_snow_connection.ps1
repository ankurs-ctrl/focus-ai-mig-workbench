param(
    [string]$EnvFile = "",
    [switch]$ForceRecreate
)

$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot "common.ps1")

# Purpose:
# - create or reuse a named Snow CLI connection for the client environment
# - this is where the client AVD externalbrowser login normally happens
# - later scripts only need the saved connection name

if (-not $EnvFile) {
    $EnvFile = Get-DefaultEnvFile
}

$snowExe = Ensure-SnowInstalled
$cfg = Import-DemoEnv -Path $EnvFile

Require-ConfigValues -Config $cfg -RequiredKeys @(
    "SNOWFLAKE_CONNECTION",
    "SNOWFLAKE_ACCOUNT",
    "SNOWFLAKE_USER",
    "SNOWFLAKE_ROLE",
    "SNOWFLAKE_WAREHOUSE",
    "SNOWFLAKE_DATABASE",
    "SNOWFLAKE_SCHEMA",
    "SNOWFLAKE_HOST"
) -EnvFile $EnvFile

$authenticator = if ($cfg.ContainsKey("SNOWFLAKE_AUTHENTICATOR") -and $cfg["SNOWFLAKE_AUTHENTICATOR"]) {
    $cfg["SNOWFLAKE_AUTHENTICATOR"]
} else {
    "externalbrowser"
}

$port = if ($cfg.ContainsKey("SNOWFLAKE_PORT") -and $cfg["SNOWFLAKE_PORT"]) {
    [string]$cfg["SNOWFLAKE_PORT"]
} else {
    ""
}

$region = if ($cfg.ContainsKey("SNOWFLAKE_REGION") -and $cfg["SNOWFLAKE_REGION"]) {
    [string]$cfg["SNOWFLAKE_REGION"]
} else {
    ""
}

try {
    & $snowExe connection test -c $cfg["SNOWFLAKE_CONNECTION"] *> $null
    if ($LASTEXITCODE -eq 0 -and -not $ForceRecreate) {
        Write-Host "Snow connection '$($cfg["SNOWFLAKE_CONNECTION"])' already works. Reusing it."
        exit 0
    }
} catch {
}

if ($ForceRecreate) {
    try {
        & $snowExe connection remove $cfg["SNOWFLAKE_CONNECTION"] --format TABLE
    } catch {
    }
} else {
    try {
        & $snowExe connection remove $cfg["SNOWFLAKE_CONNECTION"] --format TABLE *> $null
    } catch {
    }
}

Write-Host "Creating Snow CLI connection '$($cfg["SNOWFLAKE_CONNECTION"])'"
$connectionArgs = @(
    "connection", "add",
    "--connection-name", $cfg["SNOWFLAKE_CONNECTION"],
    "--account", $cfg["SNOWFLAKE_ACCOUNT"],
    "--user", $cfg["SNOWFLAKE_USER"],
    "--role", $cfg["SNOWFLAKE_ROLE"],
    "--warehouse", $cfg["SNOWFLAKE_WAREHOUSE"],
    "--database", $cfg["SNOWFLAKE_DATABASE"],
    "--schema", $cfg["SNOWFLAKE_SCHEMA"],
    "--host", $cfg["SNOWFLAKE_HOST"],
    "--authenticator", $authenticator,
    "--default",
    "--no-interactive",
    "--format", "TABLE"
)

if ($port) {
    $connectionArgs += @("--port", $port)
}

if ($region) {
    $connectionArgs += @("--region", $region)
}

& $snowExe @connectionArgs

Write-Host ""
Write-Host "Testing connection '$($cfg["SNOWFLAKE_CONNECTION"])'"
& $snowExe connection test -c $cfg["SNOWFLAKE_CONNECTION"]
Write-Host ""
Write-Host "Connection configured successfully."
