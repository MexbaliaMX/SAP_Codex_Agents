# Hypercare Triage Playbook

Use this playbook when the user needs to organize post-go-live incidents, stabilization actions, severity, workarounds, root-cause tracking, support handoff, or hypercare exit.

## Routing

1. Start with `sap-activate-run`.
2. Add relevant process skills based on affected business flow.
3. Add technical skills when the incident involves integration, BTP, connectivity, identity, development, database, or UI behavior.
4. Use `.agents/templates/hypercare-triage-table.md` for the output.

## Required Inputs

- Incident list with business impact, affected process, start time, workaround, owner, and current status.
- Severity definitions from client contract, PMO governance, or AMS model.
- Integration/job/interface monitoring evidence.
- Process owner feedback and business KPI impact.
- Known defects, transports, data corrections, or configuration changes.
- Support handoff model, escalation path, and hypercare exit criteria.

## Triage Flow

1. Confirm severity rules. If absent, use the provisional P1-P4 starter from `.agents/references/sap-activate-governance.md` and mark it pending validation.
2. Classify each item by process, severity, impact, workaround, owner, root-cause status, permanent fix, and target date.
3. Separate restoration, mitigation, root cause, permanent fix, and enhancement requests.
4. Identify recurring issues and convert them into problem records or continuous-improvement backlog items.
5. Track hypercare exit criteria: critical incidents closed or accepted, workarounds approved, AMS handoff complete, monitoring active, process owner signoff, and residual risks accepted.

## Approval Gates

- SLA or severity commitments.
- Incident closure and workaround acceptance.
- Production data correction, transport, or configuration change.
- Fiscal/legal impact resolution.
- Hypercare exit approval.

## Output Shape

- Confirmed facts.
- Incident triage table.
- Severity assumptions.
- P1/P2 escalation items.
- Workarounds and expiry/review dates.
- Root-cause and permanent-fix backlog.
- Hypercare exit readiness.
- Owners and next actions.
