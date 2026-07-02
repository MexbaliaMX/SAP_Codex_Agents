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