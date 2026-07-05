---
name: sap-activate-explore-fit-to-standard
description: "SAP Activate Explore and Fit-to-Standard advisory. Use for fit-to-standard workshops, process delta logs, design decisions, backlog shaping, scope control, standard-first recommendations, and avoiding premature custom design."
---

# SAP Activate Explore Fit-to-Standard Advisory

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

- Start from SAP standard process and demo script before discussing custom design.
- Capture fit, gap, configuration, extension, integration, data, reporting, security, and change impacts.
- Maintain process delta log, decision log, assumption log, and evidence links.
- Push unresolved questions into backlog or validation actions instead of inventing answers.

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
