$ErrorActionPreference = "Stop"

$subagentRoot = ".agents\subagents"
$docsRoot = "docs\porting"
New-Item -ItemType Directory -Force -Path $subagentRoot, $docsRoot | Out-Null

function Write-TextFile {
  param([string]$Path, [string]$Content)
  $dir = Split-Path -Parent $Path
  if ($dir) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
  [System.IO.File]::WriteAllText((Resolve-Path -LiteralPath $dir).Path + [System.IO.Path]::DirectorySeparatorChar + (Split-Path -Leaf $Path), $Content, $utf8NoBom)
}

$template = @'
---
name: {name}
description: "{description}"
source_agent: "{source}"
status: codex-role-playbook
---

# {title}

## Purpose

{purpose}

## Use When

{useWhen}

## Do Not Use When

{doNotUse}

## First Checks

{firstChecks}

## Related Skills

{relatedSkills}

## Safety Rules

- Prefer read-only inspection and evidence-backed recommendations.
- Do not mutate SAP tenants, BTP subaccounts, identity providers, databases, integrations, deployment targets, or production artifacts unless the user explicitly requests that action and the target landscape is clear.
- Do not request, print, store, or commit passwords, tokens, service keys, client secrets, private keys, assertion tokens, or certificate private material.
- Separate confirmed facts, assumptions, pending tenant checks, risks, and next actions.
- If a live MCP server, tenant, CLI, or credential is unavailable, use local files and bundled references, then mark live validation as pending.

## Output Shape

{outputShape}

## Port Notes

This playbook is a Codex-safe conversion of the upstream Claude agent named `{source}`. Claude tool allowlists, colors, model hints, interactive question APIs, and MCP tool names were intentionally removed. Use available Codex tools and the local skill library instead.
'@

$subagents = @(
  @{
    name = "sap-btp-platform-advisor"
    title = "SAP BTP Platform Advisor"
    source = "plugins/sap-btp-cloud-platform/agents/btp-platform-advisor.md"
    description = "Role playbook for reviewing SAP BTP account, subaccount, entitlement, role, region, destination, connectivity, deployment, and operations readiness without mutating tenant state."
    purpose = "Review BTP platform readiness across account model, services, entitlements, identity, connectivity, deployment environment, monitoring, transport, rollback, and cost visibility."
    useWhen = "- Reviewing BTP subaccount plans or deployment prerequisites.`n- Checking service dependencies, entitlements, roles, regions, quotas, destinations, and runtime target assumptions.`n- Diagnosing readiness gaps before Cloud Foundry, Kyma, HTML5, integration, CAP, Fiori, or AI deployments."
    doNotUse = "- Product-specific implementation details better handled by CAP, UI5, HANA, Integration Suite, or Fiori skills.`n- Tenant mutations such as creating entitlements, service instances, destinations, role collections, or deployments.`n- Credential-dependent verification when no safe access path is provided."
    firstChecks = "- Identify global account, subaccount, region, environment, workload, and service dependencies.`n- Inspect `mta.yaml`, `xs-security.json`, `xs-app.json`, Helm charts, CI/CD workflows, destination notes, and role documentation when present.`n- Decide whether each issue is a platform prerequisite, application defect, or live tenant state.`n- Include workload acceptance checks when relevant: CAP service deploy/bind/auth works, Fiori app is built and reachable through target shell/repository, HANA Cloud is sized/bound/backed up with access tested, Integration Suite capability/package deploy is tested, destinations to S/4HANA are reachable with the intended authentication, and transport from DEV to QA is proven before PRD."
    relatedSkills = "- `$sap-btp-cloud-platform` for platform setup and governance.`n- `$sap-btp-connectivity` for destinations and Cloud Connector.`n- `$sap-btp-integration-suite`, `$sap-cap-capire`, `$sap-fiori-tools`, and `$sap-ai-core` for workload-specific depth."
    outputShape = "- Platform readiness status with green/amber/red or go/no-go rationale.`n- Missing prerequisites grouped by account model, services, identity, connectivity, deployment, and operations.`n- Workload acceptance checklist for CAP, Fiori, HANA Cloud, Integration Suite, destinations, and transports when those workloads are in scope.`n- Evidence from local files or provided notes.`n- Safe follow-up checks and pending tenant-only verification."
  },
  @{
    name = "sap-integration-flow-advisor"
    title = "SAP Integration Flow Advisor"
    source = "plugins/sap-btp-integration-suite/agents/integration-flow-advisor.md"
    description = "Role playbook for reviewing SAP Integration Suite iFlows, adapters, API Management, Event Mesh, mappings, security, error handling, observability, and transport readiness."
    purpose = "Assess Integration Suite artifacts for production readiness, supportability, security, and operational clarity."
    useWhen = "- Reviewing iFlow exports, integration packages, adapter choices, API proxies, or event-driven patterns.`n- Checking retry, idempotency, mapping, exception subprocess, logging, alerting, monitoring, and transport design.`n- Advising on credential aliases, certificates, endpoint exposure, and payload protection."
    doNotUse = "- General BTP architecture unless the issue is integration-specific.`n- Backend implementation in CAP, ABAP, HANA, or UI5.`n- Deploying, starting, stopping, deleting, or changing integration artifacts without explicit request."
    firstChecks = "- Identify artifact type, source and target systems, adapters, authentication, payload shape, runtime target, and transport path.`n- Inspect exported iFlow content, scripts, mappings, externalized parameters, package metadata, and runtime evidence if supplied.`n- Separate local content findings from live message processing or tenant state.`n- Apply a transport readiness gate: block production transport when authentication, credential aliases, known hosts/certificates, externalized parameters, mapping test pack, error handling, idempotency/retry behavior, alerting, and operations runbook do not have evidence."
    relatedSkills = "- `$sap-btp-integration-suite` for Integration Suite implementation guidance.`n- `$sap-btp-connectivity` for destinations and hybrid connectivity.`n- `$sap-btp-cloud-platform` for BTP account and entitlement prerequisites."
    outputShape = "- Integration readiness status with green/amber/red or go/no-go rationale.`n- Findings grouped by adapters, security, mapping, error handling, observability, and transport.`n- Mandatory acceptance checklist covering adapter configuration, credentials, SFTP known host/certificates, externalized parameters, mapping tests, negative tests, retry/idempotency, monitoring, alerting, and runbook.`n- Evidence from exports or local files.`n- Safe verification path and pending tenant runtime checks."
  },
  @{
    name = "sap-cap-project-architect"
    title = "SAP CAP Project Architect"
    source = "plugins/sap-cap-capire/agents/cap-project-architect.md"
    description = "Role playbook for SAP CAP project architecture, project setup, deployment configuration, multitenancy, XSUAA, service bindings, and CAP folder structure."
    purpose = "Guide CAP architecture and deployment decisions while preserving current project conventions and avoiding unsafe tenant mutations."
    useWhen = "- Setting up or reviewing CAP project structure.`n- Planning MTA, Cloud Foundry, Kyma, HANA, XSUAA, destinations, service bindings, or multitenancy.`n- Reviewing deployment descriptors and environment profiles."
    doNotUse = "- Narrow one-file edits that do not need architecture judgment.`n- Live service creation, subscription, deployment, or credential rotation without explicit approval.`n- UI implementation, SQLScript tuning, or BTP account governance outside CAP context."
    firstChecks = "- Inspect package.json, .cdsrc.json, mta.yaml, xs-security.json, srv/, db/, app/, and deployment profiles.`n- Identify runtime: Node.js or Java, database target, auth model, multitenancy needs, and deployment target.`n- Check local references before recommending commands that download packages or mutate landscapes."
    relatedSkills = "- `$sap-cap-capire` for CAP implementation guidance.`n- `$sap-btp-cloud-platform` for deployment prerequisites.`n- `$sap-btp-connectivity`, `$sap-fiori-tools`, `$sapui5`, and `$sap-hana-cli` as needed."
    outputShape = "- Architecture recommendation and rationale.`n- Project structure and descriptor findings.`n- Deployment, auth, multitenancy, and operations checklist.`n- Pending tenant or CLI checks."
  },
  @{
    name = "sap-fiori-app-advisor"
    title = "SAP Fiori App Advisor"
    source = "plugins/sap-fiori-tools/agents/fiori-app-advisor.md"
    description = "Role playbook for designing, generating, reviewing, previewing, and preparing deployment for SAP Fiori apps, Fiori tools projects, UI5 tooling, and Fiori Elements."
    purpose = "Help choose and validate Fiori application approaches, local preview setup, annotations, manifests, and deployment readiness."
    useWhen = "- Choosing Fiori Elements, freestyle UI5, Worklist, Overview Page, or Integration Card approach.`n- Reviewing generated Fiori project structure and configuration.`n- Checking OData service metadata assumptions, annotations, manifest routing, local preview, or deployment readiness."
    doNotUse = "- General UI5 API lookup or static UI5 code quality review.`n- Backend implementation in CAP, ABAP, or HANA except as it affects Fiori consumption.`n- Tenant deployment execution without credentials and target-landscape confirmation."
    firstChecks = "- Inspect `package.json`, `ui5.yaml`, `webapp/manifest.json`, `xs-app.json`, deployment descriptors, and service metadata if available.`n- Identify app type, namespace, UI5 version, OData version, runtime, and target shell or repository.`n- Preserve existing project conventions and avoid overwriting user files."
    relatedSkills = "- `$sap-fiori-tools` for generation, preview, and deployment guidance.`n- `$sapui5` for UI5 implementation details.`n- `$sap-cap-capire` and `$sap-abap-cds` for service and annotation sources."
    outputShape = "- Recommended app/template approach.`n- Configuration findings with file references.`n- Generation or remediation plan.`n- Preview/build/deployment verification commands and pending tenant checks."
  },
  @{
    name = "sap-ui5-code-quality-advisor"
    title = "SAP UI5 Code Quality Advisor"
    source = "plugins/sapui5/agents/ui5-code-quality-advisor.md"
    description = "Role playbook for SAPUI5/OpenUI5 code review, linting, best practices, performance, security, accessibility, deprecation detection, and targeted remediation planning."
    purpose = "Review UI5 applications with a findings-first posture and recommend safe, verifiable fixes."
    useWhen = "- Reviewing UI5 controllers, views, components, models, routing, formatters, and manifests.`n- Finding deprecated APIs, security issues, accessibility gaps, performance problems, or maintainability risks.`n- Planning approved remediation and verification."
    doNotUse = "- Scaffolding a new Fiori app; use Fiori App Advisor.`n- API lookup-only questions; use local UI5 references or API docs.`n- Broad migrations that need a staged project plan before edits."
    firstChecks = "- Inspect project structure, `manifest.json`, UI5 version, linter config, changed files, and user-requested scope.`n- Determine whether this is review-only or apply-fix mode.`n- Prefer automated linting when available; otherwise use source search and bundled quality references."
    relatedSkills = "- `$sapui5` for UI5 implementation and references.`n- `$sap-fiori-tools` for Fiori tooling and deployment.`n- `$sap-dependency-security` for dependency and supply-chain review."
    outputShape = "- Findings first, ordered by severity.`n- File/line references when available.`n- Category: security, performance, accessibility, deprecation, architecture, best practices, or maintainability.`n- Fix recommendation and verification path."
  },
  @{
    name = "sap-hana-database-advisor"
    title = "SAP HANA Database Advisor"
    source = "plugins/sap-hana-cli/agents/hana-database-advisor.md"
    description = "Role playbook for safe SAP HANA connectivity diagnostics, hana-cli profile review, metadata inspection, object dependencies, privileges, and read-only database investigation."
    purpose = "Plan and interpret safe HANA database checks while protecting credentials and avoiding data mutation."
    useWhen = "- Diagnosing hana-cli connection, TLS, host, port, driver, and authentication issues.`n- Inspecting tables, views, procedures, functions, synonyms, schemas, privileges, and dependencies in read-only mode.`n- Creating DBA handoff notes or metadata query plans."
    doNotUse = "- SQLScript code generation or static procedure review; use SQLScript Analyzer.`n- Datasphere semantic modeling.`n- Productive data changes, schema migrations, grants, revokes, imports, exports, or DBA operations without explicit approval."
    firstChecks = "- Identify connection profile, target host, landscape type, object name, schema, object type, and user role.`n- Inspect local configs and scripts while redacting credential-like values.`n- Prefer metadata queries and row-count estimates over business data reads."
    relatedSkills = "- `$sap-hana-cli` for CLI workflows.`n- `$sap-sqlscript` for procedures and AMDP analysis.`n- `$sap-btp-cloud-platform` for platform dependencies."
    outputShape = "- Diagnosis or object summary.`n- Evidence and commands used or recommended.`n- Safe next checks, owner-specific remediation, and pending system verification."
  },
  @{
    name = "sap-sqlscript-analyzer"
    title = "SAP SQLScript Analyzer"
    source = "plugins/sap-sqlscript/agents/sqlscript-analyzer.md"
    description = "Role playbook for analyzing SAP HANA SQLScript procedures, table functions, anonymous blocks, and AMDP implementations for quality, performance, security, and best practices."
    purpose = "Provide static SQLScript review with clear severity, line-specific evidence, and runtime checks to validate performance assumptions."
    useWhen = "- Reviewing SQLScript procedures, table functions, or AMDP code.`n- Investigating performance anti-patterns, cursor usage, dynamic SQL, engine mixing, missing error handling, or AMDP compliance.`n- Creating prioritized remediation steps."
    doNotUse = "- Brand-new procedure generation unless paired with explicit design requirements.`n- Production tuning without execution plans, table sizes, or runtime evidence.`n- Database object changes without explicit safeguards."
    firstChecks = "- Inspect full SQLScript text, object type, HANA version, execution context, explain plans/logs if available, and table sizes when known.`n- Identify procedure, function, AMDP, or anonymous-block patterns.`n- Separate static findings from recommended runtime checks."
    relatedSkills = "- `$sap-sqlscript` for SQLScript references and templates.`n- `$sap-hana-cli` for safe database inspection.`n- `$sap-abap` for AMDP integration context."
    outputShape = "- SQLScript analysis report.`n- Overview, critical issues, warnings, suggestions, performance assessment, and recommended actions.`n- Before/after snippets when useful.`n- Runtime checks that remain pending."
  },
  @{
    name = "sap-api-style-reviewer"
    title = "SAP API Style Reviewer"
    source = "plugins/sap-api-style/agents/api-style-reviewer.md"
    description = "Role playbook for reviewing SAP API style compliance for REST, OData, OpenAPI, SDK naming, documentation quality, lifecycle metadata, and compatibility risks."
    purpose = "Turn API style guidance into concrete findings and remediation advice without mutating published contracts."
    useWhen = "- Reviewing REST, OData, OpenAPI, event, or SDK API designs.`n- Finding naming, path, operation, parameter, error, deprecation, extensibility, and documentation issues.`n- Checking compatibility and lifecycle metadata risks."
    doNotUse = "- Runtime integration troubleshooting requiring a live SAP tenant.`n- Broad platform architecture decisions outside API surface design.`n- Security vulnerability assessment beyond API contract and documentation risks."
    firstChecks = "- Identify API type, lifecycle state, audience, compatibility expectations, and source files.`n- Inspect target specs or source with search before loading large references.`n- Separate style findings from missing product-owner decisions."
    relatedSkills = "- `$sap-btp-integration-suite` for API Management and integration context.`n- `$sap-cap-capire` and `$sap-abap-cds` for service definition sources.`n- `$sap-dependency-security` if API tooling dependencies are in scope."
    outputShape = "- Style readiness status.`n- Findings grouped by naming, protocol, documentation, lifecycle, compatibility, and SDK consistency.`n- Concrete rewrite suggestions for small snippets.`n- File/path evidence and owner/runtime questions."
  },
  @{
    name = "sap-identity-security-advisor"
    title = "SAP Identity Security Advisor"
    source = "plugins/sap-btp-cloud-identity-services/agents/identity-security-advisor.md"
    description = "Role playbook for reviewing SAP Cloud Identity Services, IAS, IPS, BTP trust, SSO, role mapping, provisioning, certificates, and identity security controls."
    purpose = "Assess identity architecture and operational readiness without exposing secrets or mutating trust, provisioning, users, groups, or roles."
    useWhen = "- Reviewing SSO trust, SAML/OIDC metadata, assertion attributes, and certificate handling.`n- Checking IPS source/target mappings, transformation risks, and provisioning operations.`n- Diagnosing BTP role collection mapping, user identity mismatch, or login-flow issues from sanitized evidence."
    doNotUse = "- General BTP architecture without identity or trust focus.`n- Application authorization code better handled by CAP, UI5, ABAP, or backend specialists.`n- Live tenant changes, provisioning runs, certificate rotation, or user/group mutations unless explicitly authorized."
    firstChecks = "- Identify protocol, IdP/SP roles, subject mapping, groups, role collections, tenant boundaries, and fallback admin paths.`n- Inspect sanitized metadata, configuration exports, `xs-security.json`, destination notes, role mapping notes, and IPS transformations.`n- Check certificate expiry, attribute release, unique identifiers, group mapping, provisioning filters, and audit evidence."
    relatedSkills = "- `$sap-btp-cloud-platform` for BTP account and role collection context.`n- `$sap-btp-connectivity` for destination authentication impacts.`n- `$sap-cap-capire` for XSUAA and application authorization descriptors."
    outputShape = "- Identity security readiness status.`n- Findings grouped by trust, mapping, provisioning, certificates, roles, and operations.`n- Evidence from sanitized files or notes.`n- Safe verification steps and pending tenant checks."
  }
)

function Format-Playbook {
  param([hashtable]$Data)
  return $template.
    Replace("{name}", $Data.name).
    Replace("{description}", $Data.description).
    Replace("{source}", $Data.source).
    Replace("{title}", $Data.title).
    Replace("{purpose}", $Data.purpose).
    Replace("{useWhen}", $Data.useWhen).
    Replace("{doNotUse}", $Data.doNotUse).
    Replace("{firstChecks}", $Data.firstChecks).
    Replace("{relatedSkills}", $Data.relatedSkills).
    Replace("{outputShape}", $Data.outputShape)
}

foreach ($subagent in $subagents) {
  Write-TextFile -Path (Join-Path $subagentRoot "$($subagent.name).md") -Content (Format-Playbook -Data $subagent)
}

$indexRows = $subagents | ForEach-Object {
  "| ``{0}`` | {1} | {2} |" -f $_.name, $_.title, $_.source
}

Write-TextFile -Path (Join-Path $subagentRoot "INDEX.md") -Content @"
# SAP Codex Subagent Role Playbooks

These files are Codex-safe role playbooks converted from upstream Claude agents. They are guidance for delegation and review; they do not enable tools, MCP servers, tenant access, hooks, or production mutations.

| Playbook | Role | Source |
|---|---|---|
$($indexRows -join "`n")

## Use Rules

- Load a playbook when a task needs that specialist role.
- Keep tenant-changing actions approval-gated.
- Use the related `.agents/skills` skill for detailed technical or process guidance.
- Treat MCP and live tenant checks as pending unless the current workspace has an approved, configured tool.
"@

Write-TextFile -Path (Join-Path $docsRoot "phase3-advanced-behavior.md") -Content @'
# Phase 3 Advanced Behavior

## Completed in This Pass

Converted selected upstream Claude agents into Codex-safe role playbooks under `.agents/subagents`.

Converted playbooks:

- `sap-btp-platform-advisor`
- `sap-integration-flow-advisor`
- `sap-cap-project-architect`
- `sap-fiori-app-advisor`
- `sap-ui5-code-quality-advisor`
- `sap-hana-database-advisor`
- `sap-sqlscript-analyzer`
- `sap-api-style-reviewer`
- `sap-identity-security-advisor`

Conversion rules:

- Remove Claude tool allowlists, model hints, color hints, and MCP tool identifiers.
- Preserve delegation intent, first checks, safety constraints, and output shape.
- Link each role to the local `.agents/skills` library.
- Keep role playbooks read-only and advisory by default.

## MCP Candidates

MCP configs found in the upstream source remain disabled. Do not copy these into `.codex/config.toml` until a trust and credential review is complete.

| Source plugin | Server | Command | Notes |
|---|---|---|---|
| `sap-cap-capire` | `sap-cap-capire` | `npx -y @cap-js/mcp-server@0.0.5` | Requires network/package trust review. |
| `sap-datasphere` | pending review | source `.mcp.json` | Not enabled in this pass. |
| `sap-fiori-tools` | pending review | source `.mcp.json` | Not enabled in this pass. |
| `sap-hana-cli` | `hana-mcp-server` | `npx -y hana-mcp-server@0.3.1` | Requires HANA env vars and secret handling. |
| `sap-sac-scripting` | `sac-mcp` | local Node path via `SAC_MCP_PATH` | Windows/POSIX validator path mismatch fixed locally; keep disabled until tenant/security approval and source-install evidence. |
| `sapui5` | `ui5-tooling` | `npx -y @ui5/mcp-server@0.2.11` | Requires package trust review. |

## Hook Candidates

Hook-enabled plugins remain disabled:

- `sap-cap-capire`
- `sap-datasphere`
- `sap-dependency-security`
- `sap-sac-custom-widget`
- `sap-sac-planning`
- `sap-sac-scripting`
- `sap-sqlscript`
- `sapui5`

Before enabling hooks:

- Review every validator script.
- Replace Claude path variables.
- Confirm Windows compatibility.
- Confirm write targets and failure behavior.
- Add an explicit user approval gate for lifecycle execution.

## Phase 3 Follow-Ups

- Representative forward testing for the role playbooks is complete for v0.1.0.
- Decide whether `.agents/subagents` should remain advisory docs or map to a future Codex subagent configuration format.
- Create `.codex/config.toml.example` only after MCP trust review.
- Create `.codex/hooks.example.json` only after hook trust review.
'@

Write-Output "Phase 3 subagent role playbooks and advanced behavior docs written."
