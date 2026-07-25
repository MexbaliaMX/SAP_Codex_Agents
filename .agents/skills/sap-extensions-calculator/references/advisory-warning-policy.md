# Advisory Warning Policy

Warnings are review prompts. They do not approve or reject architecture.

## Warning Types

- `missing_custom_rate`: A provided custom rate matrix omitted an active counted type/complexity entry; the default rate was used.
- `tier1_escalation_candidate`: Tier 1 effort for one type exceeds 20 hours; review whether a released Tier 2/RAP or other extensibility option is more appropriate.
- `requires_sap_availability_validation`: Tier 3 scope exists; validate tenant availability, licensing, released APIs, security, and roadmap before committing scope.
- `requires_integration_review`: Integration-heavy scope exists; review authentication, monitoring, retries, error handling, contract testing, auditability, and operational ownership.
- `hours_per_day_defaulted`: Invalid or missing hours per day was replaced with the default.
- `no_overhead_applied`: Base effort exists but governance, testing, documentation, and integration overhead are all disabled.
- `large_scope_linear_model`: Large object counts can make a linear model overconfident; review shared setup, reuse, dependency chains, regression testing, release governance, and cutover constraints.

## SAP Evidence Caveat

Treat SAP product, API, licensing, tenant behavior, edition availability, and roadmap statements as evidence-bound. If the user has not provided current tenant or SAP documentation evidence, mark the point as an open validation item.

## Mexico Overlay

When relevant, add advisory items for:

- CFDI and complementos de pago evidence.
- Carta Porte logistics requirements.
- PAC/SAT connectivity, acknowledgments, retries, and monitoring.
- Tax auditability and approval controls.
- Data retention and operational ownership for integration failures.
