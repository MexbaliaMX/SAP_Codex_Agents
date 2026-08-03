# SuccessFactors HCM Smoke Prompts

Use these prompts to sanity-check `.agents/skills/sap-successfactors-hcm/SKILL.md` before treating the skill as usable for project advisory work. These are local reasoning checks, not live SAP tenant validation, legal/tax validation, licensing confirmation, payroll proof, security approval, or production-readiness evidence.

Expected response shape for each prompt:

- Separate confirmed facts, assumptions, validation gaps, risks, owners, and next actions.
- Use the local source register and coverage artifacts where helpful.
- Preserve the distinction between source-guided coverage and tenant-validated coverage.
- Include Mexico CFDI nomina, SAT/PAC, payroll boundary, privacy, audit trail, and accounting evidence prompts when relevant.
- Do not claim SuccessFactors modules, subscriptions, roles, APIs, country localizations, or tenant behavior are available without evidence.

## 1. Recruit-to-Hire Boundary

Use `$sap-successfactors-hcm` to map a recruit-to-hire process where SAP SuccessFactors Recruiting initiates a job requisition, Onboarding collects new-hire data, and Employee Central becomes the employee system of record. Include system boundaries, data ownership, role-based permissions, integration touchpoints, assumptions, risks, validation evidence, and Fit-to-Standard next actions.

## 2. Employee Central Data Ownership

Use `$sap-successfactors-hcm` to create a data ownership matrix for Employee Central covering employee ID, person data, employment data, job information, position, manager, cost center, legal entity, pay components, and payroll-relevant attributes. Include which evidence is needed from tenant configuration, workflows, data models, picklists, role permissions, and downstream S/4HANA or payroll integrations.

## 3. Time and Payroll Handoff

Use `$sap-successfactors-hcm` to assess a time-to-payroll handoff where Time Off, Time Sheet, and optional Time Tracking feed Employee Central Payroll or an external payroll provider. Include subscription and provisioning assumptions, approval evidence, time valuation, replication, error handling, payroll calendar, finance posting, and owner signoff gaps.

## 4. Benefits Payroll Integration

Use `$sap-successfactors-hcm` to evaluate Employee Central Global Benefits for allowances, reimbursements, insurance, pension, savings plans, deductible allowances, and other benefits. Include enrollment, eligibility, benefit confirmation statements, payroll integration modes, pay components, recurring deductions, provider boundary, employee self-service, tenant evidence, and payroll owner validation.

## 5. RBP Privacy Review

Use `$sap-successfactors-hcm` to review a proposed Role-Based Permissions model for HR administrators, managers, employees, external learners, onboarding users, payroll users, and integration users. Include target populations, sensitive employee data, paystub/benefit visibility, audit evidence, SoD concerns, IAS/IPS handoff, privacy approval, and least-privilege next actions.

## 6. Learning Compliance

Use `$sap-successfactors-hcm` to frame a compliance-learning process in SAP SuccessFactors Learning where internal employees and external learners receive required curricula, complete courses, and need auditable completion evidence. Include Learning-only user identity assumptions, IAS/IPS, assignment rules, libraries, content providers, completion reporting, role permissions, and validation gaps.

## 7. Performance-to-Compensation

Use `$sap-successfactors-hcm` to map a performance-to-compensation process where goals and performance forms influence compensation planning and variable pay. Include Employee Central prerequisites, templates, route maps, rating scales, calibration, eligibility, budgets, worksheets, statements, privacy controls, owner decisions, and tenant evidence required before using ratings for compensation.

## 8. Mexico Payroll Boundary

Use `$sap-successfactors-hcm` to prepare a Mexico payroll boundary decision for a landscape considering Employee Central Payroll, SAP HCM, an external payroll provider, or a local payroll system. Include CFDI nomina, XML/PDF, UUID, PAC/SAT, cancellation/reissue, legal entity, payroll calendar, time data, benefits deductions, accounting posting, reconciliation, evidence retention, risks, and required Tax/Payroll/Finance signoffs.

## 9. Offboarding and Access Closeout

Use `$sap-successfactors-hcm` to define an offboarding control flow across Employee Central, Onboarding/Offboarding, IAM, Learning, Benefits, payroll, travel/expense, and S/4HANA finance clearing. Include termination event reasons, tasks, document flows, role deprovisioning, final pay, benefit closeout, learning/license cleanup, open advances, audit trail, and owner validation.

## 10. Integration and API Readiness

Use `$sap-successfactors-hcm` to create an integration readiness checklist for SuccessFactors-to-S/4HANA and BTP interfaces involving OData V2 APIs, Integration Center jobs, Integration Suite flows, identity provisioning, payroll replication, and Cloud ALM monitoring. Include API user permissions, OAuth/certificates, destinations, data minimization, error handling, monitoring, retry/idempotency, audit evidence, and approval gates.

## 11. Work Zone Employee Experience

Use `$sap-successfactors-hcm` to assess whether SAP SuccessFactors Work Zone should be in scope for an H2R employee experience. Include cards, quick actions, guided experiences, Learning/EC/Benefits entry points, BTP trust and roles, content package evidence, accessibility, branding, privacy, tenant validation, and fallback to standard SuccessFactors home page if Work Zone is deferred.

## 12. End-to-End H2R Fit-to-Standard

Use `$sap-successfactors-hcm` together with `$sap-process-hire-to-retire` to prepare a Fit-to-Standard workshop plan for an H2R transformation covering Recruiting, Onboarding, Employee Central, Time, Employee Central Payroll, Benefits, Learning, Performance and Goals, Compensation, Succession, Workforce Analytics, Work Zone, S/4HANA finance handoff, IAM, and Mexico payroll evidence. Include agenda, decision log starter, validation backlog, risks, owners, and outputs.
