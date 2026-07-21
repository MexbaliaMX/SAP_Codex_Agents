# Esquema comun de contenido SAP

Fecha de preparacion: 2026-07-19

## Proposito

Este esquema define los campos canonicos para conectar contenido de SAP Fiori Apps Reference Library, SAP Business Accelerator Hub / api.sap.com, SAP Discovery Center y SAP Signavio Process Explorer con la base local SAP E2E.

El esquema es una estructura de gobierno. No prueba vigencia SAP, activacion en tenant, licenciamiento, disponibilidad por edition, API publica, entitlement BTP, autorizacion Signavio ni aprobacion productiva.

## Grano recomendado

Una fila representa una relacion candidata entre un proceso E2E y uno o mas artefactos SAP de referencia.

Cuando una fuente no tenga dato aplicable, usar `TBD` o `Not applicable`; no inferir contenido. Cuando el dato requiera validacion externa, usar `Validation pending`.

## Campos canonicos

| Campo | Obligatorio | Definicion | Valores guia |
| --- | --- | --- | --- |
| TraceabilityId | Si | Identificador estable de la fila | `SCI-TRACE-0001` |
| ProcessFamily | Si | Proceso E2E local | Record-to-Report, Source-to-Pay, Procure-to-Pay, Lead-to-Cash, Order-to-Cash, Plan-to-Produce, Design-to-Operate, Hire-to-Retire |
| ProcessStage | Si | Etapa o subproceso de negocio | Billing, payment, goods receipt, financial close, maintenance planning |
| ScopeItemCandidate | Si | Agrupacion candidata local o scope item candidato | Texto local hasta validar SAP Process Navigator / Best Practices |
| ScopeItemId | Si | ID oficial de scope item cuando este confirmado | `TBD` hasta validacion oficial |
| FioriAppId | Si | App ID FARL cuando aplique | `Fiori App ID`, `Not applicable`, `TBD` |
| FioriAppName | Si | Nombre oficial observado de app Fiori | FARL sourced cuando aplique |
| BusinessRole | No | Rol de negocio observado | FARL role, tenant role o `TBD` |
| BusinessCatalog | No | Business catalog observado | FARL catalog, tenant catalog o `TBD` |
| TechnicalCatalog | No | Technical catalog observado | FARL technical catalog o `TBD` |
| ApplicationComponent | No | Componente SAP observado | FARL component o fuente oficial |
| ApiOrArtifactId | Si | API, event, integration package, CDS view, Build content u otro artefacto | Business Accelerator Hub / api.sap.com reference |
| ApiOrArtifactType | Si | Tipo de artefacto tecnico | API, Event, Integration Package, CDS View, Build Content, Documentation, Not applicable |
| ApiOrArtifactName | No | Nombre del artefacto tecnico | Nombre oficial o `TBD` |
| BtpService | Si | Servicio BTP relacionado | Discovery Center service, `Not applicable`, `TBD` |
| BtpServicePlan | No | Service plan cuando aplique | `TBD` hasta validacion |
| BtpMission | No | Mision Discovery Center relacionada | Nombre o `TBD` |
| SignavioProcess | Si | Proceso o capability Signavio candidato | Nombre oficial o `TBD` |
| SignavioVariant | No | Variante, industria o capability relacionada | `TBD` si no esta confirmada |
| DeploymentModel | Si | Modelo objetivo | Public Cloud, Private Cloud Edition, On-Premise, Hybrid, Not applicable |
| ReleaseAnchor | Si | Release o version usada como referencia | FARL release, API version, content version, `TBD` |
| CountryOverlay | Si | Pais o region que requiere overlay | Mexico, Global, Multiple, Not applicable |
| MexicoComplianceCue | No | Senal fiscal/auditoria Mexico | CFDI, complemento de pago, Carta Porte, DRC/eDocument, PAC/SAT, SoD, Audit, Not flagged |
| SourceSystem | Si | Fuente primaria de la fila | FARL, Business Accelerator Hub, Discovery Center, Signavio Process Explorer, Tenant, Derived |
| SourceUrl | Si | URL publica o referencia local | URL, ruta local o `TBD` |
| SourceQuery | No | Query, filtro o criterio usado | App ID, keyword, process name, package name |
| SourceRetrievedOn | Si | Fecha de consulta | YYYY-MM-DD |
| EvidenceLevel | Si | Nivel de evidencia | FARL sourced, Source-guided, Derived, Template, Tenant-validated, Planned |
| ValidationStatus | Si | Estado de validacion | Validated, Validation pending, Tenant validation pending, Auth/licensing validation pending, Rejected, Superseded |
| RefreshRequiredBeforeUse | Si | Regla de refresh antes de uso formal | Yes, No, Conditional |
| OpenGaps | Si | Gaps pendientes | Texto breve |
| Owner | Si | Owner sugerido | Knowledge Base Owner, Solution Architecture Lead, Security Lead, Process Owner, Tax / Localization Lead |
| NextAction | Si | Siguiente accion concreta | Texto breve |
| Notes | No | Notas controladas | No incluir secretos ni datos de cliente |

## Campos minimos para CSV

El CSV base debe incluir los campos en este orden:

```text
TraceabilityId,ProcessFamily,ProcessStage,ScopeItemCandidate,ScopeItemId,FioriAppId,FioriAppName,BusinessRole,BusinessCatalog,TechnicalCatalog,ApplicationComponent,ApiOrArtifactId,ApiOrArtifactType,ApiOrArtifactName,BtpService,BtpServicePlan,BtpMission,SignavioProcess,SignavioVariant,DeploymentModel,ReleaseAnchor,CountryOverlay,MexicoComplianceCue,SourceSystem,SourceUrl,SourceQuery,SourceRetrievedOn,EvidenceLevel,ValidationStatus,RefreshRequiredBeforeUse,OpenGaps,Owner,NextAction,Notes
```

## Reglas de uso

- Mantener una fila como candidata hasta que tenga evidencia oficial o tenant.
- No completar `ScopeItemId` sin SAP Process Navigator, SAP Best Practices o evidencia tenant.
- No completar disponibilidad productiva por inferencia desde FARL, Business Accelerator Hub, Discovery Center o Signavio.
- No guardar credenciales, tokens, cookies, tenant URLs privados ni datos de cliente.
- Separar contenido `Source-guided` de contenido `Tenant-validated`.
- Marcar Mexico solo cuando el proceso, entidad legal, documento o flujo tenga impacto fiscal, logistico, contable, aprobatorio, SoD o auditoria.

## Estado de uso

Este esquema completa SCI-001. SCI-003 usa el esquema para poblar trazabilidad FARL-only; Business Accelerator Hub, Discovery Center y Signavio permanecen pendientes para SCI-004 a SCI-006.
