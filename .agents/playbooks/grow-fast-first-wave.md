# GROW Fast First-Wave Playbook

Use this playbook when the user needs to qualify, plan, route, govern, or review an SAP GROW Fast first productive wave.

## Routing

1. Start with `sap-grow-fast`.
2. Add the relevant SAP Activate phase skill:
   - `sap-activate-discover` for qualification and scope hypothesis.
   - `sap-activate-prepare` for governance, RACI, tooling, access, and workshop readiness.
   - `sap-activate-explore-fit-to-standard` for standard walkthroughs, deltas, decisions, and backlog.
   - `sap-activate-realize` for configuration, migration cycles, testing, defects, and walkthrough evidence.
   - `sap-activate-deploy` for cutover, go/no-go readiness, and support handoff.
   - `sap-activate-run` for hypercare, stabilization, adoption, and expansion-wave intake.
3. Add process skills for in-scope flows, usually:
   - `sap-process-record-to-report`
   - `sap-process-order-to-cash`
   - `sap-process-procure-to-pay`
4. Add technical skills only when confirmed impacts exist for BTP, integration, connectivity, identity, development, analytics, or data.
5. Use existing templates for delta log, RAID, go-live readiness, hypercare, or technical readiness outputs until dedicated GROW Fast templates are added.

## Required Inputs

- Customer, industry, country, legal entity, and intended first-wave scope boundary.
- Target timeline, SAP Activate phase, governance model, decision forum, and system of record.
- DDA, CBC, Cloud ALM, project plan, RACI, cookbook, workshop, migration, and testing evidence available.
- In-scope processes, integrations, reports, forms, roles, data objects, and localization requirements.
- Customer key-user availability and named owners for scope, configuration, data, testing, training, cutover, and support.
- Known constraints, excluded items, and candidate expansion-wave backlog.

## First-Wave Flow

1. Confirm the first-wave boundary: one legal entity, one SAP-delivered country version, fixed process scope, and explicit exclusions unless approved otherwise.
2. Validate qualification evidence: DDA/scoping output, country/localization fit, executive sponsor, key-user availability, and high-complexity risks.
3. Establish governance: RACI, steering cadence, decision forum, signoff authorities, RAID log, Cloud ALM ownership, and shared evidence repository.
4. Freeze scope: process scope, localization additions, initial activation considerations, data objects, integration boundary, and future-wave backlog.
5. Complete cookbook readiness: provisioning settings, organizational structure, Finance, O2C, P2P, project users, and migration templates.
6. Run standard-first workshops: demo standard process, capture only first-wave configuration decisions, and move nonessential gaps into backlog.
7. Prepare migration and testing: object ownership, extraction rules, load sequence, reconciliation, Cloud ALM tests, walkthroughs, and defect triage.
8. Govern cutover and go-live: production data load, go/no-go evidence, training, support model, hypercare severity model, and stabilization criteria.
9. Convert deferred scope into expansion waves with owner, value, risk, dependency, and evidence needed.

## Approval Gates

- First-wave scope freeze and exclusions.
- Irreversible or hard-to-change preset decisions such as fiscal year variant, ledger setup, group currency, and organizational structure.
- Country-specific fiscal/legal scope and audit evidence.
- Custom extension, nonstandard integration, complex workflow, role redesign, or form redesign.
- Migration object scope, reconciliation, and deferral decisions.
- Solution walkthrough, testing readiness, cutover approval, go-live approval, and residual-risk acceptance.

## Mexico Validation Prompts

- CFDI issuance, cancellation, reissue, monitoring, and evidence.
- Complementos de pago when payment evidence is relevant.
- Carta Porte when transport/logistics scenarios require it.
- Document and reporting compliance scope, statutory reports, tax evidence, and audit retention.
- SAT identifiers, master data quality, approval controls, role evidence, and reconciliation records.

## Output Shape

- Confirmed facts.
- Assumptions.
- First-wave scope boundary.
- Routing to Activate, process, technical, and deliverable assets.
- Readiness by workstream.
- Decisions and signoff gates.
- RAID and backlog entries.
- Mexico or country-specific validation gaps.
- Owners and next actions.