$ErrorActionPreference = "Stop"

$sampleRoot = ".agents\samples\deliverables"
$docsRoot = "docs\porting"
New-Item -ItemType Directory -Force -Path $sampleRoot, $docsRoot | Out-Null

function Write-TextFile {
  param([string]$Path, [string]$Content)
  $fullPath = [System.IO.Path]::GetFullPath($Path)
  $dir = Split-Path -Parent $fullPath
  if ($dir) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
  [System.IO.File]::WriteAllText($fullPath, $Content, $utf8NoBom)
}

$samples = @{
  "sample-o2c-mexico-fit-to-standard-delta-log.md" = @'
# Sample O2C Mexico Fit-to-Standard Delta Log

Fictional sample for template demonstration only. No live SAP tenant, fiscal, legal, or tax validation was performed.

## Workshop Context

| Field | Value |
|---|---|
| Process | Order-to-Cash |
| Workshop | Mexico billing and logistics fit-to-standard / 2026-07-02 |
| Legal entity / country | Demo Manufacturing MX, Mexico |
| System landscape | S/4HANA Cloud public edition sandbox, no PRD access |
| Facilitator | Mexbalia solution advisor |
| Business owner | O2C process owner |

## Delta Register

| ID | Process step | Standard behavior shown | Business need / delta | Category | Disposition | Owner | Evidence required | Decision date | Status |
|---|---|---|---|---|---|---|---|---|---|
| D-001 | Billing document creation | Standard billing output uses configured eDocument/CFDI process | Confirm CFDI 4.0 fields and payment method rules for current invoice scenarios | Localization | Validate | Tax owner | Sample invoice, SAT rule matrix, tenant configuration screenshot | 2026-07-09 | Open |
| D-002 | Customer payment clearing | Standard incoming payment clearing can support complementos de pago process with correct references | Payment complement timing and ownership unclear between AR and tax team | Process / Localization | Configure | AR lead | Payment sample, clearing variant, fiscal-owner signoff | 2026-07-10 | Open |
| D-003 | Delivery with transport documentation | Standard outbound delivery supports logistics handoff but Carta Porte requirements need country-specific confirmation | Need evidence for Carta Porte trigger, data source, and exception handling | Integration / Localization | Validate | Logistics lead | Shipping scenario list, carrier data, compliance review | 2026-07-12 | Open |

## Validation Actions

| Action | Delta ID | Evidence needed | Owner | Due date | Result / decision |
|---|---|---|---|---|---|
| Run sample invoice through sandbox fiscal output path | D-001 | CFDI XML, app screenshot, tax-owner review | Tax owner | 2026-07-09 | Pending |
| Map payment complement ownership and cutoff timing | D-002 | RACI, AR/tax policy, sample clearing | AR lead | 2026-07-10 | Pending |
| Confirm Carta Porte applicability by shipment type | D-003 | Scenario matrix and legal/tax confirmation | Logistics lead | 2026-07-12 | Pending |

## Summary

| Metric | Count |
|---|---:|
| Fit to standard | 0 |
| Configuration | 1 |
| Extension | 0 |
| Integration | 1 |
| Data | 0 |
| Reporting / analytics | 0 |
| Security / controls | 0 |
| Localization / compliance | 3 |
'@
  "sample-r2r-process-diagnostic-summary.md" = @'
# Sample R2R Process Diagnostic Summary

Fictional sample for template demonstration only. No live SAP tenant, fiscal, legal, or audit validation was performed.

## Executive Summary

The monthly close delay appears driven by late intercompany confirmations, manual accrual tracking, and inconsistent reconciliation evidence. The recommended next move is a standard-first close calendar review, followed by evidence collection for intercompany, accrual, and account reconciliation controls.

## Scope and Assumptions

| Area | Notes |
|---|---|
| Process | Record-to-Report monthly close |
| Legal entities / countries | Demo Manufacturing MX and US sales affiliate |
| Systems | S/4HANA sandbox, spreadsheet accrual tracker, shared drive evidence folder |
| Confirmed facts | Close day 5 target missed in two of last three simulated cycles |
| Assumptions | Intercompany and accrual owners can provide daily status during close |
| Validation gaps | No production job logs, no audit evidence sample, no live financial data |

## End-to-End Process Map

| Step | Trigger / input | Activity | Output | Owner | System | Control / evidence |
|---|---|---|---|---|---|---|
| 1 | Period-end calendar | Open close cockpit tasks | Task list | Close lead | S/4HANA | Approved close calendar |
| 2 | Affiliate confirmations | Match intercompany balances | Difference list | Intercompany accountant | S/4HANA / spreadsheet | Confirmation email and variance file |
| 3 | Expense estimates | Post accrual entries | Journal entries | GL accountant | S/4HANA | Accrual support and approval |
| 4 | Trial balance | Reconcile key accounts | Signoff package | Controller | S/4HANA / shared drive | Reconciliation evidence |

## Pain Point Classification

| Pain point | Category | Impact | Root-cause hypothesis | Evidence needed | Owner | Priority |
|---|---|---|---|---|---|---|
| Intercompany variances arrive after close day 3 | Process / Governance | Delays consolidation review | Calendar lacks affiliate commitment and escalation | Confirmation timestamps | Controller | High |
| Accrual support is fragmented | Control / Data | Weak audit trail and rework | Spreadsheet tracker is outside formal task ownership | Sample accrual package | GL lead | High |
| Reconciliation status is hard to scan | Reporting / Adoption | Management cannot see blockers early | Evidence stored separately from status tracker | Reconciliation list and owners | Close lead | Medium |

## Recommendations

| Recommendation | Standard capability first | Benefits | Risks | Validation step | Owner |
|---|---|---|---|---|---|
| Establish close calendar with daily owner checkpoints | SAP close task management / standard task list | Clear accountability and escalation | Requires process discipline | Pilot one simulated close cycle | Close lead |
| Define accrual evidence package | Standard journal approval and attachment discipline | Stronger audit trail | Extra preparation work | Review three sample accruals | GL lead |
| Add variance dashboard for close blockers | Standard reporting/export before custom analytics | Earlier issue visibility | May require data cleanup | Validate blocker categories | Controller |

## Next Actions

| Action | Owner | Due date | Evidence / output |
|---|---|---|---|
| Collect three close-cycle delay examples | Close lead | 2026-07-08 | Delay log |
| Confirm intercompany RACI | Controller | 2026-07-09 | Signed RACI |
| Draft accrual evidence standard | GL lead | 2026-07-10 | Evidence checklist |
'@
  "sample-delivery-raid-log.md" = @'
# Sample SAP Delivery RAID Log

Fictional sample for template demonstration only.

## Risks

| ID | Risk | Impact | Probability | Severity | Mitigation | Owner | Due date | Status |
|---|---|---|---|---|---|---|---|---|
| R-001 | Mexico fiscal scenarios are not validated before UAT | UAT defects may block billing signoff | Medium | High | Run CFDI and payment complement sample pack before UAT entry | Tax lead | 2026-07-09 | Open |
| R-002 | Identity group mapping is not aligned with business roles | Users may miss Fiori access in QA | Medium | Medium | Compare IAS groups to role collections before transport | Security lead | 2026-07-10 | Open |

## Assumptions

| ID | Assumption | Impact if false | Validation evidence | Owner | Due date | Status |
|---|---|---|---|---|---|---|
| A-001 | QA tenant configuration will be stable for UAT week 1 | Retesting and schedule slip | Change freeze approval | PMO | 2026-07-08 | Open |
| A-002 | Carrier master data includes required tax identifiers | Carta Porte testing blocked | Master data extract | Logistics lead | 2026-07-09 | Open |

## Issues

| ID | Issue | Impact | Severity | Resolution plan | Owner | Due date | Status |
|---|---|---|---|---|---|---|---|
| I-001 | Payment complement ownership unresolved | AR/tax handoff unclear | High | Confirm RACI and update workshop decision log | AR lead | 2026-07-10 | Open |

## Dependencies

| ID | Dependency | Needed by | Provider | Due date | Risk if late | Status |
|---|---|---|---|---|---|---|
| D-001 | QA role collection export | Security testing | Basis/security team | 2026-07-08 | UAT users cannot validate access | Open |
| D-002 | Integration endpoint allowlist | Integration test cycle | Network team | 2026-07-09 | iFlow connectivity test blocked | Open |
'@
  "sample-s4hana-go-live-readiness-checklist.md" = @'
# Sample S/4HANA Go-Live Readiness Checklist

Fictional sample for template demonstration only. No go-live recommendation for a real program is implied.

## Readiness Summary

| Field | Value |
|---|---|
| Program / release | Demo S/4HANA Mexico release 1 |
| Planned go-live | 2026-08-01 |
| Decision forum | Steering committee |
| Recommendation | Go with conditions |
| Main blockers | Fiscal scenario evidence and QA integration retry test remain open |

## Workstream Readiness

| Workstream | Exit criteria | Evidence required | Owner | Status | Blocker? |
|---|---|---|---|---|---|
| Cutover | Approved runbook, checkpoints, rollback, communications | Cutover v0.9 and rollback checklist | PMO | Amber | No |
| Data migration | Loads reconciled and signed off | Customer/vendor/material reconciliation | Data lead | Green | No |
| Testing | No open Sev1; Sev2 accepted with workaround | Defect list and signoff | Test manager | Amber | No |
| Integrations | E2E tested, monitored, support owner assigned | MPL logs, alert test, runbook | Integration lead | Amber | Yes |
| Security | Roles and access validated; SoD exceptions accepted | Role test report | Security lead | Green | No |
| Training | Critical users trained and ready | Attendance and readiness survey | Change lead | Amber | No |
| Operations | Hypercare, AMS, monitoring, jobs, backup ready | Support RACI and monitoring checklist | Operations lead | Green | No |
| Fiscal / compliance | Country requirements validated | CFDI, payment complement, Carta Porte evidence pack | Tax lead | Amber | Yes |

## No-Go Blockers

| ID | Blocker | Impact | Owner | Required evidence | Target resolution |
|---|---|---|---|---|---|
| B-001 | QA retry test for billing integration not completed | Failed messages may require manual recovery in PRD | Integration lead | Failed-message retry test result | 2026-07-12 |
| B-002 | Fiscal output sample pack missing tax-owner signoff | Billing compliance risk | Tax lead | Signed fiscal evidence pack | 2026-07-13 |

## Conditional Go Items

| Condition | Required before | Owner | Evidence | Decision owner | Status |
|---|---|---|---|---|---|
| Complete final cutover rehearsal with no Sev1 defects | Go/no-go meeting | PMO | Rehearsal minutes and issue log | Steering committee | Open |
| Publish hypercare contact matrix | Day -3 | Operations lead | Hypercare RACI | Program sponsor | Open |

## Residual Risks for Acceptance

| Risk | Workaround / mitigation | Business owner | Approval forum | Expiry / review date |
|---|---|---|---|---|
| Two P2 defects remain in pricing report | Manual report extract during first close | Sales ops owner | Steering committee | 2026-08-15 |
'@
  "sample-hypercare-triage-table.md" = @'
# Sample Hypercare Triage Table

Fictional sample for template demonstration only.

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
| H-001 | P1 | Billing | Billing documents not releasing for Mexico company code | Invoices cannot be issued | Hold billing batch and issue approved manual customer notice | Output parameter mismatch suspected | Billing lead | Restore same business day | War room and tax lead | Open | DEF-101 |
| H-002 | P2 | Integration | SFTP outbound acknowledgements intermittently fail | Customer ASN visibility delayed | Manual resend after monitoring review | Network timeout under investigation | Integration lead | 24 hours | Daily hypercare review | Open | DEF-118 |
| H-003 | P3 | Procurement | Buyers selecting wrong account assignment | Rework in invoice verification | Quick reference card and supervisor review | Training/adoption gap | P2P lead | 3 business days | Workstream lead | Open | CHG-022 |

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
  "sample-technical-readiness-review.md" = @'
# Sample Technical Readiness Review

Fictional sample for template demonstration only.

## Review Context

| Field | Value |
|---|---|
| Scope | CAP service, Fiori app, HANA Cloud schema, Integration Suite iFlow |
| Environment | QA |
| Review type | Go-live |
| Evidence source | Build logs, sanitized configuration exports, test summary, screenshots |
| Recommendation | Amber |

## Findings

| Severity | Area | Finding | Evidence | Impact | Recommendation | Verification |
|---|---|---|---|---|---|---|
| High | Integration | Failed-message retry behavior not proven | Retry test missing from QA evidence pack | Duplicate or lost outbound messages possible | Execute negative retry test and document idempotency | QA retry log |
| Medium | Operations | Alert recipients documented but not tested | Runbook lists mailbox only | Missed production incidents possible | Send alert test and confirm support acknowledgement | Alert delivery evidence |
| Medium | Security | Role collection mapping relies on one broad group | IAS export and role collection screenshot | Excessive access risk | Split business and support groups before PRD | Access retest |

## Acceptance Checklist

| Area | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| Security | Secrets are not hardcoded; roles and auth are validated | Static scan and role test report | Security lead | Amber |
| Operations | Monitoring, alerting, runbook, and support owner exist | Runbook v1.0 | Operations lead | Amber |
| Transport | Dependencies and target parameters are documented | Transport checklist | Release manager | Green |
| Testing | Positive, negative, and regression tests are documented | QA test summary | Test manager | Amber |
| Rollback | Recovery or rollback path is documented | Cutover appendix | PMO | Green |

## Pending Checks

| Check | Why it matters | Owner | Needed by |
|---|---|---|---|
| Integration retry test | Confirms failed messages can be recovered safely | Integration lead | 2026-07-12 |
| Alert routing test | Confirms support receives runtime notifications | Operations lead | 2026-07-12 |
'@
  "sample-integration-transport-readiness.md" = @'
# Sample Integration Transport Readiness

Fictional sample for template demonstration only. No real Integration Suite tenant was accessed.

## Readiness Status

| Field | Value |
|---|---|
| Artifact / package | DEMO_MX_Billing_Ack_iFlow |
| Source environment | DEV |
| Target environment | QA |
| Recommendation | Amber |
| Transport decision | Approve with conditions |

## Mandatory Acceptance Checklist

| Area | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| Adapters | Sender and receiver adapter settings reviewed | DEV export and peer review | Integration lead | Green |
| Authentication | Inbound and outbound auth methods approved | Auth design note | Security lead | Green |
| Credentials | Credential aliases exist in target and no secrets are embedded | QA alias checklist | Basis lead | Amber |
| Certificates / known hosts | SFTP known hosts, certificates, or keys validated | Known-host export | Integration lead | Amber |
| Externalized parameters | DEV/QA/PRD values documented | Parameter matrix | Release manager | Green |
| Mapping | Positive and negative mapping tests passed | QA mapping test log | Test manager | Green |
| Error handling | Exception subprocess and error classifications defined | iFlow design screenshot | Integration lead | Green |
| Retry / idempotency | Retry behavior will not duplicate, overwrite, or corrupt output | Negative retry test pending | Integration lead | Amber |
| Observability | MPL properties, correlation ID, alerts, and runbook ready | Monitoring checklist | Operations lead | Amber |
| Transport dependencies | Scripts, mappings, value mappings, and package metadata included | Transport list | Release manager | Green |

## Runtime Checks Pending

| Check | Target environment | Owner | Status |
|---|---|---|---|
| Connectivity test | QA | Integration lead | Pending |
| Failed-message retry test | QA | Integration lead | Pending |
| Alert routing test | QA | Operations lead | Pending |
'@
  "sample-btp-platform-readiness.md" = @'
# Sample BTP Platform Readiness

Fictional sample for template demonstration only. No real BTP tenant was accessed.

## Readiness Status

| Field | Value |
|---|---|
| Global account / subaccount | DemoCorp MX / demo-mx-qa |
| Region | us10 |
| Environments | DEV / QA |
| Runtime | Cloud Foundry |
| Recommendation | Amber |

## Platform Prerequisites

| Category | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| Account model | Directory/subaccount/environment model approved | Architecture note | Platform owner | Green |
| Entitlements | Required services, plans, and quotas assigned | Entitlement export | Platform owner | Green |
| Identity | Trust, groups, role collections, and fallback admin validated | IAS trust screenshot | Security lead | Amber |
| Connectivity | Cloud Connector, destinations, DNS, firewall, and auth validated | Destination test list | Connectivity lead | Amber |
| Deployment | CF org/spaces, pipeline, build, deploy, rollback defined | Pipeline run log | DevOps lead | Green |
| Operations | Monitoring, audit, logging, backup, support, FinOps ready | Operations checklist | Operations lead | Amber |

## Workload Acceptance

| Workload | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| CAP | Service deploys, binds to HANA/XSUAA, auth works | QA deploy log | CAP lead | Green |
| Fiori | App builds and is reachable through target shell/repository | Launchpad screenshot | Fiori lead | Green |
| HANA Cloud | Instance sized, bound, backed up, and access tested | Instance and backup evidence | DBA lead | Amber |
| Integration Suite | Required capability and package deploy tested | Package import log | Integration lead | Amber |
| Destinations | S/4HANA destination works with intended authentication | Destination check result | Connectivity lead | Amber |
| Transports | DEV to QA transport path is proven before PRD | Transport log | Release manager | Green |
'@
  "sample-ui5-quality-review.md" = @'
# Sample UI5 Quality Review

Fictional sample for template demonstration only. File names are illustrative.

## Review Context

| Field | Value |
|---|---|
| App / namespace | democorp.mx.billing.monitor |
| UI5 version | 1.120.x target |
| Files reviewed | `webapp/controller/Main.controller.js`, `webapp/view/Main.view.xml`, `webapp/manifest.json` |
| Review mode | Read-only |

## Findings

| Severity | Category | File / location | Finding | Evidence status | Impact | Owner | Recommendation | Verification |
|---|---|---|---|---|---|---|---|---|
| High | Security | `Main.controller.js:88` | User-entered message appears to be rendered without encoding review | Needs check | XSS risk if unsafe HTML rendering is confirmed | UI5 lead | Confirm control usage and enforce encoded text binding | Manual security smoke |
| Medium | Performance | `Main.view.xml:42` | Table binding has no visible growing or paging strategy | Confirmed | Large billing lists may load slowly | UI5 lead | Add growing/paging or server-side filtering | Performance smoke |
| Medium | Accessibility | `Main.view.xml:66` | Icon-only action lacks accessible text evidence | Confirmed | Screen reader users may not understand the action | UX lead | Add tooltip/aria label through standard UI5 properties | Accessibility smoke |
| Low | Deprecation | `Main.controller.js:12` | Legacy `jQuery.sap.*` pattern suspected | Needs check | Future maintenance risk | UI5 lead | Replace with modern module dependency if present | UI5 linter |

## Severity Guide

| Severity | Meaning |
|---|---|
| Critical | Security/stability issue that can block production |
| High | Major performance, deprecation, or support risk |
| Medium | Should fix for quality, accessibility, reliability, or maintainability |
| Low | Nice-to-have cleanup or documentation improvement |

## Verification Plan

| Check | Command / method | Expected result |
|---|---|---|
| UI5 linter | Project lint command | No critical/high findings |
| Manual security smoke | Attempt encoded script-like input in non-production data | No unsafe rendering |
| Accessibility smoke | Keyboard and screen reader name review | Buttons have names and keyboard flow is valid |
| Performance smoke | Load 1,000-row equivalent test data | No full-load rendering bottleneck |
'@
  "sample-identity-security-readiness.md" = @'
# Sample Identity Security Readiness

Fictional sample for template demonstration only. No real IAS, IPS, or BTP tenant was accessed.

## Readiness Status

| Field | Value |
|---|---|
| Scope | IAS trust, IPS provisioning, BTP role mapping |
| Protocol | SAML for launchpad, OIDC for CAP service |
| Recommendation | Amber |
| Main risk | Group claim and role collection mapping need proof with affected and unaffected users |

## Findings

| Area | Finding | Impact | Evidence needed | Recommendation | Owner |
|---|---|---|---|---|---|
| Trust | QA subaccount trust points to correct IAS tenant, but fallback admin evidence is missing | Recovery risk during trust changes | Admin assignment screenshot and break-glass procedure | Confirm fallback admin before any certificate or trust change | Security lead |
| Mapping | Business users rely on `MX_BILLING_USERS` group claim | Missing group claim would block Fiori access | Sanitized assertion/token for test user | Validate group release and role collection mapping | Security lead |
| Provisioning | IPS job status reviewed but transformation output not sampled | Incorrect attributes may propagate silently | IPS job log and transformed user sample | Compare affected and unaffected users | Identity admin |
| Certificates | Certificate expiry is beyond go-live but rotation plan is not documented | Future outage risk | Metadata export and rotation calendar | Add certificate rotation owner and rehearsal date | Basis lead |
| Roles | Support role collection appears broader than business role | Excessive access risk | Role collection export | Split support and business access before PRD | Security lead |
| Operations | Support escalation path exists but has not been tested | Delayed incident recovery | Test escalation record | Run one access incident drill | Operations lead |

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
| IdP origin alignment | IAS trust screenshot and subaccount origin | Security lead | Pending |
| Group claim release | Sanitized assertion/token | Security lead | Pending |
| Role collection mapping | Role collection export | Security lead | Pending |
| IPS provisioning result | Job log and transformation output | Identity admin | Pending |
| Certificate expiry and rotation plan | Metadata export and rotation calendar | Basis lead | Pending |
'@
}

foreach ($entry in $samples.GetEnumerator()) {
  Write-TextFile -Path (Join-Path $sampleRoot $entry.Key) -Content $entry.Value
}

Write-TextFile -Path (Join-Path $sampleRoot "INDEX.md") -Content @'
# SAP Codex Sample Deliverables

These files are fictional filled examples that demonstrate how to use the shared templates in `.agents/templates`. They are not evidence of live SAP tenant behavior, fiscal compliance, legal review, security approval, or production readiness.

| Sample | Template demonstrated |
|---|---|
| `sample-o2c-mexico-fit-to-standard-delta-log.md` | `fit-to-standard-delta-log.md` |
| `sample-r2r-process-diagnostic-summary.md` | `process-diagnostic-summary.md` |
| `sample-delivery-raid-log.md` | `raid-log.md` |
| `sample-s4hana-go-live-readiness-checklist.md` | `go-live-readiness-checklist.md` |
| `sample-hypercare-triage-table.md` | `hypercare-triage-table.md` |
| `sample-technical-readiness-review.md` | `technical-readiness-review.md` |
| `sample-integration-transport-readiness.md` | `integration-transport-readiness.md` |
| `sample-btp-platform-readiness.md` | `btp-platform-readiness.md` |
| `sample-ui5-quality-review.md` | `ui5-quality-review.md` |
| `sample-identity-security-readiness.md` | `identity-security-readiness.md` |

## Use Rules

- Treat every value as illustrative, not client-specific fact.
- Replace fictional company, owner, environment, and date values before reuse.
- Keep real tenant evidence, credentials, endpoints, user identifiers, and tax/legal advice out of public examples.
- Validate all fiscal, legal, security, and production-readiness claims with the responsible client owners.
'@

Write-TextFile -Path (Join-Path $docsRoot "sample-deliverables.md") -Content @'
# Sample Deliverables

The Codex SAP port includes fictional filled sample deliverables under `.agents/samples/deliverables`.

## Purpose

Samples show how the shared templates can be filled for common SAP consulting and technical-readiness scenarios without relying on live tenant access or real client data.

## Included Samples

- O2C Mexico fit-to-standard delta log
- R2R process diagnostic summary
- SAP delivery RAID log
- S/4HANA go-live readiness checklist
- Hypercare triage table
- Technical readiness review
- Integration Suite transport readiness
- BTP platform readiness
- UI5 quality review
- Identity security readiness

## Safety Notes

- All samples are fictional.
- No live SAP tenant validation was performed.
- No fiscal, legal, security, or production-readiness approval is implied.
- Real deliverables must replace illustrative owners, dates, evidence, and statuses with client-confirmed facts.
'@

Write-Output "Sample deliverables written to .agents/samples/deliverables."
