# SAP S/4HANA Fiori Access Matrix

Use to trace Fiori access from business process role to launchpad content, OData/CDS/backend authorization, and test evidence.

## Scope

| Field | Value |
|---|---|
| Process family | [Record-to-Report / Procure-to-Pay / etc.] |
| Environment | [DEV / QA / PRD / Unknown] |
| User population | [Personas/groups] |
| Main decision | [Access design / issue diagnosis / go-live readiness] |

## Access Traceability

| Process role | Business task | Business role | Business catalog | Space/Page | App ID | App name | OData/service | CDS/DCL | Backend role/object | Test evidence | Risk |
|---|---|---|---|---|---|---|---|---|---|---|---|
| [Role] | [Task] | [Role] | [Catalog] | [Space/Page] | [App ID] | [App] | [Service] | [CDS/DCL] | [PFCG/object] | [Evidence] | Low / Medium / High |

## Visibility And Authorization Checks

| Check | Expected evidence | Status | Gap | Owner |
|---|---|---|---|---|
| Business catalog assigned | Role/catalog export or screenshot | Pending / Confirmed | [Gap] | [Owner] |
| Space/page assigned | Launchpad content evidence | Pending / Confirmed | [Gap] | [Owner] |
| Target mapping available | Target mapping evidence | Pending / Confirmed | [Gap] | [Owner] |
| OData/service reachable | Network/service test | Pending / Confirmed | [Gap] | [Owner] |
| Backend authorization valid | SU53/trace/positive test | Pending / Confirmed | [Gap] | [Owner] |
| Negative test performed | Denied-user evidence | Pending / Confirmed | [Gap] | [Owner] |

## Open Risks

| Risk | Impact | Recommendation | Approval gate |
|---|---|---|---|
| [Risk] | [Impact] | [Action] | [Security owner / process owner / transport owner] |
