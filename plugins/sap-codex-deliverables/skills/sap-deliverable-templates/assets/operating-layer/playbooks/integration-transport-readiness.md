# Integration Transport Readiness Playbook

Use this playbook when the user needs to assess Integration Suite, API, event, B2B/EDI, or related transport readiness before moving artifacts across environments or into production.

## Routing

1. Start with `sap-btp-integration-suite`.
2. Add `workspace role playbook: sap-integration-flow-advisor.md` for advisory review shape.
3. Add `sap-btp-connectivity` for destinations, Cloud Connector, principal propagation, certificates, or network path.
4. Add `sap-btp-cloud-platform` for subaccounts, entitlements, roles, transport landscape, and operations.
5. Add process skill for the affected business flow.
6. Use `assets/templates/integration-transport-readiness.md` for the output.

## Required Inputs

- Interface name, business process, source, target, protocol, adapter, payload, and owner.
- Environment path, package/artifact version, transport mechanism, and deployment window.
- Destination, credential, certificate, role, and connectivity evidence.
- Mapping, error handling, retry, idempotency, monitoring, alerting, and support model.
- Test evidence, negative tests, reconciliation approach, rollback plan, and cutover dependency.
- Mexico fiscal evidence chain when the interface creates, validates, stores, or reconciles CFDI, complementos de pago, Carta Porte, or tax evidence.

## Review Flow

1. Confirm business process impact and artifact scope.
2. Verify source-target contract, security model, connectivity, monitoring, retry/error handling, and support ownership.
3. Review test evidence, data reconciliation, transport path, rollback/fallback, and operations handoff.
4. Classify readiness as ready, conditionally ready, or not ready.
5. Assign each blocker or conditional item to owner, due date, validation evidence, and approval forum.

## Approval Gates

- Production interface activation.
- API exposure or policy changes.
- Credential, certificate, destination, Cloud Connector, or role changes.
- Transport approval.
- Fiscal/legal compliance claim for e-document or tax evidence flows.

## Output Shape

- Confirmed facts.
- Integration readiness summary.
- Mandatory acceptance checklist.
- Blockers and conditional items.
- Test, monitoring, and rollback evidence.
- Risks and controls.
- Recommendation and next actions.
