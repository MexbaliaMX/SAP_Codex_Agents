# Related Skill Routing

Use this reference after running the calculator when the result creates implementation, validation, or architecture follow-up work. Routing is advisory only; do not make production configuration, security, integration, or architecture decisions without user approval and environment evidence.

## Warning Code Routing

| Warning code | Related skill | Follow-up |
| --- | --- | --- |
| `tier1_escalation_candidate` | `sap-abap-cds` | Review whether high-effort Tier 1 Custom Logic, Custom CDS, or UI adaptation should move to released RAP, ABAP Cloud, CDS, or another clean-core extensibility pattern. |
| `requires_sap_availability_validation` | `sap-btp-cloud-platform` | Validate BTP account model, subaccount, entitlement, subscription, runtime, identity, quota, and tenant readiness. |
| `requires_integration_review` | `sap-btp-integration-suite` | Review iFlows, API Management, Event Mesh, monitoring, retries, error handling, contract testing, auditability, and operational ownership. |
| `requires_integration_review` | `sap-btp-connectivity` | Validate destinations, Cloud Connector, hybrid routing, certificates, trust, and network reachability. |
| `large_scope_linear_model` | SAP Activate or process skill by context | Refine backlog slicing, dependencies, test strategy, release governance, cutover risk, and process ownership. |
| `missing_custom_rate` | none | Ask for calibrated local rates or keep defaults as explicit assumptions. |
| `hours_per_day_defaulted` | none | Confirm the estimating calendar with the delivery lead. |
| `no_overhead_applied` | none | Confirm whether governance, testing, documentation, and integration overhead should be disabled. |

## Extension Category Routing

| Extension category | Related skill |
| --- | --- |
| RAP Managed BO, RAP Unmanaged Wrapper, Custom CDS, analytical CDS model | `sap-abap-cds` |
| CAP Service/API, CAP App, SAP Build, BTP runtime, entitlement, identity | `sap-btp-cloud-platform` |
| Connectivity, destinations, Cloud Connector, hybrid routing, certificates | `sap-btp-connectivity` |
| Integration Suite iFlow A2A/B2B, API Management, Event Mesh, integration testing, runbooks | `sap-btp-integration-suite` |
| UI Adaptation, Fiori Elements, SAPUI5 custom UI, UI testing | `sapui5` |

## Output Pattern

When routing is relevant, add a concise next-action line:

```text
Next skill to use: sap-btp-integration-suite for iFlow/API/Event Mesh review; sap-btp-connectivity for destination and Cloud Connector validation.
```

Keep SAP product, API, licensing, roadmap, and tenant behavior evidence-bound. If the user has not supplied live environment evidence, route the item as an open validation action.