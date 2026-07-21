# SAP Cross-Source Traceability Template

Fecha de preparacion: 2026-07-19

## Proposito

Esta plantilla define una matriz controlada para conectar artefactos de SAP Fiori Apps Reference Library, SAP Business Accelerator Hub / api.sap.com, SAP Discovery Center y SAP Signavio Process Explorer por proceso E2E.

La matriz es una herramienta de gobierno y workshop. No prueba activacion tenant, alcance oficial de scope item, licenciamiento, entitlement BTP, region, autorizaciones, payload tecnico, disponibilidad de APIs, workspace Signavio, contenido instalado ni aprobacion productiva.

## Grano recomendado

Una fila representa una relacion candidata entre una etapa de negocio y artefactos de referencia ya inventariados. Para pilotos iniciales, usar filas agregadas por etapa de proceso; no crear joins artificiales uno-a-uno si la evidencia fuente no lo soporta.

## Campos CSV

| Campo | Obligatorio | Definicion |
| --- | --- | --- |
| TraceabilityId | Si | Identificador estable de la fila cross-source |
| ProcessFamily | Si | Proceso E2E local |
| O2CStage | Si | Etapa de negocio dentro del piloto O2C |
| LocalScenario | Si | Escenario de negocio cubierto por la fila |
| FarlTraceabilityRefs | Si | IDs FARL derivados desde `sap-content-cross-source-traceability.csv` |
| FioriAppCandidates | Si | Apps Fiori o transacciones candidatas |
| ScopeItemCandidates | Si | Agrupaciones o scope item candidates locales |
| BusinessCatalogCandidates | No | Business catalogs FARL candidatos |
| Sci004Refs | Si | IDs de inventario Business Accelerator Hub relacionados |
| ApiEventCandidates | Si | APIs, SOAP services o events candidatos |
| Sci005Refs | Si | IDs de inventario Discovery Center relacionados |
| BtpServiceCandidates | Si | Servicios BTP soporte candidatos |
| Sci006Refs | Si | IDs de mapping Signavio relacionados |
| SignavioProcessCandidate | Si | Proceso, variante o accelerator candidato |
| SignavioMetricCandidate | No | Metrica o indicador candidato |
| RelationshipType | Si | Tipo de relacion: Candidate, Support dependency, Workshop validation required, Mexico overlay candidate |
| CountryOverlay | Si | Pais o region aplicable |
| MexicoComplianceCue | No | Senales CFDI, complemento de pago, Carta Porte, DRC/eDocument, SoD o auditoria |
| SourceBasis | Si | Artefactos fuente usados para derivar la fila |
| SourceRetrievedOn | Si | Fecha de preparacion o consulta de fuente |
| EvidenceLevel | Si | `Derived` o `Source-guided`; no usar `Tenant-validated` sin evidencia tenant |
| ValidationStatus | Si | Estado de validacion pendiente |
| RefreshRequiredBeforeUse | Si | Regla de refresh previo a uso formal |
| Owner | Si | Owner sugerido |
| OpenGaps | Si | Gaps de validacion abiertos |
| NextAction | Si | Siguiente accion concreta |
| Notes | No | Notas controladas sin secretos ni datos cliente |

## Reglas

- Usar solo artefactos ya inventariados o fuentes explicitamente aprobadas para el sprint.
- Mantener los enlaces como candidatos hasta validar tenant, licencias, edition, scope item, region, entitlement y workspace.
- Separar FARL sourced, Source-guided y Derived.
- Para Mexico, marcar cues fiscales y de auditoria sin afirmar cumplimiento legal ni configuracion productiva.
- Actualizar el registro de estado y backlog cada vez que se publique una matriz piloto.
