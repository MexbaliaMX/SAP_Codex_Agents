param(
  [string]$Root = (Get-Location).Path
)

$ErrorActionPreference = "Stop"
$Failures = [System.Collections.Generic.List[string]]::new()

function Add-Failure {
  param([string]$Message)
  $script:Failures.Add($Message) | Out-Null
}

function Test-RequiredPath {
  param([string]$Path)
  $fullPath = Join-Path $Root $Path
  if (-not (Test-Path -LiteralPath $fullPath)) {
    Add-Failure "Missing required path: $Path"
  }
}

$assetRoot = "plugins\sap-codex-deliverables\skills\sap-deliverable-templates\assets\operating-layer"
$requiredFiles = @(
  "$assetRoot\INDEX.md",
  "$assetRoot\registry\AGENT_REGISTRY.md",
  "$assetRoot\automation\automation-candidates.md",
  "$assetRoot\references\full-sap-agents-coverage-plan.md",
  "$assetRoot\references\full-agent-forward-test-report.md"
)

$requiredFiles | ForEach-Object { Test-RequiredPath $_ }

$counts = @(
  @{ Path = "$assetRoot\playbooks"; Expected = 8; Label = "playbooks" },
  @{ Path = "$assetRoot\output-profiles"; Expected = 4; Label = "output profiles" },
  @{ Path = "$assetRoot\client-ready-samples"; Expected = 8; Label = "client-ready sample files" }
)

foreach ($count in $counts) {
  $path = Join-Path $Root $count.Path
  if (-not (Test-Path -LiteralPath $path)) {
    Add-Failure "Missing directory: $($count.Path)"
    continue
  }
  $actual = @(Get-ChildItem -LiteralPath $path -Filter "*.md" -File).Count
  if ($actual -ne $count.Expected) {
    Add-Failure "Expected $($count.Expected) $($count.Label), found $actual"
  }
}

$fullAssetRoot = Join-Path $Root $assetRoot
if (Test-Path -LiteralPath $fullAssetRoot) {
  $files = Get-ChildItem -LiteralPath $fullAssetRoot -Recurse -Filter "*.md" -File
  foreach ($file in $files) {
    $text = Get-Content -Raw -LiteralPath $file.FullName
    if ($text -match "\.agents[\\/]") {
      Add-Failure "Workspace .agents path remains in plugin asset: $($file.FullName)"
    }
    if ($text -match "(?im)\b(TODO|TBD|FIXME)\b") {
      Add-Failure "Unfinished marker found in plugin asset: $($file.FullName)"
    }
    if ($text.Contains([char]7)) {
      Add-Failure "BEL/control character found in plugin asset: $($file.FullName)"
    }
  }
}

if ($Failures.Count -gt 0) {
  Write-Host "Plugin operating-layer asset validation failed:" -ForegroundColor Red
  foreach ($failure in $Failures) {
    Write-Host " - $failure" -ForegroundColor Red
  }
  exit 1
}

Write-Host "Plugin operating-layer asset validation passed." -ForegroundColor Green
Write-Host "Checked plugin-local registry, playbooks, output profiles, client-ready samples, references, and stale workspace paths."
