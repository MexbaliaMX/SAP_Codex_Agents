---
name: sap-extensions-calculator
description: Estimate and review SAP S/4HANA extension effort using a Clean Core Tier 1, Tier 2, and Tier 3 calculator. Use when sizing, explaining, red-teaming, tuning rates, exporting, or validating SAP extension backlogs involving Key User extensibility, RAP/ABAP Cloud, CAP, BTP, SAP Build, Integration Suite, SAC, Datasphere, Event Mesh, connectivity, monitoring, or extension governance.
---

# SAP Extensions Calculator

Use this skill for advisory sizing of SAP extension backlogs. Always separate the numeric estimate from advisory warnings and validation gaps.

## Workflow

1. Classify backlog items by extension type and complexity.
2. Use `scripts/run_extensions_estimate.js` for deterministic calculations when counts are available.
3. Present results as `estimate` plus `advisoryWarnings`.
4. Mark SAP product, API, tenant behavior, licensing, edition availability, and roadmap claims as validation items unless the user provides environment evidence.
5. Keep production architecture, security, integration, and configuration decisions human-in-the-loop.

## Inputs

Use this JSON shape for the script:

```json
{
  "counts": {
    "t1-custom-fields": { "baja": 1 },
    "t2-rap-managed-bo": { "media": 1 },
    "t3-connectivity": { "alta": 1 }
  },
  "rates": {},
  "params": {
    "hoursPerDay": 8,
    "govEnabled": true,
    "govValue": 15,
    "testEnabled": true,
    "testValue": 35,
    "docEnabled": true,
    "docValue": 12,
    "intEnabled": true,
    "intValue": 15
  }
}
```

Complexities are `muy-alta`, `alta`, `media`, and `baja`.

## Run The Calculator

From this skill folder:

```powershell
node .\scripts\run_extensions_estimate.js input.json
```

Or pipe JSON through stdin:

```powershell
Get-Content .\input.json | node .\scripts\run_extensions_estimate.js -
```

The script prints:

```json
{
  "estimate": {},
  "advisoryWarnings": []
}
```

## Output Guidance

For working notes, include:

- estimate summary: total hours, total days, base hours, overhead hours, tier totals.
- advisory warnings: code, severity, message, and impacted tier/type where present.
- assumptions: rates, overhead percentages, hours per day, and scope classification.
- validation items: SAP tenant, edition, licensing, released APIs, security, monitoring, integration ownership.
- next actions: rate calibration, architecture review, SAP evidence lookup, or backlog refinement.

For client-facing output, use executive Spanish and separate confirmed facts, assumptions, validation gaps, risks, and next actions.

## References

- Read `references/calculation-model.md` when explaining or modifying the math.
- Read `references/advisory-warning-policy.md` when tuning warning logic or writing client-facing caveats.
- Read `references/related-skill-routing.md` when advisory warnings or next actions should hand off to another SAP skill.

## Related Skills

- Use `sap-btp-cloud-platform` for BTP account, entitlement, runtime, identity, and deployment questions.
- Use `sap-btp-connectivity` for destinations, Cloud Connector, and hybrid connectivity.
- Use `sap-btp-integration-suite` for Integration Suite, iFlows, API Management, Event Mesh, and monitoring.
- Use `sap-abap-cds` for CDS, analytical models, RAP data modeling, and ABAP Cloud persistence questions.
- Use `sapui5` for SAPUI5, Fiori Elements, and custom UI implementation questions.

## Caveats

This calculator is an estimating aid, not live-system proof. Do not infer SAP availability, licensing, tenant readiness, or architectural approval from a numeric result. For Mexico-specific scenarios, consider CFDI, complementos de pago, Carta Porte, PAC/SAT connectivity, tax evidence, approval controls, and auditability when relevant.
