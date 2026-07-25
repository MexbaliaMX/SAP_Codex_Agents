# SAP Authorization Evidence Intake

Use to request sanitized evidence before S/4HANA authorization, Fiori access, CDS/DCL, trace, SoD, or transport readiness reviews.

## Scope

| Field | Value |
|---|---|
| Review type | Authorization readiness / Fiori access / CDS-DCL / Trace analysis / SoD control |
| Process family | Record-to-Report / Procure-to-Pay / Order-to-Cash / etc. |
| Environment | Sandbox / DEV / QA / PRD / Unknown |
| Release / edition | [Confirmed release or Unknown] |
| Decision needed | [Design / Issue diagnosis / Go-live gate / Remediation] |

## Required Sanitization

| Item | Requirement |
|---|---|
| Users | Use aliases only; no names, email addresses, personnel numbers, or production IDs |
| Screenshots | Mask hostnames, client data, business partner data, amounts, tax IDs, and personal data |
| Logs/traces | Remove tokens, session IDs, passwords, private keys, endpoints, and sensitive document numbers |
| Exports | Include only columns needed for role, catalog, object, evidence, owner, and approval review |

## Evidence Checklist

| Evidence area | Requested artifact | Required fields | Owner | Status |
|---|---|---|---|---|
| Role/user assignment | Sanitized role-user matrix | Role, persona, user alias, assignment source, environment | Security SAP | Pending |
| Authorization objects | Role authorization summary | Object, field, value, activity, org level, generated profile status | Security SAP | Pending |
| Fiori access | App/catalog/space matrix | Business role, catalog, space/page, app ID, OData/service, target mapping | Fiori/security lead | Pending |
| CDS/DCL | CDS and DCL evidence | CDS entity, AccessControl annotation, DCL role, pfcg_auth mapping, service binding | ABAP/CDS lead | Pending |
| Trace/SU53 | Sanitized trace package | User alias, object/service, field, value, result, timestamp, business task | Security SAP | Pending |
| SoD/control | Sensitive access matrix | Sensitive task, conflicting task, risk, control, owner, approval gate | Control owner | Pending |
| Transport | Transport readiness evidence | TR, object list, dependency, retest plan, approver | Release lead | Pending |

## Decision Gates

| Gate | Evidence required | Approver | Status |
|---|---|---|---|
| Process owner decision | Business task and role scope confirmed | Process owner | Pending |
| Security approval | Least-privilege scope and negative tests confirmed | Security owner | Pending |
| Control approval | SoD exception or compensating control accepted | Control owner | Pending |
| Transport approval | TR content, dependencies, rollback, and retest plan confirmed | Transport owner | Pending |
