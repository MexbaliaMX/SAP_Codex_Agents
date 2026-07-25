---
name: sap-grow-fast
description: "SAP GROW Fast advisory for fixed-scope first-wave SAP S/4HANA Cloud Public Edition implementations. Use when planning, qualifying, routing, governing, or reviewing GROW Fast scope, DDA/CBC/Cloud ALM alignment, configuration cookbook readiness, workshop sequencing, RACI, migration, testing, signoff, cutover, hypercare, or expansion-wave backlog."
---

# SAP GROW Fast Advisory

## Verification Caveat

This is a local advisory overlay derived from user-provided accelerator context and framework conventions. Review `references/verification.md` for source caveats and handling rules. Do not treat this skill as SAP product documentation, live tenant evidence, legal/tax approval, licensing proof, security approval, or production-readiness proof.

## Operating Posture

Use this skill to keep GROW Fast work scoped, evidence-bound, and aligned to SAP Activate. Start with the first productive wave as a standard-first delivery motion, then route process, phase, data, integration, security, and adoption questions to the existing framework skills.

Keep proprietary accelerator documents, customer artifacts, tenant screenshots, and exact SAP-internal tables out of public repo outputs unless the user confirms distribution rights. Prefer paraphrased guidance, validation prompts, and source caveats.

## First-Wave Guardrails

- Treat the initial GROW Fast wave as fixed-scope and timeboxed.
- Anchor the first wave to one legal entity and one SAP-delivered country version unless evidence and governance explicitly approve a different boundary.
- Prioritize Record-to-Report, Order-to-Cash, and Procure-to-Pay scope; add other process families only when confirmed in scope.
- Use SAP standard capability and configuration before custom extension, nonstandard integration, role redesign, complex workflow, or form redesign.
- Keep additional entities, advanced integrations, custom development, deep historical migration, and nonessential enhancements in a governed expansion-wave backlog.
- Link commercial scope, Digital Discovery Assessment output, Central Business Configuration scope, Cloud ALM tasks/tests/issues, and signoff evidence wherever possible.

## Core Workflow

1. Confirm project phase, legal entity, country, scope boundary, timeline, governance model, customer availability, and system of record.
2. Classify the request as qualification, scope freeze, Prepare readiness, Fit-to-Standard, configuration cookbook, migration, testing, cutover, hypercare, or expansion-wave planning.
3. Route to the relevant SAP Activate phase skill:
   - `sap-activate-discover` for qualification, value, DDA, and scope hypothesis.
   - `sap-activate-prepare` for governance, RACI, access, Cloud ALM, project plan, and workshop readiness.
   - `sap-activate-explore-fit-to-standard` for standard walkthroughs, deltas, decisions, and backlog.
   - `sap-activate-realize` for configuration, data loads, testing, defects, and walkthrough evidence.
   - `sap-activate-deploy` for cutover, go/no-go, migration reconciliation, training, and support readiness.
   - `sap-activate-run` for hypercare, stabilization, adoption, and future-wave intake.
4. Add process skills for in-scope flows:
   - `sap-process-record-to-report` for financial settings, close, ledgers, assets, cost allocation, reporting, and audit evidence.
   - `sap-process-order-to-cash` for sales order, delivery, billing, receivables, credit, returns, e-invoicing, and payment evidence.
   - `sap-process-procure-to-pay` for requisitioning, purchasing, goods/service receipt, invoice verification, payments, approvals, and supplier controls.
5. Add technical skills only after the business/process impact is clear: BTP platform, Integration Suite, connectivity, identity, development, analytics, or database guidance.
6. Produce outputs with confirmed facts, assumptions, validation gaps, risks, decisions, owners, and next actions.

## GROW Fast Checkpoints

- Qualification: customer fit, country/localization risk, DDA completeness, initial activation considerations, executive sponsor, and key-user availability.
- Scope freeze: entity, country version, scope items, localization additions, initial activation items, data objects, integration boundary, and deferred backlog.
- Preset decisions: fiscal year variant, ledger setup, group currency, chart of accounts, organizational structure, and tax-relevant choices.
- Cookbook readiness: provisioning values, organization structure, project users, Finance, O2C, P2P, Employee Central where in scope, and migration templates.
- Workshop readiness: participants, demo/process scope, decision forum, open questions, and evidence capture model.
- Migration readiness: object ownership, extraction rules, template completion, load sequence, reconciliation, and deferral rules.
- Testing readiness: Cloud ALM test scope, happy-path and material edge tests, walkthrough evidence, defect triage, and business signoff.
- Cutover and hypercare: cutover plan, production data load, support model, issue severity, adoption, and expansion-wave backlog.

## Mexico Overlay

For Mexico scenarios, treat fiscal and audit topics as validation gates. Check CFDI, complementos de pago, Carta Porte when logistics/transport is relevant, tax evidence, cancellation/reissue procedures, e-document monitoring, statutory reporting, approvals, role evidence, migration reconciliation, and audit retention. Do not make legal or tax conclusions without client and qualified local evidence.

## Expected Outputs

- GROW Fast routing recommendation across Activate, process, technical, and deliverable assets.
- First-wave scope and assumption summary.
- Cookbook, migration, testing, and signoff readiness view.
- Fit/gap, decision, RAID, and backlog entries.
- Expansion-wave boundary and deferred-item rationale.
- Evidence requests before client-facing, contractual, fiscal, security, licensing, or production claims.

## Related Assets

- Use `.agents/playbooks/grow-fast-first-wave.md` for the first-wave delivery motion.
- Use `.agents/references/mexbalia-consulting-guardrails.md` for evidence discipline.
- Use `.agents/references/sap-activate-governance.md` for phase gates and workstreams.
- Use `.agents/references/sap-process-language.md` for process taxonomy.
- Use `.agents/references/mexico-compliance-cues.md` for Mexico validation prompts.