# SAP S2P/P2P Content Readiness Report

Fecha de preparacion: 2026-07-19

## Resumen ejecutivo

El piloto de integracion de contenido SAP para Source-to-Pay / Procure-to-Pay esta listo para revision interna con owners de Supplier Master, Strategic Sourcing, Procurement Operations, Warehouse/Receiving, Services Procurement, Accounts Payable, Finance/Record-to-Report, Integration, BTP Platform, Identity/Security, Signavio y Tax/Localization.

No esta listo para compromiso cliente, confirmacion de alcance, diseno tecnico productivo, activacion de APIs/eventos, sizing BTP, licenciamiento, entitlement, workspace Signavio, evidencia fiscal Mexico ni cumplimiento legal.

La base actual permite navegar de forma controlada desde etapas S2P/P2P hacia apps Fiori, APIs/eventos/CDS candidates, servicios BTP soporte, procesos/metricas Signavio y cues Mexico. Todas las relaciones siguen siendo `FARL sourced`, `Source-guided` o `Derived`; ninguna fila es `Tenant-validated`.

## Decision de readiness

| Dimension | Estado | Lectura ejecutiva |
| --- | --- | --- |
| FARL local S2P/P2P | Ready for controlled use | 57 filas FARL sourced para Source-to-Pay / Procure-to-Pay; requiere validacion tenant, roles, catalogs y scope oficial |
| Business Accelerator Hub S2P/P2P | Pilot ready | 14 artefactos candidatos: 10 APIs, 3 events y 1 CDS view; requiere auth/licensing, communication scenario, payload/event validation |
| SAP Discovery Center S2P/P2P | Pilot ready | 10 servicios soporte; requiere entitlement, region, service plan, pricing, subscription y BTP cockpit evidence |
| SAP Signavio S2P/P2P | Pilot ready | 8 mappings de proceso/metricas; requiere workspace, licencia, accelerator, metricas y extraction template validation |
| Cross-source S2P/P2P | Pilot ready | 8 filas agregadas por etapa conectan FARL, SCI-010, SCI-011 y SCI-012; no son arquitectura ni scope confirmado |
| Mexico overlay S2P/P2P | Ready for fiscal owner review | 8 filas: 3 Critical, 3 High y 2 Medium; requiere legal entity, DRC/eDocument, SAT/PAC, CFDI proveedor, retenciones/VAT, Carta Porte, GR/IR y SoD |
| Uso externo | Not ready | Falta evidencia oficial/tenant/licenciamiento/entitlement/workspace/fiscal y aprobacion de owners |

## Hechos confirmados

| Fuente / artefacto | Hecho confirmado localmente | Evidencia |
| --- | --- | --- |
| FARL common traceability | Existen 456 filas FARL sourced; 57 pertenecen a Source-to-Pay / Procure-to-Pay | `sap-content-cross-source-traceability.csv` |
| S2P/P2P FARL subset | Las 57 filas se agrupan en sourcing/contracts, operational procurement, goods receipt/service entry, invoice/AP handoff and procurement analytics | `sap-content-cross-source-traceability.csv` |
| SCI-010 Business Accelerator Hub | Existen 14 filas Source-guided: 10 APIs, 3 events y 1 CDS view | `sap-business-accelerator-hub-s2p-p2p-pilot-inventory.csv` |
| SCI-011 Discovery Center | Existen 10 filas Source-guided para Integration, Events, Identity, Connectivity, Process Automation, Compliance, Master Data and Document Processing | `sap-discovery-center-s2p-p2p-pilot-inventory.csv` |
| SCI-012 Signavio | Existen 8 filas Source-guided para procesos, variantes, metricas, dashboards y overlay local | `sap-signavio-s2p-p2p-pilot-process-mapping.csv` |
| SCI-013 Cross-source | Existen 8 filas Derived que conectan FARL, SCI-010, SCI-011 y SCI-012 por etapa S2P/P2P | `sap-s2p-p2p-cross-source-traceability-pilot.csv` |
| SCI-014 Mexico overlay | Existen 8 filas Derived ligadas a SCI-013 con cues de supplier CFDI, XML/PDF/acuses, SAT/PAC, retenciones/VAT, Carta Porte condicional, GR/IR, accounting trace, auditoria y SoD | `sap-s2p-p2p-mexico-overlay-pilot.csv` |

## Supuestos

| Supuesto | Impacto | Validacion requerida |
| --- | --- | --- |
| El piloto S2P/P2P se mantiene limitado a core procurement antes de abrir SAP Ariba, SAP Business Network, payment automation o tax engines | Evita expandir el universo funcional sin evidencia | Confirmar owner review y scope boundary por workstream |
| Las relaciones cross-source agregadas por etapa son suficientes para workshop inicial | Evita falsa precision de joins uno-a-uno | Validar con Process Architecture y Solution Architecture |
| APIs, eventos, CDS views y servicios BTP son candidatos, no decisiones de diseno | Reduce riesgo de prometer integraciones no disponibles | Validar Business Accelerator Hub, SAP Help, tenant, communication scenarios, auth model and BTP cockpit |
| Signavio se usara como referencia de proceso/metricas, no como prueba de proceso instalado | Reduce riesgo de usar contenido no licenciado o no visible | Validar workspace, licencia, accelerator, rutas, metricas and extraction template |
| Mexico se trata como overlay local hasta evidencia fiscal | Evita afirmaciones de cumplimiento | Validar legal entity, DRC/eDocument, SAT/PAC, CFDI proveedor, XML/PDF/acuses, retenciones/VAT, accounting trace and sign-off fiscal |

## Riesgos

| Riesgo | Severidad | Control recomendado |
| --- | --- | --- |
| Usar contenido publico como prueba productiva | Alta | Mantener `ValidationStatus` pendiente hasta evidencia tenant/licensing/entitlement/workspace |
| Inferir scope item oficial desde FARL local | Alta | Validar contra SAP Process Navigator / SAP Best Practices o tenant |
| Prometer APIs/eventos sin communication arrangement, auth model, payload o event subscription validado | Alta | Revisar SCI-010 con Integration, Security and Procurement owners |
| Prometer servicios BTP sin entitlement, region, plan, quota, pricing o subscription evidence | Alta | Revisar SCI-011 en SAP Discovery Center and BTP cockpit |
| Usar Signavio sin licencia, accelerator instalado, metricas visibles o extraction template aprobado | Alta | Validar workspace y capturar evidencia aprobada |
| Tratar supplier CFDI, retenciones/VAT, SAT/PAC o Carta Porte como genericos | Critica | Ejecutar validacion Mexico por legal entity, supplier invoice scenario, transport scenario and evidence chain |
| Mezclar P2P, Record-to-Report y Treasury sin decision de boundary | Alta | Definir owner y handoff para GR/IR, AP open item, payment readiness and accounting evidence |
| Incluir SAP Ariba, Business Network, OCR/document extraction o workflow tooling como alcance automatico | Media | Mantenerlos como candidates hasta decision de scope y evidencia fuente |

## Validaciones abiertas

| Area | Validaciones pendientes |
| --- | --- |
| Scope y FARL | Scope item IDs oficiales, test scripts, business roles, business catalogs, spaces/pages, app visibility, deployment model and tenant activation |
| Business Accelerator Hub | Artifact URLs, API versions, communication scenarios, auth/licensing, payloads, filters, batching, event payloads, monitoring and data-volume limits |
| SAP Discovery Center / BTP | Entitlements, region, service plans, pricing, quotas, subscriptions, destinations, connectivity, Cloud Connector/private endpoints, identity trust and role collections |
| Signavio | User access, license, workspace, installed value accelerators, exact process paths, variants, metric overlays, extraction/data pipeline and export/API permissions |
| Mexico | Legal entity, country version, tax procedure, DRC/eDocument, SAT/PAC, supplier CFDI, XML/PDF/acuses, withholding/VAT, Carta Porte, cancellation/substitution, GR/IR, AP handoff, accounting reconciliation and evidence retention |
| Governance | Owner RACI, validation evidence repository, approval gates, client-safe naming, decision log and promotion criteria from pilot to client-specific matrix |

## Readiness por etapa S2P/P2P

| Etapa | Estado | Razon |
| --- | --- | --- |
| Supplier and master data foundation | Review ready | Supplier/BP/product apps, Business Partner API, identity, destination and MDI candidates connected; fiscal master data, bank-data governance and SoD pending |
| Sourcing and contracts | Review ready | RFQ, quotations, sourcing project and contract candidates connected; SAP Ariba/central procurement boundary and approval controls pending |
| Requisition and purchase order | Review ready | PR/PO apps, APIs/events, workflow and Signavio metrics connected; approvals, tax/account assignment and SoD pending |
| Goods receipt and service entry | Review ready with Mexico caution | GR/SES apps, Material Document API/events, SES API and connectivity candidates connected; Carta Porte conditional and reversal evidence pending |
| Supplier invoice and exceptions | High priority validation | Supplier CFDI, DRC/eDocument, SAT/PAC, XML/PDF/acuses, withholding/VAT, blocked invoice and accounting trace are Critical |
| GR/IR and AP handoff | High priority validation | GR/IR, AP open item, operational journal trace, reversal handling and P2P-to-R2R boundary are Critical |
| Procurement analytics and supplier performance | Review ready | Spend and supplier performance candidates connected; data lineage, CDS authorization and fiscal/audit evidence boundary pending |
| Workshop governance and evidence control | Mandatory before client use | Requires RACI, evidence repository, validation checklist, legal-entity scope, SoD review and sign-off |

## Acciones siguientes

| Prioridad | Accion | Owner sugerido | Evidencia de cierre |
| --- | --- | --- | --- |
| P0 | Ejecutar owner review de SCI-013 y SCI-014 | Solution Architecture Lead / PMO | Minuta, decision log, owners confirmados y filas aceptadas/rechazadas |
| P0 | Convertir las 3 filas Critical Mexico en escenarios de prueba | Tax / Localization Lead | Test scenario, evidencia requerida, responsable y criterio de aceptacion |
| P0 | Validar supplier invoice, GR/IR/AP handoff y receiving/service evidence con evidencia tenant | AP, Finance/R2R, Receiving, Tax | Screenshots/logs/document chain, accounting reconciliation and sign-off |
| P1 | Validar APIs/eventos/CDS candidates de SCI-010 | Integration / Architecture Lead | Artifact URL, communication scenario, auth model, payload/event sample and restrictions |
| P1 | Validar servicios BTP candidates de SCI-011 | BTP Platform Lead | Region, entitlement, service plan, subscription, quota and security model |
| P1 | Validar Signavio S2P/P2P / Invoice-to-Pay boundary | Process Architecture Lead | Workspace path, accelerator visibility, metric availability and boundary decision |
| P1 | Definir scope boundary con SAP Ariba, SAP Business Network, OCR/document extraction, workflow tooling and Treasury | PMO / Process Architecture Lead | Explicit in-scope/out-of-scope decision with owner approval |
| P2 | Preparar matriz cliente-especifica solo con filas aprobadas | Solution Architecture Lead | Version filtrada con evidencia y validation status actualizado |

## Fuentes oficiales de referencia

| Fuente | Uso controlado |
| --- | --- |
| [SAP Help - SAP Document and Reporting Compliance para Mexico](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/835ce9e19dfb46b5b4e3b48d76eb00a7/85ebbf5d8ad849a7977f239ba940deb1.html) | Referencia de DRC/eDocument Mexico; no prueba tenant ni alcance contractual |
| [SAP Help - Receiving Electronic Supplier Invoices Using SAP Document and Reporting Compliance, cloud edition](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/c30311a28bc24fe08bd47eafbf3fd930/2b7f809575154e56a62492ff3beffafc.html) | Referencia de received supplier invoice/eDocument candidate |
| [SAP Help - SAP Integration Suite](https://help.sap.com/docs/integration-suite/sap-integration-suite/configuration-guide) | Referencia de plataforma de integracion; entitlement, plan and region remain pending |
| [SAP Help - Procure to Pay in SAP S/4HANA accelerator](https://help.sap.com/docs/signavio-process-intelligence/accelerators/procure-to-pay-in-sap-s4hana) | Referencia Signavio/P2P; workspace and license remain pending |
| [SAT - CFDI Anexo 20](https://wwwmat.sat.gob.mx/cs/Satellite?c=ConsultaInfo&childpagename=SatTyR%2FConsultaInfo%2FSAT_LandingConsultaInformacion&cid=1462228635025&packedargs=d%3DTouch&pagename=TySWrapper) | Referencia fiscal para CFDI; validar con Tax/Legal |
| [SAT - Complemento Carta Porte](https://wwwmatnp.sat.gob.mx/consultas/68823/complemento-carta-porte-) | Referencia para transporte de bienes/mercancias; aplicabilidad es condicional |
| [SAT - Cancelacion de facturas](https://www.sat.gob.mx/minisitio/Factura/cancela_procesocancelacion.htm) | Referencia para cancelacion/sustitucion; validar proceso fiscal y evidencia |

## Recomendacion

Mantener el piloto S2P/P2P como paquete interno de readiness. El siguiente hito debe ser un owner review de 60-90 minutos con dos salidas: decision de que filas entran a Fit-to-Standard y lista de evidencia minima para promover filas de `Derived` o `Source-guided` a `Tenant-validated`.
