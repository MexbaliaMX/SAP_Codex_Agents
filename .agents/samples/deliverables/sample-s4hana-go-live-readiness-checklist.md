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