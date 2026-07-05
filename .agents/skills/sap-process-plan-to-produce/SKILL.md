---
name: sap-process-plan-to-produce
description: "Plan-to-Produce process diagnostics and SAP S/4HANA advisory. Use for demand planning, MRP, production planning, manufacturing execution, quality, inventory, costing, and shop-floor integration questions."
---

# SAP Plan-to-Produce Process Advisory

## Verification Caveat

This is a local advisory overlay. Review `references/verification.md` for source caveats, validation limits, and release treatment. Do not treat this skill as live tenant, legal, fiscal, licensing, security, or production-readiness proof.

## Operating Posture

Use this skill to reason from an end-to-end SAP business process view before jumping to module, configuration, integration, or extension answers. Keep confirmed facts, assumptions, risks, validation gaps, and next actions separate.

Use SAP S/4HANA process language first. Use legacy module names only when the client, configuration object, or source system requires them.

## Core Workflow

1. Confirm the business outcome, legal entity, country, system landscape, and implementation phase.
2. Map the current and target process from trigger to close, including handoffs, documents, approvals, master data, integration points, and controls.
3. Identify pain points as process, data, integration, control, adoption, reporting, or governance issues.
4. Connect recommendations to SAP standard capability first, then evaluate configuration, extensibility, integration, analytics, or custom build.
5. For Mexico scenarios, check whether CFDI, complementos de pago, Carta Porte, tax evidence, audit trail, or approval controls matter.
6. Produce client-safe outputs: process map, fit/gap summary, key decisions, open questions, risks, owners, and validation steps.

## Process Focus

- Trigger: demand plan, sales order, forecast, replenishment signal, production order, process order, or make-to-stock/make-to-order requirement.
- Core flow: demand, supply planning, MRP, capacity check, procurement or staging, production execution, confirmation, quality, goods receipt, costing, variance, and reporting.
- Watch points: BOM, routing, recipe, work center, production version, lot sizing, MRP type, capacity, batch, serial, quality inspection, and inventory valuation.
- Integration touchpoints: O2C demand, P2P materials, EWM, PP/DS, MES, quality, maintenance, costing, and analytics.
- Outputs: planning pain-point map, master data readiness, manufacturing integration list, controls, and phased improvement backlog.

## Expected Outputs

- Executive summary in business language.
- Scope boundary and assumptions.
- End-to-end process steps and handoffs.
- Master data, transaction, integration, reporting, and control impacts.
- SAP standard capability candidates and related technical skills.
- Fit-to-standard deltas, decisions needed, and validation plan.

## Related Skills

Use technical skills only after the process framing is clear:

- `$sap-btp-integration-suite` for integration flow, API, event, and B2B design.
- `$sap-btp-connectivity` for destinations, Cloud Connector, principal propagation, and hybrid connectivity.
- `$sap-btp-cloud-platform` for BTP account, entitlement, role, and landscape setup.
- `$sap-abap`, `$sap-abap-cds`, `$sap-cap-capire`, `$sap-fiori-tools`, `$sapui5`, `$sap-sqlscript`, and `$sap-hana-cli` for implementation details.

## Shared References

Read these only when needed:

- `.agents/references/mexbalia-consulting-guardrails.md` for evidence, client-facing language, and decision hygiene.
- `.agents/references/sap-process-language.md` for process taxonomy and handoff patterns.
- `.agents/references/mexico-compliance-cues.md` for Mexico-specific fiscal and audit prompts.
- `.agents/references/sap-activate-governance.md` for phase gates and SAP Activate alignment.
