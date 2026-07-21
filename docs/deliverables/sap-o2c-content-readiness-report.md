# SAP O2C Content Readiness Report

Fecha de preparacion: 2026-07-19

## Resumen ejecutivo

El piloto de integracion de contenido SAP para Lead-to-Cash / Order-to-Cash esta listo para revision interna con owners de proceso, integracion, plataforma, seguridad, Signavio y Mexico. No esta listo para compromiso cliente, diseno tecnico productivo, confirmacion de alcance, licenciamiento, entitlement BTP, workspace Signavio ni cumplimiento fiscal Mexico.

La base actual permite navegar de forma controlada desde etapas O2C hacia apps Fiori, APIs/eventos candidatos, servicios BTP soporte, procesos/metricas Signavio y cues Mexico. Todas las relaciones siguen siendo `Source-guided`, `FARL sourced` o `Derived`; ninguna fila es `Tenant-validated`.

## Decision de readiness

| Dimension | Estado | Lectura ejecutiva |
| --- | --- | --- |
| Gobierno de fuentes | Ready for owner review | SCI-001 y SCI-002 establecen esquema comun y registro de estado |
| FARL local | Ready for controlled use | SCI-003 refresco 456 filas FARL; 105 son O2C; requiere validacion tenant |
| Business Accelerator Hub O2C | Pilot ready | 12 artefactos O2C candidatos; requiere auth/licensing, communication scenario y payload validation |
| SAP Discovery Center O2C | Pilot ready | 8 servicios soporte; requiere entitlement, region, service plan, pricing y BTP cockpit validation |
| SAP Signavio O2C | Pilot ready | 8 mappings de proceso/metricas; requiere workspace, licencia, accelerator y contenido validado |
| Cross-source O2C | Pilot ready | 8 filas agregadas por etapa; no son arquitectura ni scope confirmado |
| Mexico overlay | Ready for fiscal owner review | 8 filas; 4 Critical y 4 High; requiere evidencia fiscal, tenant y sign-off |
| Uso externo | Not ready | Falta evidencia oficial/tenant/licenciamiento y aprobacion de owners |

## Hechos confirmados

| Fuente / artefacto | Hecho confirmado localmente | Evidencia |
| --- | --- | --- |
| FARL common traceability | Existen 456 filas FARL sourced; 105 pertenecen a Lead-to-Cash / Order-to-Cash | `sap-content-cross-source-traceability.csv` |
| O2C FARL subset | Las 105 filas O2C se agrupan en sales order controls, AR/collections/payment, sales analytics y outbound delivery | `sap-content-cross-source-traceability.csv` |
| SCI-004 Business Accelerator Hub | Existen 12 filas O2C Source-guided para APIs, SOAP service y eventos candidatos | `sap-business-accelerator-hub-o2c-pilot-inventory.csv` |
| SCI-005 Discovery Center | Existen 8 filas O2C Source-guided para servicios soporte BTP | `sap-discovery-center-o2c-pilot-inventory.csv` |
| SCI-006 Signavio | Existen 8 filas O2C Source-guided para procesos, variantes, metricas y overlay local | `sap-signavio-o2c-pilot-process-mapping.csv` |
| SCI-007 Cross-source | Existen 8 filas Derived que conectan FARL, SCI-004, SCI-005 y SCI-006 por etapa O2C | `sap-o2c-cross-source-traceability-pilot.csv` |
| SCI-008 Mexico overlay | Existen 8 filas Derived ligadas a SCI-007 con cues CFDI, complemento de pago, Carta Porte, DRC/eDocument, PAC/SAT, auditoria, conciliacion y SoD | `sap-o2c-mexico-overlay-pilot.csv` |

## Supuestos

| Supuesto | Impacto | Validacion requerida |
| --- | --- | --- |
| El piloto O2C sera revisado antes de abrir nuevas fuentes o nuevos procesos | Mantiene control de alcance y evita una matriz inmanejable | Confirmar owner review y criterio de promocion de filas |
| Las relaciones cross-source agregadas por etapa son suficientes para workshop inicial | Evita falsa precision de joins uno-a-uno | Validar con Process Architecture y Solution Architecture |
| APIs, eventos y servicios BTP son candidatos, no decisiones de diseno | Reduce riesgo de prometer integraciones no disponibles | Validar Business Accelerator Hub, SAP Help, tenant, communication scenarios y BTP cockpit |
| Signavio se usara como referencia de proceso/metricas, no como prueba de proceso instalado | Reduce riesgo de usar contenido no licenciado o no visible | Validar workspace, licencia, accelerator, rutas y metricas |
| Mexico se trata como overlay local hasta evidencia fiscal | Evita afirmaciones de cumplimiento | Validar legal entity, DRC/eDocument, PAC/SAT, XML/PDF/acuses, accounting trace y sign-off fiscal |

## Riesgos

| Riesgo | Severidad | Control recomendado |
| --- | --- | --- |
| Usar contenido publico como prueba productiva | Alta | Mantener `ValidationStatus` pendiente hasta evidencia tenant/licensing/entitlement/workspace |
| Inferir alcance oficial de scope item desde FARL local | Alta | Validar contra SAP Process Navigator / SAP Best Practices o tenant |
| Prometer APIs/eventos sin communication arrangement, auth model o payload validado | Alta | Revisar cada artefacto SCI-004 con Integration y Security owners |
| Prometer servicios BTP sin entitlement, region, plan o pricing | Alta | Revisar SCI-005 en SAP Discovery Center y BTP cockpit |
| Usar Signavio sin licencia, accelerator instalado o metrica disponible | Alta | Validar workspace y capturar evidencia aprobada |
| Tratar CFDI, complemento de pago o Carta Porte como genericos | Critica | Ejecutar validacion Mexico por escenario, legal entity y documento |
| Mezclar Lead-to-Cash e Invoice-to-Cash sin decision de boundary | Media | Definir boundary para AR, clearing, collections y dispute management |

## Validaciones abiertas

| Area | Validaciones pendientes |
| --- | --- |
| Scope y FARL | Scope item IDs oficiales, test scripts, business roles, business catalogs, spaces/pages, app visibility, deployment model y tenant activation |
| Business Accelerator Hub | Artifact URLs, API versions, communication scenarios, auth/licensing, payloads, filters, batching, event payloads, monitoring y data-volume limits |
| SAP Discovery Center / BTP | Entitlements, region, service plans, pricing, quotas, service subscriptions, destinations, connectivity, Cloud Connector/private endpoints, identity trust y role collections |
| Signavio | User access, license, workspace, installed value accelerators, exact process paths, process variants, metric overlays, extraction/data pipeline y export/API permissions |
| Mexico | Legal entity, country version, tax procedure, output management, DRC/eDocument, PAC/SAT/PAC, CFDI, complemento de pago, Carta Porte, cancellation/reissue, XML/PDF/acuses, accounting reconciliation y evidence retention |
| Governance | Owner RACI, validation evidence repository, approval gates, client-safe naming, decision log y promotion criteria from pilot to client-specific matrix |

## Readiness por etapa O2C

| Etapa | Estado | Razon |
| --- | --- | --- |
| Customer master foundation | Review ready | Base FARL/API/BTP/Signavio conectada; datos fiscales y roles requieren validacion |
| Sales order capture and approval | Review ready | Apps, API/eventos, workflow candidate y Signavio metric candidate conectados; approvals y SoD pendientes |
| Delivery and logistics execution | Review ready with Mexico caution | Carta Porte es conditional; transport evidence y connectivity requieren validacion |
| Billing and invoice evidence | High priority validation | CFDI, DRC/eDocument, PAC/SAT, XML/PDF/acuses y accounting trace son Critical |
| Returns and credit/debit adjustments | High priority validation | Cancelacion/reemision, notas credito/debito e impacto inventario/contable son Critical |
| Accounts receivable, payments and clearing | High priority validation | Complemento de pago, clearing, bancos y conciliacion contable son Critical |
| Collections, dunning and disputes | Review ready | Puede detonar correcciones fiscales; boundary con Invoice-to-Cash pendiente |
| Workshop governance and evidence control | Mandatory before client use | Se requiere RACI, evidencia minima, repository y sign-off |

## Acciones siguientes

| Prioridad | Accion | Owner sugerido | Evidencia de cierre |
| --- | --- | --- | --- |
| P0 | Ejecutar owner review de SCI-007 y SCI-008 | Solution Architecture Lead / PMO | Minuta, decisiones, owners confirmados y filas aceptadas/rechazadas |
| P0 | Convertir las 4 filas Critical Mexico en escenarios de prueba | Tax / Localization Lead | Test scenario, evidencia requerida, responsable y criterio de aceptacion |
| P0 | Validar billing, returns/adjustments y AR/payments con evidencia tenant | Sales/Billing, Finance AR, Tax | Screenshots/logs/document chain, accounting reconciliation y sign-off |
| P1 | Validar APIs/eventos candidatos de SCI-004 | Integration / Architecture Lead | Artifact URL, communication scenario, auth model, payload sample y restricciones |
| P1 | Validar servicios BTP candidatos de SCI-005 | BTP Platform Lead | Region, entitlement, service plan, subscription, quota y security model |
| P1 | Validar Signavio O2C / Invoice-to-Cash boundary | Process Architecture Lead | Workspace path, accelerator visibility, metric availability y decision de boundary |
| P2 | Preparar matriz cliente-especifica solo con filas aprobadas | Solution Architecture Lead | Version filtrada con evidencia y validation status actualizado |

## Recomendacion

Mantener el piloto como paquete interno de readiness y no compartirlo como compromiso de alcance. El siguiente hito debe ser un owner review de 60-90 minutos con dos salidas: decision de que filas entran a Fit-to-Standard y lista de evidencia minima para promover filas de `Derived` o `Source-guided` a `Tenant-validated`.
