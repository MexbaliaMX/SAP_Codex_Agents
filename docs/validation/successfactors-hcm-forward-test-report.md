# SuccessFactors HCM Forward-Test Report

Date: 2026-08-03

## Purpose

Validate whether `.agents/skills/sap-successfactors-hcm/SKILL.md` can produce useful, evidence-bound advisory outputs on realistic SAP SuccessFactors Hire-to-Retire prompts before treating the skill as usable for project advisory work.

This forward test is a local reasoning validation only. No live SAP tenant, SAP for Me, SAP Cloud ALM tenant, SuccessFactors Provisioning, RBP export, payroll provider, PAC/SAT, legal/tax authority, security system, integration runtime, or production system was accessed.

## Scope

Forward tests used the smoke pack at `docs/validation/successfactors-hcm-smoke-prompts.md`.

Four isolated subagents ran the 12 smoke prompts in read-only mode:

| Batch | Prompts | Result |
| --- | --- | --- |
| 1 | Recruit-to-Hire Boundary; Employee Central Data Ownership; Time and Payroll Handoff | 2 pass, 1 warn |
| 2 | Benefits Payroll Integration; RBP Privacy Review; Learning Compliance | 2 pass, 1 warn |
| 3 | Performance-to-Compensation; Mexico Payroll Boundary; Offboarding and Access Closeout | 3 pass |
| 4 | Integration and API Readiness; Work Zone Employee Experience; End-to-End H2R Fit-to-Standard | 2 pass, 1 warn |

Overall result: 9 pass, 3 warn, 0 fail.

## Prompt Results

| # | Prompt | Outcome | Notes |
| ---: | --- | --- | --- |
| 1 | Recruit-to-Hire Boundary | Pass | Correctly mapped Recruiting, Onboarding, Employee Central, RBP, integration touchpoints, assumptions, risks, evidence, and Fit-to-Standard next actions. |
| 2 | Employee Central Data Ownership | Pass | Produced a useful ownership matrix for employee ID, person data, employment, job, position, manager, cost center, legal entity, pay components, and payroll attributes. |
| 3 | Time and Payroll Handoff | Warn | Correct advisory framing, but payroll, subscription/provisioning, statutory, and finance posting claims require live evidence before passing as validated coverage. |
| 4 | Benefits Payroll Integration | Pass | Covered Global Benefits, enrollment, confirmation statements, payroll modes, pay components, recurring deductions, provider boundary, and payroll owner validation. |
| 5 | RBP Privacy Review | Warn | Good RBP/privacy frame, but no proposed role matrix, permission export, target population definition, IAS/IPS design, or audit evidence was supplied. |
| 6 | Learning Compliance | Pass | Covered internal/external learners, IAS/IPS, curricula, libraries, content providers, completion reporting, permissions, and validation gaps. |
| 7 | Performance-to-Compensation | Pass | Covered EC prerequisites, goals/performance templates, route maps, rating scales, calibration, compensation eligibility, budgets, worksheets, statements, privacy, and owner decisions. |
| 8 | Mexico Payroll Boundary | Pass | Preserved CFDI nomina, XML/PDF, UUID, PAC/SAT, cancellation/reissue, legal entity, payroll calendar, time/benefits inputs, accounting posting, reconciliation, retention, and owner signoffs. |
| 9 | Offboarding and Access Closeout | Pass | Covered EC, Onboarding/Offboarding, IAM, Learning, Benefits, payroll, travel/expense, S/4HANA finance clearing, audit trail, and owner validation. |
| 10 | Integration and API Readiness | Pass | Produced a readiness checklist for OData V2, Integration Center, Integration Suite, BTP destinations, IAS/IPS, payroll replication, Cloud ALM, monitoring, and approval gates. |
| 11 | Work Zone Employee Experience | Warn | Correctly treated Work Zone as conditional scope, but entitlement, content package, BTP roles, enabled cards/templates, accessibility, and tenant readiness remain unproven. |
| 12 | End-to-End H2R Fit-to-Standard | Pass | Produced a useful workshop structure spanning SuccessFactors modules, S/4HANA finance handoff, IAM, Mexico payroll evidence, decision log, risks, owners, and outputs. |

## Observations

- The skill consistently preserved the source-guided versus tenant-validated distinction.
- The skill did not claim module activation, licensing, RBP, API behavior, payroll behavior, Work Zone entitlement, or production readiness without evidence.
- Mexico payroll prompts were handled with the required CFDI nomina, PAC/SAT, accounting, reconciliation, retention, and owner-signoff caveats.
- The skill routed H2R process thinking before module detail and produced useful owner/evidence/action structures.
- Warnings came from missing input evidence, not from a failure of the skill to guide the work.

## Residual Risks

| Risk | Impact | Next action |
| --- | --- | --- |
| No live tenant evidence | Cannot mark any module or process as activated or tenant-ready | Collect tenant screenshots/exports/logs per matrix row before project use |
| No RBP export or role matrix | RBP/privacy review remains advisory | Run an RBP evidence collection and SoD/privacy review with Security/IAM |
| Payroll and Mexico compliance unvalidated | No legal/fiscal/payroll conclusion can be made | Validate with Payroll, Tax/Legal, Finance/R2R, payroll provider/ECP evidence, and SAT/PAC artifacts |
| Work Zone entitlement/content not proven | Work Zone remains conditional scope | Confirm subscription, BTP trust/roles, content package, cards, quick actions, and accessibility |
| API/integration behavior not tested | Integration readiness remains design-level | Validate API users, destinations, Integration Center jobs, iFlows, monitoring, retries, and logs in non-production |

## Recommendation

Treat `sap-successfactors-hcm` as usable for source-guided advisory, Fit-to-Standard preparation, validation backlog creation, and H2R scope framing.

Do not treat it as proof of tenant activation, licensed scope, release applicability, payroll/legal compliance, RBP/privacy approval, integration execution, or production readiness. Project use should attach tenant and owner evidence to each relevant H2R matrix row before promoting coverage from source-guided to validated.
