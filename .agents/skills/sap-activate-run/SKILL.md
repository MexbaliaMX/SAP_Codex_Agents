---
name: sap-activate-run
description: "SAP Activate Run phase advisory. Use for hypercare, stabilization, incident triage, adoption, continuous improvement, Cloud ALM handoff, operations governance, and post-go-live value tracking."
---

# SAP Activate Run Advisory

## Verification Caveat

This is a local advisory overlay. Review `references/verification.md` for source caveats, validation limits, and release treatment. Do not treat this skill as live tenant, legal, fiscal, licensing, security, or production-readiness proof.

## Operating Posture

Use this skill to guide SAP Activate delivery work for the named phase. Keep workstream outputs evidence-bound, implementation-safe, and human-approved before any production-impacting change.

Use this phase skill together with the relevant process skill when the work concerns an end-to-end business flow. Use technical skills only after scope, decisions, data, integration, security, and governance are clear.

## Phase Workflow

1. Confirm phase objective, project type, scope, timeline, governance model, and system landscape.
2. Establish entry criteria, required inputs, stakeholders, and decision forums.
3. Identify process, data, integration, security, testing, change, training, migration, and operations impacts.
4. Convert findings into backlog items, decisions, risks, dependencies, owners, and evidence requests.
5. Check whether Cloud ALM, Solution Manager, Jira, Azure DevOps, or another delivery tool is the system of record.
6. Produce a concise phase output with confirmed facts, assumptions, open items, risks, and next actions.

## Phase Focus

- Organize hypercare by severity, process area, root cause, owner, SLA, workaround, and permanent fix.
- Track stabilization, adoption, operational monitoring, business KPIs, and continuous-improvement backlog.
- Confirm handoff from project team to support, AMS, product owners, and process owners.
- Avoid declaring closure until open issues, ownership, and evidence are clean.
- When incident severities are not supplied, use a provisional matrix and state that SLA and escalation rules must be validated against the client contract, PMO governance, and AMS model:
  - P1: business-critical outage or compliance blocker; restore service target often measured in hours.
  - P2: major process impairment with workaround; restore or mitigate within the agreed daily operating window.
  - P3: localized issue or adoption/data defect; resolve through normal hypercare cadence.
  - P4: enhancement or non-critical reporting/adoption item; move to continuous-improvement backlog.
- Include hypercare exit criteria: critical incidents closed or formally accepted, recurring issues root-caused, workarounds approved with expiry, AMS handoff complete, monitoring active, process owners signed off, and residual risks documented.

## Expected Outputs

- Phase-specific checklist and readiness view.
- Workstream impact summary.
- Decision log entries and open questions.
- Risk, issue, dependency, and assumption list.
- Evidence needed before client-facing or production claims.
- Next actions with owners and suggested sequencing.

## Related Skills

- Use process skills for R2R, L2C, O2C, P2P, S2P, Plan-to-Produce, Design-to-Operate, and Hire-to-Retire scope.
- Use `$sap-btp-cloud-platform`, `$sap-btp-integration-suite`, `$sap-btp-connectivity`, `$sap-cap-capire`, `$sap-fiori-tools`, `$sapui5`, `$sap-abap`, `$sap-abap-cds`, `$sap-sqlscript`, and `$sap-hana-cli` for build details.

## Shared References

Read these only when needed:

- `.agents/references/sap-activate-governance.md` for phase gates, workstreams, and artifact expectations.
- `.agents/references/mexbalia-consulting-guardrails.md` for evidence and client-safe recommendations.
- `.agents/references/sap-process-language.md` for process taxonomy.
- `.agents/references/mexico-compliance-cues.md` for Mexico-specific fiscal and audit prompts.
