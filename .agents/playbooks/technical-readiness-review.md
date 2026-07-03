# Technical Readiness Review Playbook

Use this playbook when the user needs a cross-technical readiness assessment across platform, integration, connectivity, identity, data, operations, development, transports, and support.

## Routing

1. Start with the SAP Activate phase skill for the delivery moment, usually `sap-activate-realize`, `sap-activate-deploy`, or `sap-activate-run`.
2. Add `sap-btp-cloud-platform` for platform, account, entitlement, role, and operations readiness.
3. Add `sap-btp-connectivity` for destinations, Cloud Connector, principal propagation, and hybrid connectivity.
4. Add `sap-btp-integration-suite` for interfaces, APIs, events, B2B/EDI, transport, monitoring, and error handling.
5. Add development skills when code or deployable artifacts are in scope: `sap-cap-capire`, `sap-fiori-tools`, `sapui5`, `sap-abap`, `sap-abap-cds`, `sap-sqlscript`, or `sap-hana-cli`.
6. Use `.agents/templates/technical-readiness-review.md` for the output.

## Required Inputs

- Target landscape, environments, tenants, subaccounts, and deployment path.
- Workload inventory and owners.
- Integration inventory and monitoring plan.
- Identity, roles, authorization, and audit requirements.
- Data migration or data readiness status.
- Test evidence, defects, transport status, rollback plan, and support model.
- Known SAP product, licensing, API, or tenant assumptions to validate.

## Review Flow

1. Confirm scope, delivery phase, and evidence sources.
2. Assess platform, identity, connectivity, integration, data, development, testing, deployment, monitoring, and support readiness.
3. Mark each item green, amber, red, or pending evidence.
4. Separate blockers from accepted residual risks.
5. Identify owner, due date, validation evidence, and decision forum for each open item.
6. Escalate fiscal, legal, security, or production-impacting gaps to the right approval forum.

## Approval Gates

- Tenant configuration changes.
- Role, trust, or security changes.
- Production deployment or transport approval.
- Interface activation or external API exposure.
- Licensing, SLA, availability, or tenant behavior claims.

## Output Shape

- Confirmed facts.
- Readiness summary by workstream.
- Blockers and conditional go items.
- Risks and mitigations.
- Evidence gaps.
- Owners and next actions.
- Recommendation: ready, conditionally ready, or not ready.
