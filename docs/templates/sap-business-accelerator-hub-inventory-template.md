# Plantilla de inventario SAP Business Accelerator Hub

Fecha de preparacion: 2026-07-19

## Proposito

Esta plantilla estandariza el inventario controlado de APIs, eventos, integration packages, CDS views y otros artefactos publicados o referenciados por SAP Business Accelerator Hub / api.sap.com.

La plantilla es una guia de trabajo. No prueba vigencia SAP, disponibilidad productiva, licenciamiento, entitlement, comunicacion configurada, autorizaciones, edition, scope item, localizacion ni activacion tenant.

## Alcance recomendado por piloto

Cada piloto debe limitarse a un proceso E2E y a 10-20 artefactos candidatos maximo. Para SCI-004 el proceso piloto es Lead-to-Cash / Order-to-Cash.

## Campos

| Campo | Obligatorio | Definicion |
| --- | --- | --- |
| InventoryId | Si | Identificador estable de inventario |
| ProcessFamily | Si | Proceso E2E local |
| ProcessStage | Si | Etapa O2C/L2C a la que aporta el artefacto |
| O2CScenario | Si | Escenario de negocio candidato |
| ArtifactId | Si | Technical name, event object, package ID o identificador publicado |
| ArtifactName | Si | Nombre funcional del artefacto |
| ArtifactType | Si | API, Event, Integration Package, CDS View, SOAP Service, Documentation |
| ProtocolOrCategory | Si | OData V2, OData V4, SOAP, Business Event, Integration Content, CDS |
| Product | Si | Producto SAP asociado |
| PackageOrDomain | Si | Package, domain o area funcional |
| BusinessAcceleratorHubUrl | Si | URL del artefacto o busqueda en api.sap.com |
| OfficialHelpUrl | Si | URL SAP Help usada como evidencia complementaria |
| SourceRetrievedOn | Si | Fecha de consulta |
| EvidenceLevel | Si | `Source-guided` hasta validar tenant/licencia |
| ValidationStatus | Si | Estado de validacion |
| AuthLicensingStatus | Si | Estado de login, licencia, entitlement o acceso requerido |
| CommunicationScenario | No | SAP_COM_* cuando este confirmado |
| ApplicationComponent | No | Componente SAP cuando este confirmado |
| ScopeItemCandidate | Si | Scope item o agrupacion candidata |
| MexicoComplianceCue | No | CFDI, complemento de pago, Carta Porte, DRC/eDocument, PAC/SAT, SoD, auditoria o `Not flagged` |
| Owner | Si | Owner sugerido |
| OpenGaps | Si | Validaciones pendientes |
| NextAction | Si | Siguiente accion concreta |
| Notes | No | Notas controladas sin secretos ni datos de cliente |

## Reglas de uso

- No guardar API keys, tokens, cookies, tenants privados, payloads de cliente ni credenciales.
- No copiar specs completas ni documentacion extensa; registrar enlaces y resumen operativo.
- Marcar todas las filas iniciales como `Source-guided` y `Auth/licensing validation pending`.
- Validar cada artefacto contra Business Accelerator Hub, SAP Help, communication scenario, tenant, roles y contrato/licencia antes de diseno productivo.
- Para Mexico, marcar CFDI, complemento de pago, Carta Porte, DRC/eDocument, PAC/SAT, SoD o auditoria cuando el artefacto toque facturacion, pago, entrega, transporte, accounting o evidencia fiscal.

## Salida esperada

- CSV de inventario por proceso.
- Markdown resumen con fuentes, conteos, validaciones abiertas y siguientes acciones.
- Registro actualizado en `docs/validation/s4hana-fiori-artifact-status-register.md`.
