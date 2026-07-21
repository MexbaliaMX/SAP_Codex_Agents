# SAP R2R Mexico Overlay Pilot

Fecha de preparacion: 2026-07-20

## Proposito

Este overlay Mexico marca cues fiscales, contables, bancarios, de auditoria y SoD sobre la matriz cross-source Record-to-Report de SCI-020.

El piloto completa SCI-021 sin afirmar cumplimiento legal, configuracion tenant, activacion de DRC/eDocument, integracion PAC/SAT, vigencia fiscal aplicable a una entidad legal especifica, workspace Signavio, evidencia de cierre ni aprobacion productiva.

## Archivo CSV

- `docs/deliverables/sap-r2r-mexico-overlay-pilot.csv`

## Fuente de trazabilidad

- `docs/deliverables/sap-r2r-cross-source-traceability-pilot.csv`

## Fuentes externas de referencia

Estas fuentes se usaron solo para orientar los cues. No sustituyen validacion fiscal, legal, tenant o contractual.

| Fuente | Uso en el overlay |
| --- | --- |
| [SAT - Complemento Recepcion de Pagos](https://www.sat.gob.mx/portal/public/tramites/complemento-recepcion-de-pagos) | Referencia para marcar complemento de pago como cue de pago/cobranza y evidencia de recepcion de pagos |
| [SAT - Expedicion de CFDI por pagos realizados](https://wwwmat.sat.gob.mx/articulo/22029/regla-2.7.1.35) | Referencia para marcar la emision del CFDI con complemento de recepcion de pagos como validacion abierta |
| [SAT - Cancelacion de facturas](https://www.sat.gob.mx/minisitio/Factura/cancela_procesocancelacion.htm) | Referencia para marcar cancelacion, sustitucion, aceptacion/rechazo y evidencia de estatus como validaciones abiertas |
| [SAT - Regla Carta Porte transporte dedicado](https://wwwmat.sat.gob.mx/articulo/16853/regla-2.7.7.1.3) | Referencia para mantener Carta Porte como cue condicional cuando R2R hereda evidencia de transporte de procesos logisticos |
| [SAP Help - What Is SAP Document and Reporting Compliance?](https://help.sap.com/docs/SAP_S4HANA_CLOUD/71af4585db6d4904b1724730f3776c9b/a90aea8760a64e419446e453c6d64027.html) | Referencia general para eDocuments, statutory reports and compliance monitoring |
| [SAP Help - Checking Requirements for DRC Features](https://help.sap.com/docs/SAP_S4HANA_CLOUD/1d9e8bfcd5ee447d91c62819e2d2ac60/2f0748f4a7054247a6b67382416ce782.html) | Referencia para marcar scope items/country activation/cloud edition integration as validation pending |
| [SAP Help - End-to-End Processing with SAP DRC](https://help.sap.com/docs/SAP_S4HANA_CLOUD/71af4585db6d4904b1724730f3776c9b/55a418a0093b4ae6a68b4c492b472bde.html) | Referencia para marcar submission/communication with external systems as validation pending |

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 8 |
| Proceso E2E | Record-to-Report |
| Fuente base | SCI-020 cross-source traceability |
| Nivel de evidencia | Derived |
| Estado de validacion | Mexico fiscal/tenant validation pending |

## Cobertura piloto

| Etapa R2R | Cues Mexico |
| --- | --- |
| Financial master data foundation | Chart of accounts, bank-data controls, tax/accounting master data, evidence ownership and SoD |
| Journal entry capture and verification | Journal approval evidence, tax code, withholding/VAT carry-forward, exchange rate, audit trail and SoD |
| Period-end close and recurring activities | Close sign-off, FX valuation, exchange-rate evidence, recurring postings, fiscal exceptions and close audit |
| Clearing, bank and payment operations | Payment evidence, complemento de pago boundary, bank statement trace, open-item clearing, PAC/SAT and SoD |
| AP/AR line-item and subledger handoff | CFDI/complemento carry-forward, withholding/VAT, GR/IR or billing links, accounting reconciliation and reversal sequence |
| Financial reporting and statements | Statutory reporting, DRC/eDocument, trial balance, financial statements, tax account reconciliation and evidence retention |
| Controls, substitution/validation and audit evidence | Posting validation, substitution rules, workflow approvals, logs, sensitive access and SoD |
| Workshop governance and Mexico evidence control | Scenario scoping, evidence repository, RACI, DRC/PAC/SAT validation method, retention and readiness inputs |

## Validaciones abiertas

- Confirmar Mexico legal entity, country version, tax procedure, chart of accounts, company-code scope, fiscal calendar and exchange-rate source.
- Confirmar DRC/eDocument scope, statutory reporting tasks, cloud edition integration, monitoring, onboarding and evidence retention.
- Confirmar PAC/SAT flow, UUID/status/acuse evidence, XML/PDF repository, cancellation/substitution and payment complement responsibilities.
- Confirmar complemento de pago relevance for AR/payment scenarios and carry-forward into R2R clearing/reporting evidence.
- Confirmar withholding/VAT, tax code, account assignment, AP/AR line-item and tax account reconciliation requirements with Tax/Localization.
- Confirmar bank statement, payment media, payment advice, clearing reset, reversal and reconciliation controls.
- Confirmar Carta Porte only as inherited/conditional evidence from logistics or goods-movement disputes, not as standard R2R scope.
- Confirmar role/catalog access, communication users, BTP services, DRC/eDocument access, SAC/Datasphere access, Signavio workspace access and SoD risks.

## Siguientes acciones

1. Revisar este overlay con Tax/Localization, General Ledger, Financial Close, AP/AR, Treasury Operations, Finance Controls, Reporting/Analytics, Integration, BTP Platform, Identity/Security, Signavio workspace and PMO owners.
2. Seleccionar escenarios Mexico para evidencia minima: G/L and bank master governance, journal entry correction, FX valuation, payment/clearing with complemento boundary, AP/AR line-item carry-forward, statutory reporting and controls.
3. Documentar out-of-scope decisions for Treasury avanzado, Group Reporting, GRC, external tax engine, payment factory, ILM/Data Retention tooling, SAC planning and data lake unless project evidence brings them into scope.
4. Usar este overlay como input principal para SCI-022 readiness report.
