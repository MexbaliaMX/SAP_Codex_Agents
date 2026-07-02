---
name: sap-activate-realize
description: "SAP Activate Realize phase advisory. Use for configuration, build, extensions, integrations, data migration cycles, testing, defect triage, sprint planning, transport readiness, and release governance."
---

# SAP Activate Realize Advisory

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

- Convert approved design into configuration, build, integration, data, security, testing, and change work packages.
- Track sprint scope, defects, dependencies, decisions, transports, test evidence, and readiness criteria.
- Confirm that every extension or integration has a business owner, evidence, fallback, and operations handoff.
- Keep production-impacting changes approval-gated.

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