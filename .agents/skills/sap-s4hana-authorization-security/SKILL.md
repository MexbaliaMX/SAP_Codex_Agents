---
name: sap-s4hana-authorization-security
description: "SAP S/4HANA Authorization and Access Security advisory skill for reviewing authorization concepts, PFCG roles, users, profiles, authorization objects, SAP Fiori business roles/catalogs/spaces/pages, OData exposure, CDS/DCL access control, SU53 or authorization trace evidence, access testing, role transport readiness, and SoD/control risks. Use when planning, diagnosing, reviewing, or documenting S/4HANA and Fiori access security from sanitized evidence, ADM940/ADM945-style training patterns, project role matrices, SAP Activate readiness work, or client authorization findings."
---

# SAP S/4HANA Authorization and Access Security

## Overview

Use this skill to turn SAP authorization evidence into advisory outputs for S/4HANA and SAP Fiori access security. Keep all recommendations evidence-bound, standard-first, and approval-gated for production-impacting changes.

Do not copy proprietary SAP training text into outputs or skill assets. Use ADM940/ADM945-style concepts as internal orientation only, then produce original checklists, matrices, questions, and recommendations.

## Operating Rules

- Separate confirmed facts, assumptions, evidence gaps, risks, recommendations, owners, and next actions.
- Treat SAP product behavior, app/catalog availability, licensing, roadmap, tenant configuration, and security posture as evidence-bound.
- Prefer read-only inspection, sanitized exports, screenshots, matrices, and workshop notes.
- Require explicit human approval before role changes, user changes, trust changes, transport moves, trace activation in shared systems, or production configuration.
- Do not request, print, store, or commit passwords, tokens, service keys, private keys, assertion tokens, or sensitive user data.
- Use SAP S/4HANA process language first: Record-to-Report, Procure-to-Pay, Lead-to-Cash, Order-to-Cash, Source-to-Pay, Plan-to-Produce, Design-to-Operate, and Hire-to-Retire.
- For Mexico scenarios, flag CFDI, complemento de pago, Carta Porte, tax evidence, approvals, auditability, and SoD review when the access touches fiscal or logistics controls.

## Evidence Intake

Ask for or inspect only sanitized evidence:

- Scope: system type, edition, release, process family, users/personas, target environment, and project phase.
- Role evidence: PFCG role list, role descriptions, org levels, authorization object summary, generated profile status, user assignment matrix.
- Fiori evidence: business role, business catalog, technical catalog if available, app ID/name, space/page assignment, target mapping, OData service, launchpad visibility proof.
- CDS/OData evidence: CDS view/entity, `@AccessControl.authorizationCheck`, DCL role, `pfcg_auth` mapping, service binding/exposure, row-level requirement.
- Test evidence: positive and negative user tests, SU53, sanitized authorization trace, failed app/OData call details, role comparison.
- Transport evidence: transport request, target system, role generation status, user assignment policy, retrofit/dependency notes.

For file-based reviews, use `.agents/templates/sap-authorization-evidence-intake.md` to request sanitized inputs. When CSV or Markdown matrices are available, run `scripts/validate_authorization_evidence.py` before drafting findings to catch missing owners, approval gates, evidence status, and required columns.

## Workflow

1. Classify the request as concept design, Fiori access review, CDS/DCL review, trace troubleshooting, readiness review, or SoD/control review.
2. Select related skills:
   - Use `sap-abap` for `AUTHORITY-CHECK`, ABAP authorization objects, RAP authorization, or backend logic.
   - Use `sap-abap-cds` for CDS access control, DCL, `pfcg_auth`, and OData exposure from CDS.
   - Use `sapui5` for SAPUI5 security, client-side authorization display logic, XSS, CSP, CSRF, and secure UI patterns.
   - Use `sap-btp-cloud-platform` and `sap-identity-security-advisor` for BTP role collections, trust, IAS/IPS, and platform identity mapping.
   - Use process skills for SoD and business-control context.
3. Build a traceability chain: process role -> business task -> Fiori app or transaction -> catalog/menu -> OData/CDS/backend object -> authorization object or DCL -> user test.
4. Identify least-privilege gaps, overbroad roles, missing display/change separation, cross-process conflicts, fallback SAP GUI exposure, and missing negative tests.
5. Produce advisory output using one of the local templates:
   - `.agents/templates/s4hana-authorization-readiness.md`
   - `.agents/templates/s4hana-fiori-access-matrix.md`
   - `.agents/templates/sap-access-trace-analysis.md`
   - `.agents/templates/sap-sod-control-matrix.md`
   - `.agents/templates/sap-authorization-evidence-intake.md`

## Review Lenses

### Authorization Concept

Check persona design, naming, composite/single role structure, org-level design, activity separation, emergency/support access, user lifecycle handoff, generated profile status, and role ownership.

### SAP Fiori Access

Check business role to catalog assignment, app visibility, space/page assignment, target mappings, OData service enablement, backend PFCG role alignment, launchpad restrictions, and SAP GUI fallback policy.

### CDS and OData Security

Check whether sensitive CDS views use `#CHECK` or `#MANDATORY`, whether DCL exists and maps to appropriate PFCG objects, whether access control is applied at consumption views, and whether service exposure has matching backend authorization.

### Trace Troubleshooting

Use SU53 or authorization trace evidence to identify missing objects/fields, but do not recommend blindly adding everything from a trace. Connect each proposed authorization to a business task, role owner, risk, and test case.

### SoD and Control Review

Check whether one role or user combines incompatible business tasks across process boundaries, such as vendor master maintenance plus payment release, purchase order creation plus goods receipt plus invoice release, or sales order changes plus billing/revenue actions. Treat SoD conclusions as control-review findings that require process owner, security owner, and internal-control validation.

## Output Shape

For client-facing work, use executive Spanish and keep sections distinct:

- Hechos confirmados
- Supuestos
- Evidencia recibida
- Brechas de validacion
- Riesgos
- Recomendaciones
- Proximas acciones

For technical work, include object-level detail, test cases, and exact evidence needed, but keep secrets and personal data out of the output.

## Do Not Do

- Do not assert a role, catalog, app, OData service, or authorization object exists in the client tenant without evidence.
- Do not treat SAP Fiori Apps Reference Library, training PDFs, or generic SAP examples as proof of client configuration.
- Do not approve SoD conflicts, emergency access, broad wildcard authorizations, or production transports.
- Do not automate live tenant access or role generation from this skill unless separate trusted tooling and explicit approval exist.

## Bundled Script

- `scripts/validate_authorization_evidence.py`: Validate CSV or Markdown evidence matrices with profiles `fiori-access`, `sod-control`, `authorization-readiness`, or `trace-analysis`. Use it on sanitized files only.
