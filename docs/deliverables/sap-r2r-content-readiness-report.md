# SAP R2R Content Readiness Report

Fecha de preparacion: 2026-07-20

## Resumen ejecutivo

El piloto de integracion de contenido SAP para Record-to-Report esta listo para revision interna con owners de General Ledger, Financial Close, AP/AR, Treasury Operations, Finance Controls, Reporting/Analytics, Integration, BTP Platform, Identity/Security, Signavio, Tax/Localization and PMO.

No esta listo para compromiso cliente, confirmacion de alcance, diseno tecnico productivo, activacion de APIs/eventos, sizing BTP, licenciamiento, entitlement, workspace Signavio, evidencia fiscal Mexico, cierre contable auditado ni cumplimiento legal.

La base actual permite navegar de forma controlada desde etapas R2R hacia apps Fiori, APIs/SOAP/eventos/CDS/control candidates, servicios BTP soporte, procesos/metricas Signavio y cues Mexico. Todas las relaciones siguen siendo `FARL sourced`, `Source-guided` o `Derived`; ninguna fila es `Tenant-validated`.

## Decision de readiness

| Dimension | Estado | Lectura ejecutiva |
| --- | --- | --- |
| FARL local R2R | Ready for controlled use | 36 filas FARL sourced para Record-to-Report; requiere validacion tenant, roles, catalogs, scope oficial y visibilidad launchpad |
| Business Accelerator Hub R2R | Pilot ready | 13 artefactos candidatos: 7 APIs, 4 SOAP services, 1 event y 1 documentation/control reference; requiere auth/licensing, communication scenario, payload and event validation |
| SAP Discovery Center R2R | Pilot ready | 11 servicios soporte; requiere entitlement, region, service plan, pricing, subscription, quota y BTP cockpit evidence |
| SAP Signavio R2R | Pilot ready | 8 mappings de proceso/metricas; incluye Record to Report Financial Closing accelerator como candidato; requiere workspace, licencia, metricas, accelerator import/configuration and extraction validation |
| Cross-source R2R | Pilot ready | 8 filas agregadas por etapa conectan FARL, SCI-017, SCI-018 y SCI-019; no son arquitectura ni scope confirmado |
| Mexico overlay R2R | Ready for fiscal owner review | 8 filas: 4 Critical y 4 High; requiere legal entity, DRC/eDocument, SAT/PAC, complemento de pago, CFDI carry-forward, retenciones/VAT, FX, bancos, reporting, retention and SoD |
| Uso externo | Not ready | Falta evidencia oficial/tenant/licenciamiento/entitlement/workspace/fiscal y aprobacion de owners |

## Hechos confirmados

| Fuente / artefacto | Hecho confirmado localmente | Evidencia |
| --- | --- | --- |
| FARL common traceability | Existen 456 filas FARL sourced; 36 pertenecen a Record-to-Report | `sap-content-cross-source-traceability.csv` |
| R2R FARL subset | Las 36 filas se agrupan en General Ledger Accounting and Financial Close, Finance analytics and compliance, and Bank/AP/AR/payment operations | `sap-content-cross-source-traceability.csv` |
| SCI-017 Business Accelerator Hub | Existen 13 filas Source-guided: 7 APIs, 4 SOAP services, 1 event y 1 documentation/control reference | `sap-business-accelerator-hub-r2r-pilot-inventory.csv` |
| SCI-018 Discovery Center | Existen 11 filas Source-guided para Integration, Events, Identity, Connectivity, Process Automation, Compliance, Document Processing and Analytics | `sap-discovery-center-r2r-pilot-inventory.csv` |
| SCI-019 Signavio | Existen 8 filas Source-guided para Record-to-Report / Financial Closing, journal entry, clearing, reporting, controls and Mexico governance candidates | `sap-signavio-r2r-pilot-process-mapping.csv` |
| SCI-020 Cross-source | Existen 8 filas Derived que conectan FARL, SCI-017, SCI-018 y SCI-019 por etapa R2R | `sap-r2r-cross-source-traceability-pilot.csv` |
| SCI-021 Mexico overlay | Existen 8 filas Derived ligadas a SCI-020 con cues de CFDI/complemento carry-forward, retenciones/VAT, FX, bancos, conciliacion contable, evidencia fiscal, archivo/retencion, auditoria y SoD | `sap-r2r-mexico-overlay-pilot.csv` |

## Supuestos

| Supuesto | Impacto | Validacion requerida |
| --- | --- | --- |
| El piloto R2R se mantiene limitado a core finance close, journal entry, clearing, AP/AR handoff, reporting and controls | Evita abrir Treasury avanzado, Group Reporting, GRC, tax engines, data lake or EPM sin evidencia | Confirmar owner review y scope boundary por workstream |
| Las relaciones cross-source agregadas por etapa son suficientes para workshop inicial | Evita falsa precision de joins uno-a-uno | Validar con Process Architecture y Solution Architecture |
| APIs, SOAP services, eventos, CDS/read services y BTP services son candidatos, no decisiones de diseno | Reduce riesgo de prometer integraciones no disponibles | Validar Business Accelerator Hub, SAP Help, tenant, communication scenarios, auth model and BTP cockpit |
| Signavio se usara como referencia de proceso/metricas, no como prueba de proceso instalado | Reduce riesgo de usar contenido no licenciado o no visible | Validar workspace, licencia, accelerator import, dashboards, metricas and extraction pipeline |
| Mexico se trata como overlay local hasta evidencia fiscal | Evita afirmaciones de cumplimiento | Validar legal entity, DRC/eDocument, SAT/PAC, complemento de pago, CFDI carry-forward, XML/PDF/acuses, accounting trace and sign-off fiscal |

## Riesgos

| Riesgo | Severidad | Control recomendado |
| --- | --- | --- |
| Usar contenido publico o local como prueba productiva | Alta | Mantener `ValidationStatus` pendiente hasta evidencia tenant/licensing/entitlement/workspace |
| Inferir scope item oficial desde FARL local | Alta | Validar contra SAP Process Navigator / SAP Best Practices o tenant |
| Prometer APIs/SOAP/eventos sin communication arrangement, auth model, payload, filters or monitoring validado | Alta | Revisar SCI-017 con Integration, Security and Finance owners |
| Prometer servicios BTP sin entitlement, region, plan, quota, pricing or subscription evidence | Alta | Revisar SCI-018 en SAP Discovery Center and BTP cockpit |
| Usar Signavio sin licencia, accelerator instalado/configurado, metricas visibles or extraction template aprobado | Alta | Validar workspace y capturar evidencia aprobada |
| Tratar complemento de pago, CFDI carry-forward, SAT/PAC, retenciones/VAT o FX como genericos | Critica | Ejecutar validacion Mexico por legal entity, scenario, fiscal document, payment and evidence chain |
| Mezclar R2R, O2C, S2P/P2P, Treasury, Tax and GRC sin decision de boundary | Alta | Definir owner y handoff para AP/AR open items, clearing, payments, GR/IR, billing and statutory evidence |
| Incluir Group Reporting, advanced Treasury, payment factory, GRC, ILM/Data Retention tooling, SAC planning or data lake como alcance automatico | Media | Mantenerlos como out-of-scope hasta decision de scope y evidencia fuente |

## Validaciones abiertas

| Area | Validaciones pendientes |
| --- | --- |
| Scope y FARL | Scope item IDs oficiales, test scripts, business roles, business catalogs, spaces/pages, app visibility, deployment model and tenant activation |
| Business Accelerator Hub | Artifact URLs, API/SOAP versions, communication scenarios, auth/licensing, payloads, filters, batching, event payloads, monitoring, AIF/error handling and data-volume limits |
| SAP Discovery Center / BTP | Entitlements, region, service plans, pricing, quotas, subscriptions, destinations, connectivity, Cloud Connector/private endpoints, identity trust, role collections and operations model |
| Signavio | User access, license, workspace, Record to Report Financial Closing accelerator, exact process path, dashboard import/configuration, metrics, event log, case ID, extraction/data pipeline and export/API permissions |
| Mexico | Legal entity, country version, tax procedure, chart of accounts, DRC/eDocument, SAT/PAC, complemento de pago, CFDI carry-forward, withholding/VAT, FX source, bank evidence, statutory reporting, cancellation/substitution, XML/PDF/acuses, accounting reconciliation and evidence retention |
| Governance | Owner RACI, validation evidence repository, approval gates, client-safe naming, decision log and promotion criteria from pilot to client-specific matrix |

## Readiness por etapa R2R

| Etapa | Estado | Razon |
| --- | --- | --- |
| Financial master data foundation | Review ready | G/L and bank master apps, read APIs, identity/destination/data-fabric candidates and Signavio master-data metrics connected; statutory chart, bank evidence, ownership and SoD pending |
| Journal entry capture and verification | Review ready with controls caution | Journal entry apps, post/change/event candidates, integration/eventing/workflow support and financial-document metrics connected; approvals, tax code, FX, AIF/logging and SoD pending |
| Period-end close and recurring activities | Review ready with Mexico caution | GL/AP/AR jobs, recurring postings, FX valuation, trial balance and Signavio financial closing accelerator connected; close sign-off, FX source, statutory blocks and dashboard configuration pending |
| Clearing, bank and payment operations | High priority validation | Payment evidence, bank trace, clearing reset, payment advice, complemento de pago boundary and bank reconciliation are Critical |
| AP/AR line-item and subledger handoff | High priority validation | CFDI/payment complement carry-forward, withholding/VAT, GR/IR or billing links, accounting reconciliation and cross-process boundary are Critical |
| Financial reporting and statements | High priority validation | Trial balance, financial statements, DRC/statutory reporting, data lineage, legal entity scope and evidence retention are Critical |
| Controls, substitution/validation and audit evidence | Mandatory before client use | Posting validation, substitution rules, workflow approvals, logs, identity/security and SoD must be reviewed before any design commitment |
| Workshop governance and Mexico evidence control | Mandatory before client use | Requires RACI, evidence repository, validation checklist, legal-entity scope, DRC/SAT/PAC method, retention and sign-off |

## Acciones siguientes

| Prioridad | Accion | Owner sugerido | Evidencia de cierre |
| --- | --- | --- | --- |
| P0 | Ejecutar owner review de SCI-020 y SCI-021 | Solution Architecture Lead / PMO | Minuta, decision log, owners confirmados y filas aceptadas/rechazadas |
| P0 | Convertir las 4 filas Critical Mexico en escenarios de prueba | Tax / Localization Lead | Test scenario, evidencia requerida, responsable y criterio de aceptacion |
| P0 | Validar clearing/payment, AP/AR handoff, reporting/statutory and governance controls con evidencia tenant | Treasury, AP/AR, Reporting, Tax, Finance Controls | Screenshots/logs/document chain, accounting reconciliation and sign-off |
| P1 | Validar APIs/SOAP/event candidates de SCI-017 | Integration / Architecture Lead | Artifact URL, communication scenario, auth model, payload/event sample, monitoring and restrictions |
| P1 | Validar servicios BTP candidates de SCI-018 | BTP Platform Lead | Region, entitlement, service plan, subscription, quota, destination/connectivity and security model |
| P1 | Validar Signavio R2R Financial Closing accelerator | Process Architecture Lead | Workspace path, license, accelerator visibility/import, metric availability, extraction template and boundary decision |
| P1 | Definir scope boundary con O2C, S2P/P2P, Treasury, Tax, GRC, Group Reporting and Analytics | PMO / Process Architecture Lead | Explicit in-scope/out-of-scope decision with owner approval |
| P2 | Preparar matriz cliente-especifica solo con filas aprobadas | Solution Architecture Lead | Version filtrada con evidencia y validation status actualizado |

## Fuentes oficiales de referencia

| Fuente | Uso controlado |
| --- | --- |
| [SAP Help - APIs for General Ledger Accounting](https://help.sap.com/docs/SAP_S4HANA_CLOUD/b978f98fc5884ff2aeb10c8fdeb8a43b/e6c0a161b1874c47b5de2519917d0a8d-39.html) | Referencia de APIs R2R; no prueba tenant, auth or payload fit |
| [SAP Help - SAP Integration Suite](https://help.sap.com/docs/integration-suite/sap-integration-suite/configuration-guide) | Referencia de plataforma de integracion; entitlement, plan and region remain pending |
| [SAP Help - SAP Document and Reporting Compliance](https://help.sap.com/docs/SAP_S4HANA_CLOUD/71af4585db6d4904b1724730f3776c9b/a90aea8760a64e419446e453c6d64027.html) | Referencia general para eDocuments/statutory reports; no prueba Mexico scope ni activacion |
| [SAP Help - DRC requirements](https://help.sap.com/docs/SAP_S4HANA_CLOUD/1d9e8bfcd5ee447d91c62819e2d2ac60/2f0748f4a7054247a6b67382416ce782.html) | Referencia para marcar scope items/country activation/cloud edition integration as validation pending |
| [SAP Help - Signavio R2R Financial Closing accelerator](https://help.sap.com/docs/signavio-process-intelligence/reference-guide-for-value-accelerators/value-accelerator-for-analysis-of-record-to-report) | Referencia Signavio/R2R; workspace, license, import and metric availability remain pending |
| [SAT - Complemento Recepcion de Pagos](https://www.sat.gob.mx/portal/public/tramites/complemento-recepcion-de-pagos) | Referencia fiscal para complemento de pago; validar con Tax/Legal |
| [SAT - Cancelacion de facturas](https://www.sat.gob.mx/minisitio/Factura/cancela_procesocancelacion.htm) | Referencia para cancelacion/sustitucion; validar proceso fiscal y evidencia |

## Recomendacion

Mantener el piloto R2R como paquete interno de readiness y no compartirlo como compromiso de alcance. El siguiente hito debe ser un owner review de 60-90 minutos con dos salidas: decision de que filas entran a Fit-to-Standard y lista de evidencia minima para promover filas de `Derived` o `Source-guided` a `Tenant-validated`.
