# Plantilla de mapping SAP Signavio Process Explorer

Fecha de preparacion: 2026-07-19

## Proposito

Esta plantilla estandariza el mapping controlado entre procesos E2E locales y candidatos de SAP Signavio Process Explorer, SAP Signavio Process Intelligence y value accelerators relacionados.

La plantilla es una guia de gobierno. No prueba acceso al workspace, licencia, API disponible, value accelerator instalado, contenido vigente, variante exacta, metricas cargadas, datos extraidos, proceso aprobado por cliente ni fit-to-standard validado.

## Alcance recomendado por piloto

Cada piloto debe limitarse a un proceso E2E y a etapas de negocio concretas. Para SCI-006 el proceso piloto es Lead-to-Cash / Order-to-Cash.

## Campos

| Campo | Obligatorio | Definicion |
| --- | --- | --- |
| MappingId | Si | Identificador estable de mapping |
| ProcessFamily | Si | Proceso E2E local |
| LocalProcessStage | Si | Etapa O2C local |
| LocalScenario | Si | Escenario de negocio local |
| SignavioProcessCandidate | Si | Proceso Signavio candidato |
| SignavioSubprocessCandidate | Si | Subproceso, capability, variant o metric family candidato |
| SignavioContentType | Si | End-to-End Process, Process Variant, Value Accelerator, Metric, Dictionary Entry, Related Process |
| SignavioSourceUrl | Si | URL SAP Help / Signavio usada como referencia |
| ValueAcceleratorCandidate | No | Value accelerator candidato cuando aplique |
| MetricCandidate | No | Metrica o KPI candidato cuando aplique |
| RelatedFarlScopeCandidate | No | Scope/process grouping local relacionado |
| RelatedSci004Artifacts | No | APIs/eventos del piloto Business Accelerator Hub relacionados |
| RelatedSci005Services | No | Servicios soporte Discovery Center relacionados |
| MexicoComplianceCue | No | CFDI, complemento de pago, Carta Porte, DRC/eDocument, PAC/SAT, SoD, Audit o `Not flagged` |
| SourceRetrievedOn | Si | Fecha de consulta |
| EvidenceLevel | Si | `Source-guided` hasta validar acceso/licencia/workspace |
| ValidationStatus | Si | Estado de validacion |
| AccessLicensingContentStatus | Si | Estado de acceso, licencia, API, workspace y contenido |
| Owner | Si | Owner sugerido |
| OpenGaps | Si | Validaciones pendientes |
| NextAction | Si | Siguiente accion concreta |
| Notes | No | Notas controladas sin secretos ni datos de cliente |

## Reglas de uso

- No guardar workspace IDs, URLs privadas, exports de procesos de cliente, tokens, cookies ni datos de cliente.
- No afirmar que un value accelerator esta instalado o disponible en un workspace sin evidencia.
- No afirmar API publica o export automatizable de Process Explorer sin validacion tecnica y contractual.
- Mantener todas las filas iniciales como `Source-guided` y `Access/licensing/content validation pending`.
- Para Mexico, tratar CFDI, complemento de pago, Carta Porte, DRC/eDocument, PAC/SAT y auditoria como overlay local; no atribuirlos a Signavio salvo fuente explicita.

## Salida esperada

- CSV de mapping por proceso.
- Markdown resumen con fuentes, conteos, validaciones abiertas y siguientes acciones.
- Registro actualizado en `docs/validation/s4hana-fiori-artifact-status-register.md`.
