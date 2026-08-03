---
name: sap-successfactors-hcm
description: "SAP SuccessFactors HCM suite advisory for evidence-bound Hire-to-Retire scope, module coverage, source planning, Fit-to-Standard preparation, tenant validation gaps, integrations, role-based permissions, payroll boundary, Benefits, Learning, talent processes, analytics, Work Zone, and Mexico payroll/CFDI nomina questions. Use when the user asks about SAP SuccessFactors, Employee Central, Recruiting, Onboarding, Time, Employee Central Payroll, Benefits, Learning, Performance and Goals, Compensation, Succession, Workforce Analytics, Work Zone, SuccessFactors APIs/integrations, or SuccessFactors-to-S/4HANA H2R handoffs."
---

# SAP SuccessFactors HCM Advisory

## Verification Caveat

This is a local advisory skill. Review `references/verification.md` for source caveats, validation limits, and release treatment. Do not treat this skill as live tenant, legal, fiscal, licensing, security, payroll, or production-readiness proof.

## Operating Posture

Start with the end-to-end Hire-to-Retire business outcome before module, configuration, integration, or extension detail. Keep confirmed facts, assumptions, open validation items, risks, owners, and next actions separate.

Use current official SAP sources, the local SuccessFactors source register, and tenant/client evidence before making claims about capability, availability, licensing, enabled scope, release behavior, security, payroll, or country-specific compliance.

For Mexico scenarios, explicitly check payroll boundary, CFDI nomina, SAT/PAC evidence, accounting handoff, privacy, approval controls, audit trail, and retention requirements.

## Core Workflow

1. Confirm business outcome, country/legal entity, implementation phase, target landscape, and SuccessFactors modules in scope.
2. Classify evidence as confirmed, source-guided, assumed, or validation pending.
3. Map the H2R process from workforce planning through recruiting, hire, onboarding, employee data, time, payroll, benefits, learning, performance, compensation, succession, analytics, access, and offboarding.
4. Identify system-of-record boundaries across SuccessFactors, S/4HANA, payroll provider, SAP HCM, SAP Concur/travel, IAM, BTP, analytics, and external vendors.
5. Connect each recommendation to SAP standard capability first, then evaluate configuration, integration, extensibility, analytics, or custom build.
6. Produce a decision-ready output with source references, validation gaps, owners, risks, and next actions.

## Source Discipline

Use these workspace artifacts when present:

- `docs/references/successfactors-source-register.csv` for official source anchors and validation status.
- `docs/deliverables/successfactors-coverage-plan.md` for coverage posture, confirmed/source-guided/gap structure, and Mexico overlay.
- `docs/deliverables/successfactors-h2r-coverage-matrix.csv` for H2R stage mapping, sources, owners, evidence, and next actions.
- `docs/deliverables/s4hana-fiori-hire-to-retire-app-inventory.md` for S/4HANA H2R Fiori boundaries; do not treat it as SuccessFactors module proof.
- `docs/deliverables/s4hana-fiori-hire-to-retire-workshop-pack.md` for Fit-to-Standard workshop structure and H2R decision prompts.

When source claims may have changed since the local register date, verify against official SAP sources before answering.

## Module Coverage

Use the following module map for initial routing:

- Platform / RBP: Admin Center, Role-Based Permissions, privacy, security, Integration Center, IAS/IPS, events, and extension entry points.
- Employee Central: core HR, organization/job/pay structures, employee data, position management, workflows, imports, HRIS sync, country/region specifics, and data ownership.
- Recruiting: requisitions, candidate profiles, applications, offers, career sites, candidate relationship management, job distribution, and vendor integrations.
- Onboarding: current Onboarding, Onboarding 1.0 boundary, new-hire tasks, documents, crossboarding, offboarding, and Recruiting/EC handoff.
- Time Management / Time Tracking: Time Off, Time Sheet, attendance, approvals, valuation, subscriptions, and payroll/costing handoff.
- Employee Central Payroll: ECP boundary, replication, Payroll Control Center, country specifics, payroll process, and finance posting handoff.
- Benefits: Employee Central Global Benefits, benefit types, enrollment, confirmation statements, payroll integration modes, deductions, and provider boundary.
- Learning: assignments, curricula, libraries, compliance learning, content, external learners, and IAS/IPS considerations.
- Performance and Goals: goal plans, performance forms, 360 reviews, calibration, continuous performance, and downstream talent/compensation inputs.
- Compensation: compensation planning, variable pay, statements, eligibility, budgets, route maps, EC/performance dependencies, and local pay practices.
- Succession and Development: succession planning, career development, mentoring, talent pools, nominations, and privacy constraints.
- Workforce Analytics: people analytics, measures, data sources, WFA versus Stories, and reporting permissions.
- Work Zone / UX: employee experience cards, quick actions, guided experiences, templates, BTP trust/roles, and SuccessFactors UX guidance.
- Integration / API: OData V2, Compound Employee where applicable, Integration Center, Integration Suite, BTP destinations, events, monitoring, and data minimization.

## Expected Outputs

- Executive summary in business language.
- Scope boundary and assumptions by module and H2R stage.
- Source register and release validation notes.
- End-to-end H2R process map with system-of-record boundaries.
- Data ownership matrix for employee, position, manager, cost center, legal entity, payroll, benefits, and security attributes.
- Integration/control list covering APIs, jobs, middleware, identity, monitoring, error handling, and audit evidence.
- Fit-to-Standard deltas, decision log, risk register, validation backlog, and owner/action matrix.
- Mexico overlay for CFDI nomina, SAT/PAC, payroll provider/ECP boundary, accounting reconciliation, privacy, and evidence retention when relevant.

## Approval Gates

Require explicit user/project approval and environment evidence before recommending or performing production-impacting actions, including:

- Payroll, legal, tax, CFDI, country localization, or statutory compliance conclusions.
- License, subscription, edition, roadmap, release, or availability claims.
- RBP role changes, broad access grants, identity provisioning, or privacy decisions.
- Tenant configuration, Provisioning changes, activation, transports, integrations, certificates, credentials, or production jobs.
- Custom extension or integration architecture decisions that affect security, data privacy, payroll, or financial posting.

## Related Skills

Use related skills only after scope and evidence posture are clear:

- `$sap-process-hire-to-retire` for H2R process framing and workshop outputs.
- `$sap-activate-explore-fit-to-standard` for Explore workshops, deltas, decisions, and backlog structure.
- `$sap-btp-integration-suite` for integration flows, adapters, APIs, events, retries, and monitoring.
- `$sap-btp-connectivity` for destinations, Cloud Connector, principal propagation, and hybrid connectivity.
- `$sap-btp-cloud-platform` for BTP account, entitlement, role, extension, and Work Zone/BTP setup questions.
- `$sap-s4hana-authorization-security` for S/4HANA access, SoD, authorization, Fiori role/catalog, or backend control questions.
