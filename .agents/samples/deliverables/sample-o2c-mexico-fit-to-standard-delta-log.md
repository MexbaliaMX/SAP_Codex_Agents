# Sample O2C Mexico Fit-to-Standard Delta Log

Fictional sample for template demonstration only. No live SAP tenant, fiscal, legal, or tax validation was performed.

## Workshop Context

| Field | Value |
|---|---|
| Process | Order-to-Cash |
| Workshop | Mexico billing and logistics fit-to-standard / 2026-07-02 |
| Legal entity / country | Demo Manufacturing MX, Mexico |
| System landscape | S/4HANA Cloud public edition sandbox, no PRD access |
| Facilitator | Mexbalia solution advisor |
| Business owner | O2C process owner |

## Delta Register

| ID | Process step | Standard behavior shown | Business need / delta | Category | Disposition | Owner | Evidence required | Decision date | Status |
|---|---|---|---|---|---|---|---|---|---|
| D-001 | Billing document creation | Standard billing output uses configured eDocument/CFDI process | Confirm CFDI 4.0 fields and payment method rules for current invoice scenarios | Localization | Validate | Tax owner | Sample invoice, SAT rule matrix, tenant configuration screenshot | 2026-07-09 | Open |
| D-002 | Customer payment clearing | Standard incoming payment clearing can support complementos de pago process with correct references | Payment complement timing and ownership unclear between AR and tax team | Process / Localization | Configure | AR lead | Payment sample, clearing variant, fiscal-owner signoff | 2026-07-10 | Open |
| D-003 | Delivery with transport documentation | Standard outbound delivery supports logistics handoff but Carta Porte requirements need country-specific confirmation | Need evidence for Carta Porte trigger, data source, and exception handling | Integration / Localization | Validate | Logistics lead | Shipping scenario list, carrier data, compliance review | 2026-07-12 | Open |

## Validation Actions

| Action | Delta ID | Evidence needed | Owner | Due date | Result / decision |
|---|---|---|---|---|---|
| Run sample invoice through sandbox fiscal output path | D-001 | CFDI XML, app screenshot, tax-owner review | Tax owner | 2026-07-09 | Pending |
| Map payment complement ownership and cutoff timing | D-002 | RACI, AR/tax policy, sample clearing | AR lead | 2026-07-10 | Pending |
| Confirm Carta Porte applicability by shipment type | D-003 | Scenario matrix and legal/tax confirmation | Logistics lead | 2026-07-12 | Pending |

## Summary

| Metric | Count |
|---|---:|
| Fit to standard | 0 |
| Configuration | 1 |
| Extension | 0 |
| Integration | 1 |
| Data | 0 |
| Reporting / analytics | 0 |
| Security / controls | 0 |
| Localization / compliance | 3 |