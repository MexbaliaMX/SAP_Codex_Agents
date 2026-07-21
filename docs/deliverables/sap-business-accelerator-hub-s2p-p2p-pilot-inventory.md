# SAP Business Accelerator Hub S2P/P2P Pilot Inventory

Fecha de preparacion: 2026-07-19

## Proposito

Este inventario piloto cubre artefactos candidatos de SAP Business Accelerator Hub / api.sap.com para Source-to-Pay / Procure-to-Pay core. Se mantiene deliberadamente estrecho para preparar SCI-010 sin abrir una ingesta masiva ni asumir disponibilidad productiva.

Este entregable no prueba licenciamiento, comunicacion configurada, entitlement, edition, scope item, payload final, autorizaciones, activacion tenant, visibilidad en launchpad, eventos, DRC/eDocument, PAC/SAT, retenciones, VAT, Carta Porte ni cumplimiento fiscal Mexico.

## Archivo CSV

- `docs/deliverables/sap-business-accelerator-hub-s2p-p2p-pilot-inventory.csv`

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 14 |
| APIs OData / CDS | 11 |
| Business events | 3 |
| Proceso E2E | Source-to-Pay / Procure-to-Pay |
| Nivel de evidencia | Source-guided |
| Estado de validacion | Auth/licensing validation pending |

## Cobertura piloto

| Area S2P/P2P | Artefactos candidatos |
| --- | --- |
| Supplier and master data foundation | `API_BUSINESS_PARTNER` |
| Sourcing and contracts | `API_REQUESTFORQUOTATION_2`, `API_SUPPLIERQUOTATION_2`, `API_PURCHASECONTRACT_PROCESS_SRV;v=2`, `API_CENTRAL_PURCHASECONTRACT` |
| Requisition and purchase order | `API_PURCHASEREQ_PROCESS_SRV`, `API_PURCHASEORDER_2`, Purchase Order Events |
| Goods receipt and service entry | `API_MATERIAL_DOCUMENT_SRV`, Material Document Events, `API_SERVICEENTRYSHEET / api_serviceentrysheet` |
| Supplier invoice and exceptions | `API_SUPPLIERINVOICE_PROCESS_SRV`, Supplier Invoice Events |
| GR/IR and AP handoff | `API_OPLACCTGDOCITEMCUBE_SRV` |
| Procurement analytics and spend control | `I_ProcmtHubPurOrdItmAPI01` |

## Fuentes oficiales consultadas

- SAP Business Accelerator Hub: `https://api.sap.com/`
- SAP Help Portal pages linked per row in the CSV under `OfficialHelpUrl`.

## Validaciones abiertas

- Confirmar cada artifact URL exacto en SAP Business Accelerator Hub, especialmente servicios OData V4 y CDS views.
- Confirmar current release status, deprecation status, API version and preferred successor where SAP Help shows version/lifecycle signals.
- Confirmar communication scenario, communication arrangement, authentication method, business role/catalog and API user per tenant.
- Confirmar product edition, scope item, country, industry and license availability.
- Confirmar payload, filters, batching, data-volume limits, event payloads and error handling before interface design.
- Confirmar boundary con SAP Ariba, SAP Business Network, central procurement, Record-to-Report and Treasury before extending scope.
- Para Mexico, validar supplier CFDI, XML/PDF/acuses, PAC/SAT, retenciones, VAT, Carta Porte only when logistics/transport applies, GR/IR, accounting trace and SoD.

## Siguientes acciones

1. Revisar el piloto con Procurement, Strategic Sourcing, Warehouse/Receiving, Services Procurement, Accounts Payable, Finance/R2R, Tax/Localization and Integration owners.
2. Confirmar cuales artefactos son relevantes para el cliente, deployment model y release objetivo.
3. Validar Business Accelerator Hub pages and SAP Help pages against target release, API lifecycle and tenant communication setup.
4. Decidir que filas pasan a SCI-011/SCI-012 dependency mapping and later SCI-013 cross-source traceability.
