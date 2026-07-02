param(
  [string]$SourceRoot = ".imports\sap-skills-main\sap-skills-main",
  [string]$DestinationRoot = ".agents\skills"
)

$priority = @(
  "sap-btp-integration-suite",
  "sap-cap-capire",
  "sap-fiori-tools",
  "sapui5",
  "sap-abap-cds",
  "sap-abap",
  "sap-btp-connectivity",
  "sap-btp-cloud-platform",
  "sap-sqlscript",
  "sap-hana-cli",
  "sap-ai-core",
  "sap-dependency-security"
)

$resolvedSource = Resolve-Path -LiteralPath $SourceRoot
New-Item -ItemType Directory -Force -Path $DestinationRoot | Out-Null

foreach ($name in $priority) {
  $skillSrc = Join-Path $resolvedSource "plugins\$name\skills\$name"
  if (-not (Test-Path -LiteralPath $skillSrc)) {
    throw "Missing source skill: $skillSrc"
  }

  $dest = Join-Path (Resolve-Path -LiteralPath $DestinationRoot) $name
  New-Item -ItemType Directory -Force -Path $dest | Out-Null

  foreach ($resource in @("references", "templates", "scripts", "assets")) {
    $srcResource = Join-Path $skillSrc $resource
    if (Test-Path -LiteralPath $srcResource) {
      $destResource = Join-Path $dest $resource
      if (Test-Path -LiteralPath $destResource) {
        Remove-Item -LiteralPath $destResource -Recurse -Force
      }
      Copy-Item -LiteralPath $srcResource -Destination $destResource -Recurse -Force
    }
  }

  $pluginCommands = Join-Path $resolvedSource "plugins\$name\commands"
  if (Test-Path -LiteralPath $pluginCommands) {
    $commandDest = Join-Path $dest "references\commands"
    New-Item -ItemType Directory -Force -Path $commandDest | Out-Null
    Copy-Item -Path (Join-Path $pluginCommands "*") -Destination $commandDest -Recurse -Force
  }

  $skillPath = Join-Path $skillSrc "SKILL.md"
  $content = Get-Content -LiteralPath $skillPath -Raw
  if ($content -notmatch "(?s)^---\r?\n(.*?)\r?\n---\r?\n(.*)$") {
    throw "Unexpected frontmatter in $skillPath"
  }

  $frontmatter = $Matches[1]
  $body = $Matches[2]

  if ($frontmatter -notmatch "(?m)^name:\s*(.+?)\s*$") {
    throw "Missing name in $skillPath"
  }
  $frontName = $Matches[1].Trim()

  if ($frontmatter -notmatch "(?m)^description:\s*(.+?)\s*$") {
    throw "Missing description in $skillPath"
  }
  $frontDescription = $Matches[1].Trim()

  $portNote = @"
## Codex Port Notes

- Use this as a local Codex skill ported from the upstream SAP skills repository.
- Treat SAP product, tenant behavior, limits, licensing, and roadmap claims as evidence-bound; validate against the target tenant and current SAP documentation before production use.
- Review `references/verification.md` for original source metadata and port caveats.
- Claude slash-command workflows, when copied, live under `references/commands/` as reference prompts; do not treat them as native Codex slash commands.

"@

  $newContent = "---`nname: $frontName`ndescription: $frontDescription`n---`n`n$portNote$body"
  Set-Content -LiteralPath (Join-Path $dest "SKILL.md") -Value $newContent -NoNewline

  $verificationDir = Join-Path $dest "references"
  New-Item -ItemType Directory -Force -Path $verificationDir | Out-Null

  $verification = @"
# Verification and Port Caveats

This skill was copied from `plugins/$name/skills/$name` in `sap-skills-main.zip` during the Codex Windows port.

Do not advance `last_verified` or present the skill as live-tenant validated unless new evidence is added. Treat the content as source-guided SAP implementation guidance until validated in the relevant SAP/BTP/SAC/HANA/S/4HANA environment.

Claude-specific frontmatter keys such as `allowed-tools`, plugin lifecycle hooks, MCP settings, and slash-command assumptions were not enabled for Codex in this pass. Commands from the source plugin, when copied, are reference material only.

## Original Frontmatter

````yaml
$frontmatter
````
"@

  Set-Content -LiteralPath (Join-Path $verificationDir "verification.md") -Value $verification -NoNewline
}

Get-ChildItem -LiteralPath $DestinationRoot | Select-Object Name
