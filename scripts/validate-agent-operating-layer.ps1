param(
  [string]$Root = (Get-Location).Path
)

$ErrorActionPreference = "Stop"

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

function Read-Text {
  param([string]$Path)
  $fullPath = Join-Path $Root $Path
  if (Test-Path -LiteralPath $fullPath) {
    return Get-Content -Raw -LiteralPath $fullPath
  }
  return ""
}

$Failures = [System.Collections.Generic.List[string]]::new()

$registry = ".agents\AGENT_REGISTRY.md"
$automation = ".agents\automation-candidates.md"
$forwardReport = "docs\validation\full-agent-forward-test-report.md"

$playbooks = @(
  ".agents\playbooks\grow-fast-first-wave.md",
  ".agents\playbooks\fit-to-standard-workshop.md",
  ".agents\playbooks\process-diagnostic.md",
  ".agents\playbooks\technical-readiness-review.md",
  ".agents\playbooks\go-live-readiness.md",
  ".agents\playbooks\hypercare-triage.md",
  ".agents\playbooks\development-code-review.md",
  ".agents\playbooks\integration-transport-readiness.md"
)

$profiles = @(
  ".agents\output-profiles\INDEX.md",
  ".agents\output-profiles\executive-spanish.md",
  ".agents\output-profiles\technical-working-notes.md",
  ".agents\output-profiles\evidence-bound-audit.md"
)

$clientReadySamples = @(
  ".agents\samples\client-ready\INDEX.md",
  ".agents\samples\client-ready\o2c-mexico-fit-to-standard-client-ready.md",
  ".agents\samples\client-ready\r2r-close-process-diagnostic-client-ready.md",
  ".agents\samples\client-ready\btp-extension-technical-readiness-client-ready.md",
  ".agents\samples\client-ready\s4hana-go-live-readiness-client-ready.md",
  ".agents\samples\client-ready\hypercare-triage-client-ready.md",
  ".agents\samples\client-ready\ui5-cap-development-review-client-ready.md",
  ".agents\samples\client-ready\integration-suite-transport-readiness-client-ready.md",
  ".agents\samples\client-ready\s4hana-authorization-sod-client-ready.md"
)

$templateRefs = @(
  ".agents\templates\fit-to-standard-delta-log.md",
  ".agents\templates\process-diagnostic-summary.md",
  ".agents\templates\technical-readiness-review.md",
  ".agents\templates\go-live-readiness-checklist.md",
  ".agents\templates\hypercare-triage-table.md",
  ".agents\templates\integration-transport-readiness.md",
  ".agents\templates\ui5-quality-review.md",
  ".agents\templates\btp-platform-readiness.md",
  ".agents\templates\identity-security-readiness.md"
)

@($registry, $automation, $forwardReport) + $playbooks + $profiles + $clientReadySamples + $templateRefs | ForEach-Object {
  Test-RequiredPath $_
}

$playbookDir = Join-Path $Root ".agents\playbooks"
if (Test-Path -LiteralPath $playbookDir) {
  $actualPlaybooks = @(Get-ChildItem -LiteralPath $playbookDir -Filter "*.md" -File)
  if ($actualPlaybooks.Count -ne 8) {
    Add-Failure "Expected 8 playbooks, found $($actualPlaybooks.Count)"
  }
}

$profileDir = Join-Path $Root ".agents\output-profiles"
if (Test-Path -LiteralPath $profileDir) {
  $actualProfiles = @(Get-ChildItem -LiteralPath $profileDir -Filter "*.md" -File)
  if ($actualProfiles.Count -ne 4) {
    Add-Failure "Expected 4 output profile files, found $($actualProfiles.Count)"
  }
}

$clientReadyDir = Join-Path $Root ".agents\samples\client-ready"
if (Test-Path -LiteralPath $clientReadyDir) {
  $actualClientReadySamples = @(Get-ChildItem -LiteralPath $clientReadyDir -Filter "*.md" -File)
  if ($actualClientReadySamples.Count -ne 9) {
    Add-Failure "Expected 9 client-ready sample files including INDEX.md, found $($actualClientReadySamples.Count)"
  }
}

$registryText = Read-Text $registry
foreach ($path in $playbooks + $profiles + @($automation)) {
  $displayPath = $path.Replace("\", "/")
  $windowsPath = $path
  if (($registryText -notlike "*$displayPath*") -and ($registryText -notlike "*$windowsPath*")) {
    Add-Failure "Registry does not reference: $path"
  }
}

$automationText = Read-Text $automation
foreach ($requiredPhrase in @("MCP servers remain disabled", "Hooks remain disabled", "Tenant-connected execution remains blocked")) {
  if ($automationText -notlike "*$requiredPhrase*") {
    Add-Failure "Automation candidates file missing safety phrase: $requiredPhrase"
  }
}

$forwardText = Read-Text $forwardReport
foreach ($scenario in @("O2C Mexico fit-to-standard", "Deploy go/no-go readiness", "Integration Suite transport readiness")) {
  if ($forwardText -notlike "*$scenario*") {
    Add-Failure "Forward-test report missing scenario: $scenario"
  }
}

$operatingLayerFiles = @($registry, $automation, $forwardReport) + $playbooks + $profiles + $clientReadySamples
foreach ($path in $operatingLayerFiles) {
  $text = Read-Text $path
  if ($text -match "(?im)\b(TODO|TBD|FIXME)\b") {
    Add-Failure "Unfinished marker found in $path"
  }
}

if ($Failures.Count -gt 0) {
  Write-Host "Agent operating-layer validation failed:" -ForegroundColor Red
  foreach ($failure in $Failures) {
    Write-Host " - $failure" -ForegroundColor Red
  }
  exit 1
}

Write-Host "Agent operating-layer validation passed." -ForegroundColor Green
Write-Host "Checked: 1 registry, 8 playbooks, 4 output profile files, 9 client-ready sample files, controlled automation notes, forward-test report, and template references."
