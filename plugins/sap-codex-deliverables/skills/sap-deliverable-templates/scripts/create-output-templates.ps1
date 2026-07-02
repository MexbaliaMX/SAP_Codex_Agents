$ErrorActionPreference = "Stop"

$templateRoot = ".agents\templates"
$docsRoot = "docs\porting"
New-Item -ItemType Directory -Force -Path $templateRoot, $docsRoot | Out-Null

function Write-TextFile {
  param([string]$Path, [string]$Content)
  $dir = Split-Path -Parent $Path
  if ($dir) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
  [System.IO.File]::WriteAllText((Resolve-Path -LiteralPath $dir).Path + [System.IO.Path]::DirectorySeparatorChar + (Split-Path -Leaf $Path), $Content, $utf8NoBom)
}

Write-TextFile -Path (Join-Path $templateRoot "fit-to-standard-delta-log.md") -Content @'
# Fit-to-Standard Delta Log

Use for SAP Activate Explore workshops. Keep every delta evidence-bound and standard-first.

## Workshop Context

| Field | Value |
|---|---|
| Process | [Record-to-Report / Order-to-Cash / Procure-to-Pay / etc.] |
| Workshop | [Name / date] |
| Legal entity / country | [Scope] |
| System landscape | [DEV / QA / PRD / tenant notes] |
| Facilitator | [Name] |
| Business owner | [Name] |

## Delta Register

| ID | Process step | Standard behavior shown | Business need / delta | Category | Disposition | Owner | Evidence required | Decision date | Status |
|---|---|---|---|---|---|---|---|---|---|
| D-001 | [Step] | [Standard process] | [Gap or question] | Fit / Config / Extension / Integration / Data / Reporting / Security / Localization / Change | [Accept standard / Configure / Validate / Backlog / Reject] | [Owner] | [Tenant evidence, policy, sample, log] | [Date] | Open |

## Decision Hygiene

- Do not accept a custom extension until the standard alternative is documented.
- Every delta needs a business owner, evidence, disposition, and decision date.
- Move unresolved product or tenant claims into validation actions.
- For Mexico scope, validate CFDI, complementos de pago, Carta Porte, tax evidence, and auditability when relevant.

## Validation Actions

| Action | Delta ID | Evidence needed | Owner | Due date | Result / decision |
|---|---|---|---|---|---|
| [Action] | [D-001] | [Tenant check, policy, sample, log] | [Owner] | [Date] | Pending |

## Summary

| Metric | Count |
|---|---:|
| Fit to standard | [0] |
| Configuration | [0] |
| Extension | [0] |
| Integration | [0] |
| Data | [0] |
| Reporting / analytics | [0] |
| Security / controls | [0] |
| Localization / compliance | [0] |
'@

Write-TextFile -Path (Join-Path $templateRoot "process-diagnostic-summary.md") -Content @'
# Process Diagnostic Summary

Use for process advisory outputs before jumping into configuration or build recommendations.

## Executive Summary

[One paragraph with the business impact, likely root pattern, and recommended next move.]

## Scope and Assumptions

| Area | Notes |
|---|---|
| Process | [Process family] |
| Legal entities / countries | [Scope] |
| Systems | [SAP and non-SAP systems] |
| Confirmed facts | [Facts] |
| Assumptions | [Assumptions] |
| Validation gaps | [Open evidence] |

## End-to-End Process Map

| Step | Trigger / input | Activity | Output | Owner | System | Control / evidence |
|---|---|---|---|---|---|---|
| 1 | [Trigger] | [Activity] | [Output] | [Owner] | [System] | [Evidence] |

## Pain Point Classification

| Pain point | Category | Impact | Root-cause hypothesis | Evidence needed | Owner | Priority |
|---|---|---|---|---|---|---|
| [Issue] | Process / Data / Integration / Control / Adoption / Reporting / Governance | [Impact] | [Hypothesis] | [Evidence] | [Owner] | High |

## Recommendations

| Recommendation | Standard capability first | Benefits | Risks | Validation step | Owner |
|---|---|---|---|---|---|
| [Recommendation] | [SAP standard option] | [Benefit] | [Risk] | [Check] | [Owner] |

## Next Actions

| Action | Owner | Due date | Evidence / output |
|---|---|---|---|
| [Action] | [Owner] | [Date] | [Evidence] |
'@

Write-TextFile -Path (Join-Path $templateRoot "raid-log.md") -Content @'
# RAID Log

Use for SAP delivery governance across Activate phases.

## Risks

| ID | Risk | Impact | Probability | Severity | Mitigation | Owner | Due date | Status |
|---|---|---|---|---|---|---|---|---|
| R-001 | [Risk] | [Impact] | Low / Medium / High | Low / Medium / High | [Mitigation] | [Owner] | [Date] | Open |

## Assumptions

| ID | Assumption | Impact if false | Validation evidence | Owner | Due date | Status |
|---|---|---|---|---|---|---|
| A-001 | [Assumption] | [Impact] | [Evidence] | [Owner] | [Date] | Open |

## Issues

| ID | Issue | Impact | Severity | Resolution plan | Owner | Due date | Status |
|---|---|---|---|---|---|---|---|
| I-001 | [Issue] | [Impact] | Low / Medium / High / Blocker | [Plan] | [Owner] | [Date] | Open |

## Dependencies

| ID | Dependency | Needed by | Provider | Due date | Risk if late | Status |
|---|---|---|---|---|---|---|
| D-001 | [Dependency] | [Workstream] | [Provider] | [Date] | [Risk] | Open |
'@

Write-TextFile -Path (Join-Path $templateRoot "go-live-readiness-checklist.md") -Content @'
# Go-Live Readiness Checklist

Use during SAP Activate Deploy for go/no-go preparation.

## Readiness Summary

| Field | Value |
|---|---|
| Program / release | [Name] |
| Planned go-live | [Date] |
| Decision forum | [Committee] |
| Recommendation | Go / Go with conditions / No-Go |
| Main blockers | [Summary] |

## Workstream Readiness

| Workstream | Exit criteria | Evidence required | Owner | Status | Blocker? |
|---|---|---|---|---|---|
| Cutover | Approved runbook, checkpoints, rollback, communications | [Evidence] | [Owner] | Red / Amber / Green | Yes / No |
| Data migration | Loads reconciled and signed off | [Evidence] | [Owner] | Red / Amber / Green | Yes / No |
| Testing | No open Sev1; Sev2 accepted with workaround | [Evidence] | [Owner] | Red / Amber / Green | Yes / No |
| Integrations | E2E tested, monitored, support owner assigned | [Evidence] | [Owner] | Red / Amber / Green | Yes / No |
| Security | Roles and access validated; SoD exceptions accepted | [Evidence] | [Owner] | Red / Amber / Green | Yes / No |
| Training | Critical users trained and ready | [Evidence] | [Owner] | Red / Amber / Green | Yes / No |
| Operations | Hypercare, AMS, monitoring, jobs, backup ready | [Evidence] | [Owner] | Red / Amber / Green | Yes / No |
| Fiscal / compliance | Country requirements validated | [Evidence] | [Owner] | Red / Amber / Green | Yes / No |

## No-Go Blockers

| ID | Blocker | Impact | Owner | Required evidence | Target resolution |
|---|---|---|---|---|---|
| B-001 | [Blocker] | [Impact] | [Owner] | [Evidence] | [Date] |

## Conditional Go Items

| Condition | Required before | Owner | Evidence | Decision owner | Status |
|---|---|---|---|---|---|
| [Condition] | [Milestone/date] | [Owner] | [Evidence] | [Approver] | Open |

## Residual Risks for Acceptance

| Risk | Workaround / mitigation | Business owner | Approval forum | Expiry / review date |
|---|---|---|---|---|
| [Risk] | [Mitigation] | [Owner] | [Forum] | [Date] |
'@

Write-TextFile -Path (Join-Path $templateRoot "hypercare-triage-table.md") -Content @'
# Hypercare Triage Table

Use during SAP Activate Run and post-go-live stabilization.

## Severity Model

Validate SLA and escalation targets against the client contract, PMO governance, and AMS model.

| Severity | Typical meaning | Expected governance |
|---|---|---|
| P1 | Business-critical outage, compliance blocker, or process stop with no viable workaround | War room, executive visibility, named owner, restore-service target often measured in hours |
| P2 | Major process impairment with workaround or high business impact | Daily leadership review, mitigation owner, target within agreed operating window |
| P3 | Localized defect, adoption issue, data correction, or non-critical integration/reporting issue | Normal hypercare cadence, owner and due date |
| P4 | Enhancement, optimization, or non-critical request | Continuous-improvement backlog with value and priority |

## Incident Register

| ID | Severity | Process area | Incident | Business impact | Workaround | Root cause | Owner | SLA / target | Escalation | Status | Backlog item |
|---|---|---|---|---|---|---|---|---|---|---|---|
| H-001 | P1 / P2 / P3 / P4 | [Process] | [Issue] | [Impact] | [Workaround] | [Cause] | [Owner] | [Target] | [Path] | Open | [Backlog] |

## Hypercare Exit Criteria

- P1 incidents are closed.
- P2 incidents are closed or formally accepted with workaround, owner, and date.
- Recurring issues have documented root cause and permanent-fix backlog.
- Workarounds are approved, controlled, and have expiry or review dates.
- AMS/support handoff is complete with RACI, SLA, channels, knowledge transfer, and escalation path.
- Monitoring is active for critical integrations, jobs, fiscal flows, interfaces, and business KPIs.
- Process owners sign off stabilization by process area.
- Residual risks are documented and accepted by the right governance forum.
'@

Write-TextFile -Path (Join-Path $templateRoot "technical-readiness-review.md") -Content @'
# Technical Readiness Review

Use for cross-technical SAP readiness reviews before build, transport, or go-live gates.

## Review Context

| Field | Value |
|---|---|
| Scope | [Application / integration / platform / database / identity] |
| Environment | DEV / QA / PRD |
| Review type | Architecture / Build / Transport / Go-live |
| Evidence source | [Files, exports, screenshots, logs, tenant checks] |
| Recommendation | Green / Amber / Red |

## Findings

| Severity | Area | Finding | Evidence | Impact | Recommendation | Verification |
|---|---|---|---|---|---|---|
| Critical / High / Medium / Low | [Area] | [Finding] | [Evidence] | [Impact] | [Fix] | [Check] |

## Acceptance Checklist

| Area | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| Security | Secrets are not hardcoded; roles and auth are validated | [Evidence] | [Owner] | Red / Amber / Green |
| Operations | Monitoring, alerting, runbook, and support owner exist | [Evidence] | [Owner] | Red / Amber / Green |
| Transport | Dependencies and target parameters are documented | [Evidence] | [Owner] | Red / Amber / Green |
| Testing | Positive, negative, and regression tests are documented | [Evidence] | [Owner] | Red / Amber / Green |
| Rollback | Recovery or rollback path is documented | [Evidence] | [Owner] | Red / Amber / Green |

## Pending Checks

| Check | Why it matters | Owner | Needed by |
|---|---|---|---|
| [Check] | [Reason] | [Owner] | [Date] |
'@

Write-TextFile -Path (Join-Path $templateRoot "integration-transport-readiness.md") -Content @'
# Integration Transport Readiness

Use for SAP Integration Suite iFlow/API/Event transport readiness.

## Readiness Status

| Field | Value |
|---|---|
| Artifact / package | [Name] |
| Source environment | [DEV / QA] |
| Target environment | [QA / PRD] |
| Recommendation | Green / Amber / Red |
| Transport decision | Approve / Approve with conditions / Block |

## Mandatory Acceptance Checklist

| Area | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| Adapters | Sender and receiver adapter settings reviewed | [Export / screenshot] | [Owner] | Red / Amber / Green |
| Authentication | Inbound and outbound auth methods approved | [Evidence] | [Owner] | Red / Amber / Green |
| Credentials | Credential aliases exist in target and no secrets are embedded | [Evidence] | [Owner] | Red / Amber / Green |
| Certificates / known hosts | SFTP known hosts, certificates, or keys validated | [Evidence] | [Owner] | Red / Amber / Green |
| Externalized parameters | DEV/QA/PRD values documented | [Matrix] | [Owner] | Red / Amber / Green |
| Mapping | Positive and negative mapping tests passed | [Test log] | [Owner] | Red / Amber / Green |
| Error handling | Exception subprocess and error classifications defined | [Design / test] | [Owner] | Red / Amber / Green |
| Retry / idempotency | Retry behavior will not duplicate, overwrite, or corrupt output | [Test] | [Owner] | Red / Amber / Green |
| Observability | MPL properties, correlation ID, alerts, and runbook ready | [Evidence] | [Owner] | Red / Amber / Green |
| Transport dependencies | Scripts, mappings, value mappings, and package metadata included | [Transport list] | [Owner] | Red / Amber / Green |

## Runtime Checks Pending

| Check | Target environment | Owner | Status |
|---|---|---|---|
| Connectivity test | [QA / PRD] | [Owner] | Pending |
| Failed-message retry test | [QA / PRD] | [Owner] | Pending |
| Alert routing test | [QA / PRD] | [Owner] | Pending |
'@

Write-TextFile -Path (Join-Path $templateRoot "btp-platform-readiness.md") -Content @'
# BTP Platform Readiness

Use for SAP BTP subaccount and workload readiness reviews.

## Readiness Status

| Field | Value |
|---|---|
| Global account / subaccount | [Name] |
| Region | [Region] |
| Environments | DEV / QA / PRD |
| Runtime | Cloud Foundry / Kyma / Other |
| Recommendation | Green / Amber / Red |

## Platform Prerequisites

| Category | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| Account model | Directory/subaccount/environment model approved | [Evidence] | [Owner] | Red / Amber / Green |
| Entitlements | Required services, plans, and quotas assigned | [Evidence] | [Owner] | Red / Amber / Green |
| Identity | Trust, groups, role collections, and fallback admin validated | [Evidence] | [Owner] | Red / Amber / Green |
| Connectivity | Cloud Connector, destinations, DNS, firewall, and auth validated | [Evidence] | [Owner] | Red / Amber / Green |
| Deployment | CF org/spaces, pipeline, build, deploy, rollback defined | [Evidence] | [Owner] | Red / Amber / Green |
| Operations | Monitoring, audit, logging, backup, support, FinOps ready | [Evidence] | [Owner] | Red / Amber / Green |

## Workload Acceptance

| Workload | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| CAP | Service deploys, binds to HANA/XSUAA, auth works | [Evidence] | [Owner] | Red / Amber / Green |
| Fiori | App builds and is reachable through target shell/repository | [Evidence] | [Owner] | Red / Amber / Green |
| HANA Cloud | Instance sized, bound, backed up, and access tested | [Evidence] | [Owner] | Red / Amber / Green |
| Integration Suite | Required capability and package deploy tested | [Evidence] | [Owner] | Red / Amber / Green |
| Destinations | S/4HANA destination works with intended authentication | [Evidence] | [Owner] | Red / Amber / Green |
| Transports | DEV to QA transport path is proven before PRD | [Evidence] | [Owner] | Red / Amber / Green |
'@

Write-TextFile -Path (Join-Path $templateRoot "ui5-quality-review.md") -Content @'
# UI5 Quality Review

Use for SAPUI5/OpenUI5 code review reports.

## Review Context

| Field | Value |
|---|---|
| App / namespace | [Name] |
| UI5 version | [Version] |
| Files reviewed | [Files] |
| Review mode | Read-only / Fix planning / Apply approved fixes |

## Findings

| Severity | Category | File / location | Finding | Evidence status | Impact | Owner | Recommendation | Verification |
|---|---|---|---|---|---|---|---|---|
| Critical / High / Medium / Low | Security | [File:line] | [Finding] | Confirmed / Assumed / Needs check | [Impact] | [Owner] | [Fix] | [Check] |

## Severity Guide

| Severity | Meaning |
|---|---|
| Critical | Security/stability issue that can block production |
| High | Major performance, deprecation, or support risk |
| Medium | Should fix for quality, accessibility, reliability, or maintainability |
| Low | Nice-to-have cleanup or documentation improvement |

## Review Categories

- Security: XSS, CSP, unsafe HTML, direct DOM, input validation.
- Performance: large list rendering, missing paging, excessive bindings, sync loading.
- Accessibility: icon-only buttons, labels, keyboard, screen reader behavior.
- Deprecation: `jQuery.sap.*`, sync require, deprecated controls/APIs.
- Architecture: MVC boundaries, model usage, routing, component structure.
- Reliability: missing error callbacks, busy state, message handling, logging.

## Verification Plan

| Check | Command / method | Expected result |
|---|---|---|
| UI5 linter | [Command] | No critical/high findings |
| Manual security smoke | [Method] | No unsafe rendering |
| Accessibility smoke | [Method] | Names and keyboard flow valid |
| Performance smoke | [Method] | No full-load or rendering bottleneck |
'@

Write-TextFile -Path (Join-Path $templateRoot "identity-security-readiness.md") -Content @'
# Identity Security Readiness

Use for SAP Cloud Identity Services, IAS, IPS, BTP trust, SSO, and role mapping reviews.

## Readiness Status

| Field | Value |
|---|---|
| Scope | IAS / IPS / BTP trust / Role mapping / App auth |
| Protocol | SAML / OIDC / Mixed / Unknown |
| Recommendation | Green / Amber / Red |
| Main risk | [Summary] |

## Findings

| Area | Finding | Impact | Evidence needed | Recommendation | Owner |
|---|---|---|---|---|---|
| Trust | [Finding] | [Impact] | [Evidence] | [Action] | [Owner] |
| Mapping | [Finding] | [Impact] | [Evidence] | [Action] | [Owner] |
| Provisioning | [Finding] | [Impact] | [Evidence] | [Action] | [Owner] |
| Certificates | [Finding] | [Impact] | [Evidence] | [Action] | [Owner] |
| Roles | [Finding] | [Impact] | [Evidence] | [Action] | [Owner] |
| Operations | [Finding] | [Impact] | [Evidence] | [Action] | [Owner] |

## Safe Verification Steps

1. Compare affected and unaffected users without changing configuration.
2. Confirm user and group membership in the identity source.
3. Check IPS job result and transformation output for the same users.
4. Confirm BTP trust origin and role collection group mapping.
5. Inspect sanitized SAML/JWT claims for subject, email, and groups.
6. Validate fallback admin access before certificate or trust changes.
7. Plan certificate rotation with rollback and monitoring.

## Pending Tenant Checks

| Check | Evidence | Owner | Status |
|---|---|---|---|
| IdP origin alignment | [Screenshot/export] | [Owner] | Pending |
| Group claim release | [Sanitized assertion/token] | [Owner] | Pending |
| Role collection mapping | [Export/screenshot] | [Owner] | Pending |
| IPS provisioning result | [Job log] | [Owner] | Pending |
| Certificate expiry and rotation plan | [Metadata/change plan] | [Owner] | Pending |
'@

Write-TextFile -Path (Join-Path $templateRoot "INDEX.md") -Content @'
# SAP Codex Output Templates

Use these copy-ready templates when producing repeatable SAP consulting, delivery, and technical readiness artifacts. Replace bracketed placeholders with client-specific, evidence-bound content.

| Template | Use for |
|---|---|
| `fit-to-standard-delta-log.md` | SAP Activate Explore workshops and standard-first delta tracking |
| `process-diagnostic-summary.md` | End-to-end process diagnostics and advisory summaries |
| `raid-log.md` | Risks, assumptions, issues, and dependencies |
| `go-live-readiness-checklist.md` | SAP Activate Deploy go/no-go preparation |
| `hypercare-triage-table.md` | SAP Activate Run stabilization and incident triage |
| `technical-readiness-review.md` | Cross-technical readiness reviews |
| `integration-transport-readiness.md` | Integration Suite transport approval gates |
| `btp-platform-readiness.md` | BTP subaccount and workload readiness |
| `ui5-quality-review.md` | UI5 static review and remediation planning |
| `identity-security-readiness.md` | IAS/IPS/BTP trust and role mapping readiness |

## Use Rules

- Preserve confirmed facts, assumptions, risks, evidence gaps, and next actions as separate sections.
- Do not treat templates as proof of SAP tenant behavior or legal compliance.
- Validate country-specific fiscal items with the client tax/legal owners.
- Keep production-impacting actions approval-gated.
'@

Write-TextFile -Path (Join-Path $docsRoot "template-library.md") -Content @'
# Template Library

The Codex SAP port includes a shared template layer at `.agents/templates`.

## Template Groups

Consulting and Activate:

- `fit-to-standard-delta-log.md`
- `process-diagnostic-summary.md`
- `raid-log.md`
- `go-live-readiness-checklist.md`
- `hypercare-triage-table.md`

Technical readiness:

- `technical-readiness-review.md`
- `integration-transport-readiness.md`
- `btp-platform-readiness.md`
- `ui5-quality-review.md`
- `identity-security-readiness.md`

## Recommended Use

- Use templates as output scaffolds, not as evidence.
- Keep bracketed placeholders until client-specific facts are available.
- Copy only the sections needed for the current deliverable.
- Use the related process skill or role playbook before filling technical templates.
- Keep MCP, hook, tenant, and credential-dependent checks marked pending unless explicitly validated.
'@

Write-Output "Output templates written to .agents/templates."
