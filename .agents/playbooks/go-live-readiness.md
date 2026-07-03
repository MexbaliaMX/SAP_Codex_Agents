# Go-Live Readiness Playbook

Use this playbook when the user needs a go/no-go view, cutover readiness assessment, executive readiness summary, or launch risk decision.

## Routing

1. Start with `sap-activate-deploy`.
2. Add relevant process skills for each in-scope business flow.
3. Add `sap-btp-cloud-platform`, `sap-btp-connectivity`, and `sap-btp-integration-suite` when platform or integration readiness affects launch.
4. Add development skills when unresolved code, UI, data model, HANA, or SQLScript defects affect readiness.
5. Use `.agents/templates/go-live-readiness-checklist.md` for the output.

## Required Inputs

- Go-live date, scope, legal entities, geography, and business processes.
- Cutover plan, migration status, reconciliation status, and fallback plan.
- Training completion and business readiness evidence.
- Integration, jobs, monitoring, and support readiness.
- Security/access status and role assignment evidence.
- Open defects, accepted risks, and approval forum.
- Mexico fiscal readiness when relevant: CFDI, complementos de pago, Carta Porte, tax evidence, e-document monitoring, cancellation/reissue procedures.

## Review Flow

1. Confirm scope and evidence available.
2. Assess business readiness, process readiness, data readiness, technical readiness, security readiness, integration readiness, cutover readiness, training, support, and compliance-sensitive items.
3. Distinguish mandatory blockers from conditional go items and accepted residual risks.
4. Assign every blocker and conditional item to an owner, due date, evidence requirement, and approval forum.
5. Produce a recommendation that is evidence-bound and does not imply legal, tax, security, or production approval unless supplied.

## Approval Gates

- Go-live approval.
- Residual risk acceptance.
- Fiscal/legal readiness acceptance.
- Security and access signoff.
- Production transport and cutover execution.
- Fallback and hypercare model approval.

## Output Shape

- Confirmed facts.
- Assumptions.
- Readiness by workstream.
- Blockers.
- Conditional go items.
- Accepted residual risks.
- Go/no-go recommendation.
- Owners and next actions.
