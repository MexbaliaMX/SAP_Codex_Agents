param(
  [string]$Root = (Get-Location).Path
)

$ErrorActionPreference = "Stop"
$Failures = [System.Collections.Generic.List[string]]::new()

function Add-Failure {
  param([string]$Message)
  $script:Failures.Add($Message) | Out-Null
}

function Read-Text {
  param([string]$Path)
  $fullPath = Join-Path $Root $Path
  if (Test-Path -LiteralPath $fullPath) {
    return Get-Content -Raw -LiteralPath $fullPath
  }
  return ""
}

function Get-RepoFileList {
  Push-Location $Root
  try {
    $files = @(git ls-files --cached --others --exclude-standard 2>$null)
    if ($LASTEXITCODE -eq 0 -and $files.Count -gt 0) {
      return $files
    }
  }
  finally {
    Pop-Location
  }

  return Get-ChildItem -LiteralPath $Root -Recurse -File |
    Where-Object { $_.FullName -notmatch "\\.git\\" } |
    ForEach-Object { [System.IO.Path]::GetRelativePath($Root, $_.FullName) }
}

function Test-JsonFile {
  param([string]$Path)
  $text = Read-Text $Path
  if ([string]::IsNullOrWhiteSpace($text)) {
    Add-Failure "Missing or empty JSON file: $Path"
    return $null
  }
  try {
    return $text | ConvertFrom-Json
  }
  catch {
    Add-Failure "Invalid JSON file: $Path"
    return $null
  }
}

$repoFiles = @(Get-RepoFileList)
$normalizedFiles = @($repoFiles | ForEach-Object { $_.Replace("\", "/") })

$operatingLayerRoots = @(
  ".agents/AGENT_REGISTRY.md",
  ".agents/automation-candidates.md",
  ".agents/playbooks/",
  ".agents/output-profiles/",
  ".agents/samples/client-ready/",
  "docs/validation/full-agent-forward-test-report.md",
  "plugins/sap-codex-deliverables/skills/sap-deliverable-templates/assets/operating-layer/"
)

foreach ($path in $normalizedFiles) {
  foreach ($pattern in @("private-*", "customer-*", "*-confidential-*", "*-nda-*")) {
    if ((Split-Path -Leaf $path) -like $pattern) {
      Add-Failure "Private/customer artifact filename pattern is not publish-safe: $path"
    }
  }

  $fullPath = Join-Path $Root $path
  if (-not (Test-Path -LiteralPath $fullPath)) {
    continue
  }

  $isOperatingLayerFile = $false
  foreach ($rootPath in $operatingLayerRoots) {
    if ($path -eq $rootPath -or $path.StartsWith($rootPath)) {
      $isOperatingLayerFile = $true
      break
    }
  }

  $extension = [System.IO.Path]::GetExtension($path).ToLowerInvariant()
  $textExtensions = @(".md", ".ps1", ".json", ".toml", ".yaml", ".yml", ".xml", ".groovy", ".prop", ".propdef", ".abap", ".sql", ".cds", ".js", ".ts", ".tmpl")
  if ($textExtensions -contains $extension) {
    try {
      $text = Get-Content -Raw -LiteralPath $fullPath
      if ($text -match "(?<!r)eferences[\\/]") {
        Add-Failure "Broken references path found in $path"
      }
      if ($isOperatingLayerFile -and $text -match "(?im)\b(TODO|TBD|FIXME)\b") {
        Add-Failure "Unfinished marker found in operating-layer file: $path"
      }
    }
    catch {
      Add-Failure "Could not read text file during hygiene scan: $path"
    }
  }
}

if (Test-Path -LiteralPath (Join-Path $Root ".codex\config.toml")) {
  Add-Failure "Active Codex MCP config must not be committed or present for advisory RC: .codex/config.toml"
}

if (Test-Path -LiteralPath (Join-Path $Root ".codex\hooks.json")) {
  Add-Failure "Active Codex hooks config must not be committed or present for advisory RC: .codex/hooks.json"
}

$configExample = ".codex/config.toml.example"
$configExampleText = Read-Text $configExample
if ([string]::IsNullOrWhiteSpace($configExampleText)) {
  Add-Failure "Missing disabled MCP config example: $configExample"
}
else {
  foreach ($line in ($configExampleText -split "`r?`n")) {
    if ($line.Trim() -match "^\[mcp_servers\.") {
      Add-Failure "$configExample contains an active MCP server block: $line"
    }
  }
}

$hooksExample = ".codex/hooks.example.json"
$hooksJson = Test-JsonFile $hooksExample
if ($null -ne $hooksJson) {
  if ($null -eq $hooksJson.activeHooks) {
    Add-Failure "$hooksExample must contain activeHooks: []"
  }
  elseif (@($hooksJson.activeHooks).Count -ne 0) {
    Add-Failure "$hooksExample must keep activeHooks empty"
  }
}

$licenseText = Read-Text "LICENSE"
if ([string]::IsNullOrWhiteSpace($licenseText)) {
  Add-Failure "Missing root LICENSE for GPL-3.0-only release planning"
}
elseif (($licenseText -notmatch "GNU GENERAL PUBLIC LICENSE") -or ($licenseText -notmatch "Version 3, 29 June 2007")) {
  Add-Failure "Root LICENSE does not look like GNU GPLv3 text"
}

$thirdPartyText = Read-Text "THIRD_PARTY_NOTICES.md"
if ([string]::IsNullOrWhiteSpace($thirdPartyText)) {
  Add-Failure "Missing THIRD_PARTY_NOTICES.md for GPL-3.0 provenance review"
}
else {
  foreach ($requiredNotice in @(
    "sap-skills-main.zip",
    "license: GPL-3.0",
    "docs/governance/third-party-provenance-review.md",
    "proprietary client packaging",
    "marketplace publication"
  )) {
    if ($thirdPartyText -notmatch [regex]::Escape($requiredNotice)) {
      Add-Failure "THIRD_PARTY_NOTICES.md missing required provenance marker: $requiredNotice"
    }
  }
}

$provenanceText = Read-Text "docs/governance/third-party-provenance-review.md"
if ([string]::IsNullOrWhiteSpace($provenanceText)) {
  Add-Failure "Missing third-party provenance review: docs/governance/third-party-provenance-review.md"
}
else {
  foreach ($requiredProvenance in @(
    "Issue: <https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/2>",
    "Copied Technical Skills",
    "Local Overlay Skills",
    "Evidence Still Required To Close Issue #2",
    "Regenerate and smoke-test any distributable archive"
  )) {
    if ($provenanceText -notmatch [regex]::Escape($requiredProvenance)) {
      Add-Failure "third-party provenance review missing required marker: $requiredProvenance"
    }
  }
}

if ($Failures.Count -gt 0) {
  Write-Host "Release hygiene validation failed:" -ForegroundColor Red
  foreach ($failure in $Failures) {
    Write-Host " - $failure" -ForegroundColor Red
  }
  exit 1
}

Write-Host "Release hygiene validation passed." -ForegroundColor Green
Write-Host "Checked advisory RC guardrails: operating-layer markers, broken references, active Codex config/hooks, disabled examples, and private artifact filename patterns."
