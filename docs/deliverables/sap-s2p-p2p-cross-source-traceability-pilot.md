# SAP S2P/P2P Cross-Source Traceability Pilot

Fecha de preparacion: 2026-07-19

## Proposito

Esta matriz piloto conecta contenido local ya inventariado de SAP Fiori Apps Reference Library, SAP Business Accelerator Hub / api.sap.com, SAP Discovery Center y SAP Signavio para Source-to-Pay / Procure-to-Pay.

El piloto completa SCI-013 sin abrir nuevas fuentes ni ampliar el alcance a transformacion SAP Ariba, SAP Business Network, pagos, tesoreria o R2R completo. Usa un grano agregado por etapa para soportar revision de owners y preparacion de Fit-to-Standard.

Este entregable no prueba tenant, licenciamiento, edition, scope item oficial, communication scenario, BTP entitlement, region, service plan, workspace Signavio, value accelerator instalado, metrica disponible, configuracion Mexico ni cumplimiento legal.

## Archivo CSV

- `docs/deliverables/sap-s2p-p2p-cross-source-traceability-pilot.csv`

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 8 |
| Proceso E2E | Source-to-Pay / Procure-to-Pay |
| Fuente FARL local | `sap-content-cross-source-traceability.csv` S2P/P2P subset |
| Fuente SCI-010 | Business Accelerator Hub S2P/P2P pilot inventory |
| Fuente SCI-011 | SAP Discovery Center S2P/P2P support-service pilot inventory |
| Fuente SCI-012 | SAP Signavio S2P/P2P pilot process mapping |
| Nivel de evidencia | Derived |
| Estado de validacion | Tenant, licensing, entitlement, workspace and content validation pending |

## Cobertura piloto

| Etapa S2P/P2P | Enlace cross-source |
| --- | --- |
| Supplier and master data foundation | Supplier/BP/product FARL apps, Business Partner API, Integration Suite, Cloud Identity Services, Destination service, MDI candidate and Signavio master-data metric candidates |
| Sourcing and contracts | RFQ, supplier quotation, sourcing project and contract FARL apps, RFQ/quotation/contract APIs, Integration Suite, identity, destination, workflow candidate and Signavio sourcing/contract mapping |
| Requisition and purchase order | PR/PO apps, approvals, scheduling agreements, supplier confirmations, PR/PO APIs, PO events, event services, identity, destination, workflow candidate and Signavio PR-to-PO/PO metrics |
| Goods receipt and service entry | GR, material document, stock, physical inventory and SES apps, Material Document API/events, Service Entry Sheet API, connectivity/event/workflow candidates and Signavio receiving/service acceptance candidates |
| Supplier invoice and exceptions | Supplier invoice, blocked invoice and ERS apps, Supplier Invoice API/events, Integration Suite, event services, DRC/eDocument, Document Information Extraction and Signavio P2P/Invoice-to-Pay metrics |
| GR/IR and AP handoff | GR/IR clearing and supplier invoice evidence apps, journal-entry trace API, supplier invoice events, connectivity/compliance candidates and Signavio invoice/AP handoff relationship |
| Procurement analytics and supplier performance | Spend, off-contract spend, overview and supplier evaluation apps, released CDS candidate, Integration Suite, identity, MDI and Signavio dashboard/performance indicator candidates |
| Workshop governance and evidence control | Aggregated validation worklist across FARL, SCI-010, SCI-011 and SCI-012 to prevent treating candidate links as confirmed design |

## Validaciones abiertas

- Confirmar scope item IDs oficiales y test scripts contra SAP Process Navigator / SAP Best Practices o tenant.
- Confirmar activacion de apps, business roles, business catalogs, spaces/pages and authorizations in tenant.
- Confirmar SAP Business Accelerator Hub artifact URLs, communication scenarios, payloads, filters, events, data-volume limits and auth model.
- Confirmar SAP Discovery Center region, entitlement, service plan, pricing, quotas, missions and BTP cockpit subscription evidence.
- Confirmar SAP Signavio workspace access, licensed content, value accelerators, exact variants, metric overlays, extraction template and process boundary between Source-to-Pay, Procure-to-Pay and Invoice-to-Pay.
- Para Mexico, validar CFDI de proveedor, XML/PDF/acuses, PAC/SAT, retenciones/VAT, Carta Porte condicional, DRC/eDocument, GR/IR, accounting trace, evidence retention and SoD.
- Confirmar limites con Record-to-Report, Treasury, SAP Ariba, SAP Business Network, OCR/document extraction and workflow tooling before design commitment.

## Siguientes acciones

1. Revisar la matriz con Strategic Sourcing, Procurement Operations, Warehouse/Receiving, Services Procurement, AP, Finance/R2R, Tax/Localization, Integration, BTP Platform, Identity/Security and Process Architecture owners.
2. Seleccionar filas que entran a workshop Fit-to-Standard y separar las que requieren validacion tecnica previa.
3. Ejecutar SCI-014 como overlay Mexico S2P/P2P usando esta matriz como llave de trazabilidad.
4. Mantener esta matriz separada de evidencia cliente hasta validar fuentes, tenant, licenciamiento, entitlement, workspace Signavio y evidencia fiscal.
