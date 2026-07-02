---
name: sap-activate-deploy
description: "SAP Activate Deploy phase advisory. Use for cutover, migration readiness, go-live criteria, training, business readiness, operational handover, production controls, and launch risk decisions."
---

# SAP Activate Deploy Advisory

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

- Build cutover plan, business readiness checklist, technical readiness checklist, data migration status, and go/no-go criteria.
- Confirm training completion, support model, access, integrations, batch jobs, monitoring, fallback, and communication plan.
- Separate mandatory go-live blockers from accepted residual risks.
- Produce executive-ready go-live recommendation with evidence and owners.

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