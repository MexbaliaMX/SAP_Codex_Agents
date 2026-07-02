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