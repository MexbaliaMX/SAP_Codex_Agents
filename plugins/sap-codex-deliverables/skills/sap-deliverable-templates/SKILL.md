---
name: sap-deliverable-templates
description: SAP consulting and technical-readiness deliverable templates with fictional filled examples. Use when drafting, structuring, reviewing, or adapting SAP Activate outputs, process diagnostics, RAID logs, go-live readiness checklists, hypercare triage tables, BTP readiness reviews, Integration Suite transport readiness, UI5 quality reviews, or identity security readiness deliverables.
---

# SAP Deliverable Templates

## Overview

Use this skill to produce evidence-bound SAP client deliverables from reusable Markdown templates. The bundled assets include blank templates and fictional filled samples for common consulting, SAP Activate, and technical readiness artifacts.

## Workflow

1. Select the closest template from `assets/templates`.
2. If output shape is unclear, inspect the matching fictional example in `assets/samples`.
3. Fill only facts the user supplied or that can be safely inferred from provided artifacts.
4. Mark missing tenant checks, fiscal/legal validation, credential checks, MCP execution, hook execution, and production-readiness claims as pending.
5. Preserve separate sections for confirmed facts, assumptions, evidence gaps, risks, owners, and next actions.

## Template Selection

| User need | Start with |
|---|---|
| Fit-to-standard workshop deltas | `assets/templates/fit-to-standard-delta-log.md` |
| Process pain-point diagnosis | `assets/templates/process-diagnostic-summary.md` |
| Delivery governance | `assets/templates/raid-log.md` |
| Go/no-go readiness | `assets/templates/go-live-readiness-checklist.md` |
| Post-go-live stabilization | `assets/templates/hypercare-triage-table.md` |
| Cross-technical readiness | `assets/templates/technical-readiness-review.md` |
| Integration Suite transport approval | `assets/templates/integration-transport-readiness.md` |
| BTP subaccount/workload readiness | `assets/templates/btp-platform-readiness.md` |
| SAPUI5/OpenUI5 quality review | `assets/templates/ui5-quality-review.md` |
| IAS/IPS/BTP trust and role mapping | `assets/templates/identity-security-readiness.md` |

## Samples

Use `assets/samples` only as style and structure examples. The samples are fictional and must not be treated as client evidence, SAP product verification, legal/tax advice, security approval, or production readiness.

## Safety Rules

- Do not claim live SAP tenant behavior unless the user provides current tenant evidence.
- Do not advance upstream verification dates or imply fiscal/legal validation.
- Keep Mexico fiscal items such as CFDI, complementos de pago, and Carta Porte as validation topics unless the user provides authoritative evidence.
- Do not include secrets, tenant URLs, private user identifiers, certificate material, or credential aliases in public examples.
- For production-impacting recommendations, include owner, evidence, approval forum, and rollback or mitigation expectations.

## References

- Read `references/template-library.md` for the template catalog.
- Read `references/sample-deliverables.md` when choosing a fictional example.
- Read `references/template-forward-test-report.md` when changing or validating the template set.
