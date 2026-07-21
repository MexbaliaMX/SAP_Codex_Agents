# Record-to-Report Content Integration Plan

Fecha de preparacion: 2026-07-19

## Proposito

Definir la siguiente ola controlada de integracion E2E para Record-to-Report, reutilizando el patron probado en Order-to-Cash y Source-to-Pay / Procure-to-Pay sin abrir ingesta masiva ni afirmar disponibilidad productiva.

Este plan no prueba vigencia SAP, tenant, licenciamiento, entitlement BTP, APIs, eventos, Signavio, DRC/eDocument, PAC/SAT, CFDI, complementos de pago, retenciones, impuestos, tipo de cambio, cierre contable ni cumplimiento fiscal Mexico.

## Base local disponible

| Base | Estado | Observacion |
| --- | --- | --- |
| FARL / Fiori local | Disponible | 36 filas en `sap-content-cross-source-traceability.csv` para Record-to-Report |
| Inventario Fiori FI/R2R | Disponible | `s4hana-fiori-fi-r2r-app-inventory.md` cubre setup financiero, journal entries, verification, close, bank/AP/AR/payment operations, reporting, controls and archiving gap |
| Business Accelerator Hub R2R | Disponible | SCI-017 creo inventario piloto Source-guided con 13 filas y validacion auth/licensing pendiente |
| Discovery Center / BTP R2R | Disponible | SCI-018 creo inventario piloto Source-guided con 11 servicios soporte y entitlement/region/licensing pendiente |
| Signavio R2R | Disponible | SCI-019 creo mapping piloto Source-guided con 8 filas para Record-to-Report / financial closing / journal entry / clearing / reporting / controls candidates |
| Cross-source R2R | Disponible | SCI-020 creo matriz piloto Derived con 8 filas por etapa conectando FARL, SCI-017, SCI-018 y SCI-019 |
| Mexico overlay R2R | Disponible | SCI-021 creo overlay piloto Derived con 8 filas ligadas a SCI-020 y validacion fiscal/tenant Mexico pendiente |
| Readiness R2R | Disponible | SCI-022 creo reporte ejecutivo consolidando SCI-017 a SCI-021 con readiness por fuente, etapa, riesgos, validaciones abiertas y siguientes acciones |

## Cobertura FARL local

| Agrupacion local | Filas FARL |
| --- | ---: |
| General Ledger Accounting and Financial Close | 15 |
| Finance analytics and compliance | 11 |
| Bank, AP/AR and payment operations | 10 |
| Total | 36 |

## Alcance piloto recomendado

Mantener el piloto en Record-to-Report core. No extender todavia a Treasury avanzado, Group Reporting, external tax engines, enterprise performance management, data lake, SAC planning, GRC, ILM/Data Retention tooling o cierre global complejo salvo que fuentes oficiales y owner review lo soporten.

| Etapa piloto | Incluye | Validaciones Mexico principales |
| --- | --- | --- |
| Financial master data foundation | G/L accounts, bank master, house banks, bank accounts, company-code relevant finance master data | Tax/accounting evidence ownership, bank-data controls, SoD |
| Journal entry capture and verification | Manual journals, uploads, verification workflow, teams/responsibilities | Approval evidence, accounting policy, SoD, audit trail |
| Period-end close and recurring activities | Recurring postings, GL jobs, foreign currency valuation, close task candidates | FX valuation, exchange rate evidence, close audit, sign-off |
| Clearing, bank and payment operations | G/L clearing, AP/AR jobs, automatic payments, payment media, bank statements | Payment evidence, bank trace, complementos de pago boundary, SoD |
| AP/AR line-item and subledger handoff | Supplier/customer line items, dunning/correspondence links, subledger-to-GL evidence | CFDI/complemento carry-forward, tax code, withholding/VAT, accounting reconciliation |
| Financial reporting and statements | Balance sheet/income statement, trial balance, multidimensional reporting | Statutory/audit reporting, evidence retention, legal entity validation |
| Controls, substitution/validation and audit evidence | Substitution/validation rules, logs, workflow controls, responsibility management | Change controls, rule ownership, audit logs, SoD |
| Archive, retention and governance | FI archiving/ILM/SARA gap, evidence repository, owner review, promotion criteria | Fiscal retention, XML/PDF/acuses retention, SAT evidence, legal hold |

## Nueva ola de backlog

| ID | Prioridad | Item tecnico | Entregable | Criterio de aceptacion |
| --- | --- | --- | --- | --- |
| SCI-016 | P1 | Crear plan de integracion R2R | `sap-r2r-content-integration-plan.md` | Completado 2026-07-19: plan define base local, cobertura FARL, alcance piloto y secuencia SCI-017 a SCI-022 |
| SCI-017 | P1 | Crear inventario Business Accelerator Hub para R2R core | `sap-business-accelerator-hub-r2r-pilot-inventory.csv` | Completado 2026-07-19: 13 filas Source-guided para master data, journal entry post/change/clearing/event, line-item/accounting trace, trial balance, bank/payment and controls, con auth/licensing pendiente |
| SCI-018 | P1 | Crear inventario Discovery Center para servicios soporte R2R | `sap-discovery-center-r2r-pilot-inventory.csv` | Completado 2026-07-19: 11 servicios soporte Source-guided para integracion, eventos, identidad, conectividad, workflow/process automation, compliance/document evidence and analytics candidates, con entitlement/region/licensing pendiente |
| SCI-019 | P1 | Crear mapping Signavio para R2R | `sap-signavio-r2r-pilot-process-mapping.csv` | Completado 2026-07-20: 8 filas Source-guided por etapa, conectadas a SCI-017 y SCI-018, con Record to Report Financial Closing accelerator como candidato y access/licensing/content pendiente |
| SCI-020 | P2 | Construir matriz cross-source R2R | `sap-r2r-cross-source-traceability-pilot.csv` | Completado 2026-07-20: 8 filas Derived por etapa conectando FARL, SCI-017, SCI-018 y SCI-019, con validacion tenant/licensing/entitlement/workspace/content pendiente |
| SCI-021 | P2 | Integrar overlay Mexico R2R | `sap-r2r-mexico-overlay-pilot.csv` | Completado 2026-07-20: 8 filas Derived ligadas a SCI-020 con CFDI/complemento carry-forward, retenciones/VAT, tipo de cambio, bancos, conciliacion contable, evidencia fiscal, archivo/retencion, auditoria y SoD como validaciones pendientes |
| SCI-022 | P2 | Generar readiness report R2R | `sap-r2r-content-readiness-report.md` | Completado 2026-07-20: reporte ejecutivo consolida SCI-017 a SCI-021 y separa hechos confirmados, supuestos, riesgos, validaciones abiertas, readiness por etapa y siguientes acciones |

## Reglas de control

- No abrir ingesta masiva de Business Accelerator Hub, Discovery Center o Signavio.
- No asumir Group Reporting, Treasury avanzado, SAP Analytics Cloud, GRC, external tax engine, ILM/Data Retention or payment factory sin evidencia fuente.
- Mantener cada fila como `Source-guided` o `Derived` hasta contar con evidencia tenant/licensing/entitlement/workspace/fiscal.
- Tratar Mexico como overlay de validacion, no como cumplimiento confirmado.
- Revisar owner boundaries entre Record-to-Report, Order-to-Cash, Source-to-Pay / Procure-to-Pay, Treasury and Tax antes de promover filas.

## Siguiente accion

Ejecutar owner review R2R: revisar `sap-r2r-content-readiness-report.md`, seleccionar filas que entran a Fit-to-Standard, convertir filas Mexico Critical en escenarios de prueba y definir evidencia minima para promover filas a `Tenant-validated`.
