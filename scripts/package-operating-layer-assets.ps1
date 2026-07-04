param(
  [string]$Root = (Get-Location).Path
)

$ErrorActionPreference = "Stop"

$skillRoot = Join-Path $Root "plugins\sap-codex-deliverables\skills\sap-deliverable-templates"
$targetRoot = Join-Path $skillRoot "assets\operating-layer"

$sections = @(
  @{ Name = "registry"; Source = ".agents\AGENT_REGISTRY.md"; Target = "registry\AGENT_REGISTRY.md" },
  @{ Name = "automation"; Source = ".agents\automation-candidates.md"; Target = "automation\automation-candidates.md" }
)

$folders = @(
  @{ Source = ".agents\playbooks"; Target = "playbooks" },
  @{ Source = ".agents\output-profiles"; Target = "output-profiles" },
  @{ Source = ".agents\samples\client-ready"; Target = "client-ready-samples" }
)

function Convert-PluginText {
  param([string]$Text)

  $converted = $Text
  $converted = $converted.Replace(".agents/templates/", "assets/templates/")
  $converted = $converted.Replace(".agents\templates\", "assets\templates\")
  $converted = $converted.Replace(".agents/templates", "assets/templates")
  $converted = $converted.Replace(".agents\templates", "assets\templates")
  $converted = $converted.Replace(".agents/samples/deliverables", "assets/samples")
  $converted = $converted.Replace(".agents\samples\deliverables", "assets\samples")
  $converted = $converted.Replace(".agents/samples/client-ready/", "assets/operating-layer/client-ready-samples/")
  $converted = $converted.Replace(".agents\samples\client-ready\", "assets\operating-layer\client-ready-samples\")
  $converted = $converted.Replace(".agents/samples/client-ready", "assets/operating-layer/client-ready-samples")
  $converted = $converted.Replace(".agents\samples\client-ready", "assets\operating-layer\client-ready-samples")
  $converted = $converted.Replace(".agents/playbooks/", "assets/operating-layer/playbooks/")
  $converted = $converted.Replace(".agents\playbooks\", "assets\operating-layer\playbooks\")
  $converted = $converted.Replace(".agents/playbooks", "assets/operating-layer/playbooks")
  $converted = $converted.Replace(".agents\playbooks", "assets\operating-layer\playbooks")
  $converted = $converted.Replace(".agents/output-profiles/", "assets/operating-layer/output-profiles/")
  $converted = $converted.Replace(".agents\output-profiles\", "assets\operating-layer\output-profiles\")
  $converted = $converted.Replace(".agents/output-profiles", "assets/operating-layer/output-profiles")
  $converted = $converted.Replace(".agents\output-profiles", "assets\operating-layer\output-profiles")
  $converted = $converted.Replace(".agents/AGENT_REGISTRY.md", "assets/operating-layer/registry/AGENT_REGISTRY.md")
  $converted = $converted.Replace(".agents\AGENT_REGISTRY.md", "assets\operating-layer\registry\AGENT_REGISTRY.md")
  $converted = $converted.Replace(".agents/automation-candidates.md", "assets/operating-layer/automation/automation-candidates.md")
  $converted = $converted.Replace(".agents\automation-candidates.md", "assets\operating-layer\automation\automation-candidates.md")
  $converted = $converted.Replace(".agents/skills", "workspace skills (not bundled in this plugin)")
  $converted = $converted.Replace(".agents\skills", "workspace skills (not bundled in this plugin)")
  $converted = $converted.Replace(".agents/subagents/", "workspace role playbook: ")
  $converted = $converted.Replace(".agents\subagents\", "workspace role playbook: ")
  $converted = $converted.Replace(".agents/subagents", "workspace role playbooks (not bundled in this plugin)")
  $converted = $converted.Replace(".agents\subagents", "workspace role playbooks (not bundled in this plugin)")
  $converted = $converted.Replace(".agents/references/mexbalia-consulting-guardrails.md", "workspace reference: mexbalia-consulting-guardrails.md (not bundled)")
  $converted = $converted.Replace(".agents\references\mexbalia-consulting-guardrails.md", "workspace reference: mexbalia-consulting-guardrails.md (not bundled)")
  $converted = $converted.Replace(".agents/references/sap-process-language.md", "workspace reference: sap-process-language.md (not bundled)")
  $converted = $converted.Replace(".agents\references\sap-process-language.md", "workspace reference: sap-process-language.md (not bundled)")
  $converted = $converted.Replace(".agents/references/sap-activate-governance.md", "workspace reference: sap-activate-governance.md (not bundled)")
  $converted = $converted.Replace(".agents\references\sap-activate-governance.md", "workspace reference: sap-activate-governance.md (not bundled)")
  $converted = $converted.Replace(".agents/references/mexico-compliance-cues.md", "workspace reference: mexico-compliance-cues.md (not bundled)")
  $converted = $converted.Replace(".agents\references\mexico-compliance-cues.md", "workspace reference: mexico-compliance-cues.md (not bundled)")
  $converted = $converted.Replace("docs/validation/full-agent-forward-test-report.md", "assets/operating-layer/references/full-agent-forward-test-report.md")
  $converted = $converted.Replace("docs\validation\full-agent-forward-test-report.md", "assets\operating-layer\references\full-agent-forward-test-report.md")
  $converted = $converted.Replace("docs/porting/full-sap-agents-coverage-plan.md", "assets/operating-layer/references/full-sap-agents-coverage-plan.md")
  $converted = $converted.Replace("docs\porting\full-sap-agents-coverage-plan.md", "assets\operating-layer\references\full-sap-agents-coverage-plan.md")
  return $converted
}

function Copy-ConvertedFile {
  param(
    [string]$Source,
    [string]$Target
  )

  $sourcePath = Join-Path $Root $Source
  $targetPath = Join-Path $targetRoot $Target
  if (-not (Test-Path -LiteralPath $sourcePath)) {
    throw "Missing source file: $Source"
  }

  $targetDir = Split-Path -Parent $targetPath
  New-Item -ItemType Directory -Force -Path $targetDir | Out-Null

  $text = Get-Content -Raw -LiteralPath $sourcePath
  $converted = Convert-PluginText $text
  Set-Content -LiteralPath $targetPath -Value $converted -NoNewline -Encoding UTF8
}

New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null

foreach ($section in $sections) {
  Copy-ConvertedFile -Source $section.Source -Target $section.Target
}

foreach ($folder in $folders) {
  $sourceDir = Join-Path $Root $folder.Source
  if (-not (Test-Path -LiteralPath $sourceDir)) {
    throw "Missing source directory: $($folder.Source)"
  }
  $files = Get-ChildItem -LiteralPath $sourceDir -Filter "*.md" -File
  foreach ($file in $files) {
    Copy-ConvertedFile -Source (Join-Path $folder.Source $file.Name) -Target (Join-Path $folder.Target $file.Name)
  }
}

Copy-ConvertedFile -Source "docs\porting\full-sap-agents-coverage-plan.md" -Target "references\full-sap-agents-coverage-plan.md"
Copy-ConvertedFile -Source "docs\validation\full-agent-forward-test-report.md" -Target "references\full-agent-forward-test-report.md"

$index = @'
# SAP Agent Operating Layer Assets

These plugin-local assets are generated from the workspace SAP Agent operating layer with plugin-safe paths.

## Contents

| Asset | Path |
|---|---|
| Agent registry | `assets/operating-layer/registry/AGENT_REGISTRY.md` |
| Routing playbooks | `assets/operating-layer/playbooks` |
| Output profiles | `assets/operating-layer/output-profiles` |
| Client-ready anonymized samples | `assets/operating-layer/client-ready-samples` |
| Controlled automation candidates | `assets/operating-layer/automation/automation-candidates.md` |
| Coverage plan and forward-test report | `assets/operating-layer/references` |

## Safety Notes

- These assets are advisory and template-oriented; they do not enable MCP servers, hooks, tenant access, credentials, or production actions.
- Client-ready samples are anonymized examples. Replace assumptions, owners, dates, evidence, and system details with confirmed client facts before use.
- Keep fiscal/legal, security, tenant, licensing, roadmap, and production-readiness claims explicitly evidence-bound.
'@

Set-Content -LiteralPath (Join-Path $targetRoot "INDEX.md") -Value $index -NoNewline -Encoding UTF8

Write-Host "Packaged operating-layer assets into $targetRoot"
