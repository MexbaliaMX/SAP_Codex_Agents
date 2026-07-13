# Mexico Compliance Tracker SAP S/4HANA Fiori

Fecha de preparacion: 2026-07-13

## Proposito

Este tracker separa los escenarios Mexico-relevantes de los inventarios SAP Fiori para gestionar CFDI, complementos de pago, Carta Porte, DRC/eDocument, evidencia fiscal, trazabilidad contable, SoD y auditoria. Es una herramienta de validacion para Tax, Finance, Logistics, Manufacturing, Quality, Security y process owners.

## Fuentes

- Indice maestro: `docs/deliverables/s4hana-fiori-e2e-master-app-index.csv`
- Fit-to-Standard: `docs/deliverables/s4hana-fiori-fit-to-standard-workshop-matrix.csv`
- Roles y catalogs: `docs/deliverables/s4hana-fiori-role-business-catalog-matrix.csv`
- Tracker generado: `docs/deliverables/s4hana-mexico-compliance-tracker.csv`

Este tracker no es asesoria fiscal ni prueba de cumplimiento. Debe validarse con los owners fiscales, legales y de auditoria del cliente, el tenant objetivo, la localizacion Mexico, DRC/eDocument, PAC/SAT y evidencia de prueba.

## Resumen ejecutivo

| Metrica | Valor |
| --- | --- |
| Filas Mexico-relevantes | 92 |
| Lead-to-Cash / Order-to-Cash | 42 |
| Plan-to-Produce | 27 |
| Record-to-Report | 9 |
| Source-to-Pay / Procure-to-Pay | 14 |
| Riesgo High | 91 |
| Riesgo Medium | 1 |
| CFDI / e-invoicing | 23 |
| Complemento de pago / payment evidence | 18 |
| Carta Porte / logistics evidence | 18 |
| DRC/eDocument and tax reporting | 6 |
| Accounting audit trail | 27 |
| SoD / restricted access | 77 |

## Owners sugeridos

| Owner | Filas |
| --- | --- |
| Tax / Localization Lead | 24 |
| Logistics + Tax Owner | 18 |
| Manufacturing + Costing Owner | 18 |
| Finance AR/AP + Treasury Owner | 18 |
| Security Lead + Process Owner | 8 |
| Finance R2R Owner | 3 |
| Billing / AR Owner | 3 |

## Columnas clave

| Columna | Uso |
| --- | --- |
| ComplianceTopic | Clasificacion de validacion: CFDI, complemento de pago, Carta Porte, DRC/eDocument, audit trail o SoD |
| FiscalEvidenceRequired | Evidencia minima esperada para cerrar el escenario |
| Owner | Owner sugerido para coordinar validacion |
| TenantValidation | Evidencia requerida en tenant |
| PACSATValidation | Validacion con PAC/SAT cuando aplica |
| DRCeDocumentValidation | Validacion de DRC/eDocument, monitoreo y re-proceso |
| AccountingReconciliation | Puente de evidencia con asiento, line item, material document, clearing o reporte |
| SoDReview | Revision de acceso y segregacion de funciones |
| DecisionStatus | Estado de cierre del escenario |

## Reglas de uso

- No cerrar una fila de CFDI sin XML/PDF, UUID, estatus SAT/PAC, documento origen y documento contable relacionado.
- No cerrar complemento de pago sin relacion contra pago, clearing, banco/payment advice y evidencia fiscal.
- No cerrar Carta Porte sin validar si el traslado aplica, datos logisticos, transporte, XML/PDF y trazabilidad con entrega o movimiento de mercancia.
- No cerrar DRC/eDocument sin monitoreo, log, error handling, re-proceso y retencion de evidencia.
- No aprobar acceso a apps fiscales o fallbacks sin SoD review, owner y evidencia de launchpad/role/catalog en tenant.

## Siguientes acciones

1. Revisar las filas High con Tax, Finance, Logistics, Manufacturing, Quality y Security.
2. Completar `TenantValidation`, `PACSATValidation`, `TestScenario` y evidencia por entidad legal.
3. Separar pruebas por ciclo: O2C CFDI ingreso, pagos/complemento, P2P CFDI proveedor, Plan-to-Produce goods movement/costing, Carta Porte, R2R evidencia contable.
4. Conectar cada fila con scripts Cloud ALM/UAT, defectos, decisiones fit-gap y control de auditoria.
5. Actualizar `DecisionStatus` solo con evidencia revisada por owner.
