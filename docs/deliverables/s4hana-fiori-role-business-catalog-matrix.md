# Matriz de Roles y Business Catalogs SAP Fiori

Fecha de preparacion: 2026-07-13

## Proposito

Esta matriz convierte el indice maestro y la matriz Fit-to-Standard en un artefacto de diseno de accesos. Sirve para preparar workshops de seguridad, roles, business catalogs, launchpad spaces/pages, SoD, aprobacion de fallbacks SAP GUI y revision fiscal Mexico.

## Fuentes

- Indice maestro: `docs/deliverables/s4hana-fiori-e2e-master-app-index.csv`
- Fit-to-Standard: `docs/deliverables/s4hana-fiori-fit-to-standard-workshop-matrix.csv`
- Matriz generada: `docs/deliverables/s4hana-fiori-role-business-catalog-matrix.csv`

La matriz es una guia de diseno y validacion. No prueba que los roles existan en tenant, que los catalogs esten asignados, que la app este visible en launchpad, ni que el acceso este aprobado para produccion.

## Resumen ejecutivo

| Metrica | Valor |
| --- | --- |
| Filas de acceso | 293 |
| Business catalogs unicos observados | 128 |
| Lead-to-Cash / Order-to-Cash | 111 |
| Plan-to-Produce | 89 |
| Record-to-Report | 36 |
| Source-to-Pay / Procure-to-Pay | 57 |
| Criticidad High | 194 |
| Criticidad Medium | 99 |
| SoD review requerido | 194 |
| Fallback approval requerido | 41 |
| Mexico audit review requerido | 92 |
| Catalog gaps / validacion especial | 11 |

## Columnas clave

| Columna | Uso |
| --- | --- |
| SecurityWorkshop | Agrupacion sugerida para workshop de seguridad y accesos |
| FitToStandardWorkshop | Workshop funcional origen para trazar decisiones |
| BusinessOwner | Owner sugerido para aprobar necesidad de acceso |
| FARLRole | Rol observado en SAP Fiori Apps Reference Library |
| BusinessCatalog | Business catalog observado o gap de validacion |
| AccessCriticality | Criticidad inicial para priorizar revisiones |
| SoDReviewRequired | Bandera inicial de segregacion de funciones |
| SoDScenario | Escenario SoD a discutir con seguridad y proceso |
| TenantRoleValidation | Evidencia requerida de rol/catalog en tenant |
| LaunchpadSpacePageValidation | Evidencia requerida de visibilidad en launchpad |
| FallbackApprovalRequired | Aprobacion requerida para SAP GUI o fallback |
| MexicoAuditReviewRequired | Revision fiscal/auditoria Mexico requerida |

## Agenda sugerida de seguridad

| Security workshop | Filas |
| --- | --- |
| Sales, logistics and receivables role design | 93 |
| Manufacturing, quality and costing role design | 78 |
| Procurement role and catalog design | 48 |
| Fallback SAP GUI and privileged access review | 37 |
| Finance role and catalog design | 29 |
| Mexico fiscal access and audit roles | 6 |
| Catalog gap and role remediation | 2 |

## Reglas de uso

- Validar cada business catalog contra el tenant objetivo antes de usarlo para roles productivos.
- Tratar `Without Catalog Assignment`, `Validar por localizacion` y SAP GUI como puntos de diseno, no como autorizaciones listas.
- Revisar SoD con el owner funcional y seguridad, especialmente aprobaciones, pagos, clearing, billing, master data, journal entries, credito, production execution, quality, costing, inventory y configuracion de reglas.
- Para Mexico, validar acceso a DRC/eDocument/CFDI con Tax, Finance, Seguridad y auditoria.
- Documentar launchpad space/page, role collection/business role, catalog, restricciones organizacionales y evidencia de prueba.

## Siguientes acciones

1. Revisar filas High con Security Lead y owners por proceso.
2. Separar role design por workstream: Finance, Procurement, Sales/Billing, Logistics, Manufacturing, Quality, Tax y Master Data.
3. Confirmar catalogs y apps en tenant sandbox; adjuntar evidencia en la matriz.
4. Crear backlog de remediacion para gaps de catalogo, fallbacks SAP GUI y SoD conflicts.
5. Usar esta matriz como base para role build, UAT access y cutover readiness.
