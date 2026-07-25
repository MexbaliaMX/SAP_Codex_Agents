# SAP SoD Control Matrix

Use for SAP S/4HANA segregation of duties, sensitive access, compensating controls, emergency access, and audit-evidence reviews.

## Scope

| Field | Value |
|---|---|
| Process family | [Record-to-Report / Procure-to-Pay / Order-to-Cash / etc.] |
| Environment | [DEV / QA / PRD / Unknown] |
| User population | [Personas/groups/aliases] |
| Review type | [Design review / UAT issue / Go-live readiness / Remediation] |
| Recommendation | Green / Amber / Red |

## SoD Findings

| Process | Role/persona | User alias | Sensitive task | Conflicting task | Evidence | Risk | Control status | Owner | Approval gate |
|---|---|---|---|---|---|---|---|---|---|
| [Process] | [Role/persona] | [Alias] | [Task] | [Task] | [Evidence] | Low / Medium / High | Missing / Proposed / Operating / Accepted exception | [Owner] | [Gate] |

## Compensating Controls

| Conflict | Control | Evidence required | Monitoring frequency | Exception expiry | Owner | Status |
|---|---|---|---|---|---|---|
| [Conflict] | [Control] | [Evidence] | [Frequency] | [Date] | [Owner] | Pending / Active / Expired |

## Mexico Fiscal And Audit Cues

| Cue | Applies | Evidence needed | Owner | Status |
|---|---|---|---|---|
| CFDI / complemento de pago | Yes / No / Unknown | [Evidence] | [Owner] | Pending |
| Carta Porte | Yes / No / Unknown | [Evidence] | [Owner] | Pending |
| Payment approval evidence | Yes / No / Unknown | [Evidence] | [Owner] | Pending |
| Audit trail and retention | Yes / No / Unknown | [Evidence] | [Owner] | Pending |

## Next Actions

| Priority | Action | Owner | Due date | Validation |
|---|---|---|---|---|
| High / Medium / Low | [Action] | [Owner] | [Date] | [Retest/evidence] |
