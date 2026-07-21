# Plantilla de inventario SAP Discovery Center

Fecha de preparacion: 2026-07-19

## Proposito

Esta plantilla estandariza el inventario controlado de servicios SAP BTP, misiones, service plans, regiones y dependencias de adopcion observadas o referenciadas desde SAP Discovery Center y documentacion SAP Help.

La plantilla es una guia de gobierno. No prueba entitlement, region, servicio contratado, consumo, pricing, cuota, licencia, tenant, suscripcion, plan productivo, SLA, disponibilidad por hyperscaler ni aprobacion de arquitectura.

## Alcance recomendado por piloto

Cada piloto debe limitarse a un proceso E2E y a servicios soporte concretos. Para SCI-005 el proceso piloto es Lead-to-Cash / Order-to-Cash y solo cubre servicios de soporte para integracion, eventos, identidad, conectividad, aprobaciones y cumplimiento/eDocument.

## Campos

| Campo | Obligatorio | Definicion |
| --- | --- | --- |
| InventoryId | Si | Identificador estable de inventario |
| ProcessFamily | Si | Proceso E2E local |
| O2CSupportScenario | Si | Escenario O2C que el servicio podria soportar |
| ServiceName | Si | Nombre comercial del servicio o capability |
| ServiceTechnicalName | No | Nombre tecnico cuando este confirmado |
| ServiceCategory | Si | Integration, Events, Identity, Connectivity, Process Automation, Compliance |
| DiscoveryCenterUrl | Si | URL de SAP Discovery Center o `TBD - validate in Discovery Center` |
| OfficialHelpUrl | Si | URL SAP Help usada como evidencia complementaria |
| CandidatePlans | Si | Planes candidatos o `TBD - Discovery Center validation pending` |
| CandidateRegions | Si | Regiones candidatas o `TBD - Discovery Center validation pending` |
| MissionCandidate | No | Mision Discovery Center candidata cuando este confirmada |
| O2CDependency | Si | Dependencia funcional dentro de O2C |
| RelatedSci004Artifacts | No | APIs/eventos SCI-004 relacionados |
| MexicoComplianceCue | No | CFDI, complemento de pago, Carta Porte, DRC/eDocument, PAC/SAT, SoD, Audit o `Not flagged` |
| SourceRetrievedOn | Si | Fecha de consulta |
| EvidenceLevel | Si | `Source-guided` hasta validar tenant/licencia/region |
| ValidationStatus | Si | Estado de validacion |
| EntitlementRegionLicensingStatus | Si | Estado de entitlement, region, licencia, plan y contrato |
| Owner | Si | Owner sugerido |
| OpenGaps | Si | Validaciones pendientes |
| NextAction | Si | Siguiente accion concreta |
| Notes | No | Notas controladas sin secretos ni datos de cliente |

## Reglas de uso

- No guardar tenant IDs, URLs privadas, service keys, credentials, tokens, cookies, payloads de cliente ni datos contractuales.
- No tratar Discovery Center como aprobacion de entitlement o pricing final; validar contra BTP cockpit, contrato, SAP for Me y owner.
- Mantener todas las filas iniciales como `Source-guided` y `Entitlement/region/licensing validation pending`.
- Cuando un servicio tenga cambios de portfolio, deprecation, packaging o service-plan, marcarlo como validacion abierta.
- Para Mexico, marcar DRC/eDocument, CFDI, complemento de pago, Carta Porte, PAC/SAT, accounting trace y audit evidence cuando el servicio soporte facturacion, pago, entrega o cumplimiento.

## Salida esperada

- CSV de inventario por proceso.
- Markdown resumen con fuentes, conteos, validaciones abiertas y siguientes acciones.
- Registro actualizado en `docs/validation/s4hana-fiori-artifact-status-register.md`.
