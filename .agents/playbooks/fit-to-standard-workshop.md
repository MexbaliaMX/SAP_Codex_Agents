# Fit-to-Standard Workshop Playbook

Use this playbook when the user needs to prepare, run, summarize, or govern an SAP Activate Explore / Fit-to-Standard workshop.

## Routing

1. Start with `sap-activate-explore-fit-to-standard`.
2. Add the relevant process skill:
   - `sap-process-record-to-report`
   - `sap-process-lead-to-cash`
   - `sap-process-order-to-cash`
   - `sap-process-source-to-pay`
   - `sap-process-procure-to-pay`
   - `sap-process-plan-to-produce`
   - `sap-process-design-to-operate`
   - `sap-process-hire-to-retire`
3. Add technical skills only for confirmed integration, extension, data, security, analytics, or development impacts.
4. Use `.agents/templates/fit-to-standard-delta-log.md` for the output.

## Required Inputs

- Workshop process scope and SAP Activate phase.
- Legal entity, country, plant/company code/sales channel when relevant.
- Target system landscape and source evidence.
- SAP standard demo or process walkthrough scope.
- Participants, decision forum, and system of record.
- Known integrations, master data objects, reports, forms, controls, and compliance topics.

## Workshop Flow

1. Confirm business outcome, scope boundary, and evidence available.
2. Walk through SAP standard process first.
3. Capture each observation as fit, gap, configuration, extension, integration, data, reporting, security, control, change, or training impact.
4. For Mexico scenarios, check CFDI, complementos de pago, Carta Porte, tax evidence, cancellation/reissue, SAT identifiers, audit trail, and approval controls.
5. Convert unresolved items into validation actions rather than invented answers.
6. Assign owner, due date, decision forum, and evidence needed.

## Approval Gates

- Custom extension or integration approval.
- Standard process deviation approval.
- Production configuration or transport action.
- Fiscal/legal compliance claim.
- Tenant behavior, licensing, API, or edition availability claim.

## Output Shape

- Confirmed facts.
- Assumptions.
- Fit/gap and delta log.
- Decision log entries.
- Validation action queue.
- Risks and controls.
- Owners and next actions.
