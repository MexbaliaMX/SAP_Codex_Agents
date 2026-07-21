# SAP Mexico Overlay Template

Fecha de preparacion: 2026-07-19

## Proposito

Esta plantilla define un overlay Mexico para matrices SAP cross-source. Su objetivo es marcar cues fiscales, logisticos, contables, de auditoria y SoD que deben validarse antes de usar una matriz en discovery formal, Fit-to-Standard, diseno tecnico o decision de alcance.

Este overlay no es asesoria legal o fiscal. No prueba CFDI, complemento de pago, Carta Porte, PAC/SAT, DRC/eDocument, configuracion tenant, retencion de evidencia, autorizaciones, integracion productiva ni cumplimiento ante autoridad.

## Grano recomendado

Una fila representa el overlay Mexico para una fila de trazabilidad cross-source existente. El enlace principal debe ser `CrossSourceTraceabilityId`.

## Campos CSV

| Campo | Obligatorio | Definicion |
| --- | --- | --- |
| OverlayId | Si | Identificador estable de la fila Mexico |
| CrossSourceTraceabilityId | Si | ID de la fila cross-source relacionada |
| ProcessFamily | Si | Proceso E2E local |
| O2CStage | Si | Etapa O2C relacionada |
| MexicoApplicability | Si | Direct, Indirect, Conditional, Governance |
| FiscalTopics | Si | CFDI, complemento de pago, Carta Porte, DRC/eDocument, PAC/SAT, tax master data, audit, SoD |
| EvidenceChain | Si | Cadena de evidencia requerida desde transaccion origen hasta contabilizacion, XML/PDF/acuses o reporte |
| RequiredEvidence | Si | Evidencia minima esperada para validacion |
| DRCeDocumentValidation | Si | Validacion pendiente o no aplicable para DRC/eDocument |
| PACSATValidation | Si | Validacion pendiente o no aplicable para PAC/SAT |
| AccountingReconciliation | Si | Validacion contable o de clearing requerida |
| TransportValidation | Si | Validacion Carta Porte/logistica requerida o no aplicable |
| CancellationReissueValidation | Si | Validacion de cancelacion, correccion o reemision |
| SoDReview | Si | Revision SoD y aprobaciones |
| AccessValidation | Si | Revision de roles, catalogs, spaces/pages o autorizaciones |
| RiskLevel | Si | Critical, High, Medium, Low |
| Owner | Si | Owner sugerido |
| FitGapDecision | Si | Decision Fit-to-Standard pendiente |
| ValidationStatus | Si | Estado de validacion |
| EvidenceLevel | Si | `Derived` hasta contar con evidencia tenant/fiscal |
| SourceBasis | Si | Fuentes locales usadas para derivar el overlay |
| OpenQuestions | Si | Preguntas abiertas de validacion |
| NextAction | Si | Siguiente accion concreta |
| Notes | No | Notas controladas sin secretos ni datos cliente |

## Reglas

- Marcar `Direct` solo si la etapa crea, cambia, cancela, reemite, timbra, complementa o reconcilia evidencia fiscal.
- Marcar `Conditional` cuando Carta Porte, PAC/SAT, DRC/eDocument o complemento de pago dependen de escenario, legal entity, transporte, tipo de documento o configuracion.
- No afirmar cumplimiento Mexico sin evidencia de legal entity, configuracion, integracion, XML/PDF/acuses, accounting trace y aprobacion fiscal.
- Mantener owners de Tax/Localization, Finance, Logistics, Sales/Billing, Integration, Security y BTP cuando apliquen.
