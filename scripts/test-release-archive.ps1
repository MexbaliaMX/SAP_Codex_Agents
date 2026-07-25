param(
  [string]$ArchivePath = "sap-codex-deliverables-v0.1.0.zip",
  [string]$ExpectedSha256 = "",
  [string]$SkillValidatorPath = "",
  [string]$PluginValidatorPath = "",
  [switch]$SkipValidators,
  [switch]$KeepExtracted
)

$ErrorActionPreference = "Stop"

function Resolve-RequiredPath {
  param(
    [string]$Path,
    [string]$Label
  )

  if (-not (Test-Path -LiteralPath $Path)) {
    throw "$Label not found: $Path"
  }

  return (Resolve-Path -LiteralPath $Path).Path
}

function Invoke-Python {
  param([string[]]$Arguments)

  & python @Arguments
  if ($LASTEXITCODE -ne 0) {
    throw "Python command failed: python $($Arguments -join ' ')"
  }
}

function Assert-PathExists {
  param(
    [string]$Root,
    [string]$RelativePath
  )

  $path = Join-Path $Root $RelativePath
  if (-not (Test-Path -LiteralPath $path)) {
    return $RelativePath
  }

  return $null
}

function Expand-ReleaseArchive {
  param(
    [string]$Archive,
    [string]$Destination
  )

  $tar = Get-Command tar -CommandType Application -ErrorAction SilentlyContinue
  if ($tar) {
    & $tar.Source -xf $Archive -C $Destination
    if ($LASTEXITCODE -ne 0) {
      throw "tar extraction failed for release archive: $Archive"
    }
    return
  }

  Expand-Archive -LiteralPath $Archive -DestinationPath $Destination -Force
}

$archiveFullPath = Resolve-RequiredPath -Path $ArchivePath -Label "Release archive"
$hash = Get-FileHash -LiteralPath $archiveFullPath -Algorithm SHA256

if ($ExpectedSha256) {
  if ($hash.Hash.ToUpperInvariant() -ne $ExpectedSha256.ToUpperInvariant()) {
    throw "SHA256 mismatch. Expected $ExpectedSha256 but found $($hash.Hash)."
  }
}

if (-not $SkillValidatorPath) {
  $SkillValidatorPath = Join-Path $env:USERPROFILE ".codex\skills\.system\skill-creator\scripts\quick_validate.py"
}
if (-not $PluginValidatorPath) {
  $PluginValidatorPath = Join-Path $env:USERPROFILE ".codex\skills\.system\plugin-creator\scripts\validate_plugin.py"
}

if (-not $SkipValidators) {
  $SkillValidatorPath = Resolve-RequiredPath -Path $SkillValidatorPath -Label "Skill validator"
  $PluginValidatorPath = Resolve-RequiredPath -Path $PluginValidatorPath -Label "Plugin validator"
}

$smokeRoot = Join-Path $env:TEMP ("sap-release-archive-smoke-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $smokeRoot | Out-Null

try {
  Expand-ReleaseArchive -Archive $archiveFullPath -Destination $smokeRoot

  $expectedPaths = @(
    "plugins\sap-codex-deliverables\.codex-plugin\plugin.json",
    "plugins\sap-codex-deliverables\skills\sap-deliverable-templates\SKILL.md",
    "plugins\sap-codex-deliverables\skills\sap-deliverable-templates\assets\templates\INDEX.md",
    "plugins\sap-codex-deliverables\skills\sap-deliverable-templates\assets\samples\INDEX.md",
    ".agents\skills",
    ".agents\templates\INDEX.md",
    ".agents\samples\deliverables\INDEX.md",
    ".agents\subagents\INDEX.md",
    "docs\validation\internal-release-checklist.md",
    "docs\validation\phase2-forward-test-report.md",
    "docs\validation\phase3-forward-test-report.md",
    ".codex\config.toml.example",
    "marketplace.json",
    "RELEASE_NOTES.md"
  )

  $missing = @()
  foreach ($relativePath in $expectedPaths) {
    $missingPath = Assert-PathExists -Root $smokeRoot -RelativePath $relativePath
    if ($missingPath) {
      $missing += $missingPath
    }
  }

  if ($missing.Count) {
    throw "Missing expected release paths: $($missing -join ', ')"
  }

  $env:PYTHONUTF8 = "1"

  if (-not $SkipValidators) {
    $skillRoot = Join-Path $smokeRoot ".agents\skills"
    $skillFailures = @()

    Get-ChildItem -LiteralPath $skillRoot -Directory | ForEach-Object {
      $output = & python $SkillValidatorPath $_.FullName 2>&1
      if ($LASTEXITCODE -ne 0) {
        $skillFailures += "$($_.Name): $output"
      }
    }

    $pluginSkill = Join-Path $smokeRoot "plugins\sap-codex-deliverables\skills\sap-deliverable-templates"
    $pluginSkillOutput = & python $SkillValidatorPath $pluginSkill 2>&1
    if ($LASTEXITCODE -ne 0) {
      $skillFailures += "sap-deliverable-templates: $pluginSkillOutput"
    }

    if ($skillFailures.Count) {
      throw "Skill validation failed: $($skillFailures -join '; ')"
    }

    $pluginRoot = Join-Path $smokeRoot "plugins\sap-codex-deliverables"
    Invoke-Python -Arguments @($PluginValidatorPath, $pluginRoot)
  }

  $configPath = Join-Path $smokeRoot ".codex\config.toml.example"
  $configCheck = @"
import pathlib
import sys
import tomllib

path = pathlib.Path(sys.argv[1])
data = tomllib.loads(path.read_text(encoding="utf-8"))
print("config example active keys:", sorted(data.keys()))
if data:
    raise SystemExit(1)
"@
  $configScript = Join-Path $smokeRoot "check_config.py"
  [System.IO.File]::WriteAllText($configScript, $configCheck, [System.Text.UTF8Encoding]::new($false))
  Invoke-Python -Arguments @($configScript, $configPath)

  $controlCharFailures = @()
  $controlScanRoots = @(
    (Join-Path $smokeRoot ".agents\subagents"),
    (Join-Path $smokeRoot "scripts\create-phase3-subagents.ps1")
  )

  Get-ChildItem -Recurse -File -Path $controlScanRoots | ForEach-Object {
    $text = [System.IO.File]::ReadAllText($_.FullName)
    if ($text -match "[\x00-\x08\x0B\x0C\x0E-\x1F]") {
      $controlCharFailures += $_.FullName
    }
  }

  if ($controlCharFailures.Count) {
    throw "Unexpected control characters found: $($controlCharFailures -join ', ')"
  }

  $workspaceSkillCount = (Get-ChildItem -LiteralPath (Join-Path $smokeRoot ".agents\skills") -Directory).Count
  $workspaceTemplateCount = (Get-ChildItem -LiteralPath (Join-Path $smokeRoot ".agents\templates") -File -Filter "*.md").Count
  $workspaceSampleCount = (Get-ChildItem -LiteralPath (Join-Path $smokeRoot ".agents\samples\deliverables") -File -Filter "*.md").Count
  $pluginTemplateCount = (Get-ChildItem -LiteralPath (Join-Path $smokeRoot "plugins\sap-codex-deliverables\skills\sap-deliverable-templates\assets\templates") -File -Filter "*.md").Count
  $pluginSampleCount = (Get-ChildItem -LiteralPath (Join-Path $smokeRoot "plugins\sap-codex-deliverables\skills\sap-deliverable-templates\assets\samples") -File -Filter "*.md").Count

  Write-Output "Release archive smoke passed."
  Write-Output "Archive: $archiveFullPath"
  Write-Output "SHA256: $($hash.Hash)"
  if ($KeepExtracted) {
    Write-Output "Smoke root: $smokeRoot"
  } else {
    Write-Output "Smoke root: $smokeRoot (removed; rerun with -KeepExtracted to inspect)"
  }
  Write-Output "Workspace skills: $workspaceSkillCount"
  Write-Output "Workspace templates markdown files: $workspaceTemplateCount"
  Write-Output "Workspace sample deliverable markdown files: $workspaceSampleCount"
  Write-Output "Plugin templates markdown files: $pluginTemplateCount"
  Write-Output "Plugin sample markdown files: $pluginSampleCount"
}
finally {
  if (-not $KeepExtracted -and (Test-Path -LiteralPath $smokeRoot)) {
    Remove-Item -LiteralPath $smokeRoot -Recurse -Force
  }
}
