# SAP Business Accelerator Hub O2C Pilot Inventory

Fecha de preparacion: 2026-07-19

## Proposito

Este inventario piloto cubre artefactos candidatos de SAP Business Accelerator Hub / api.sap.com para Lead-to-Cash / Order-to-Cash. Su objetivo es preparar SCI-004 sin hacer una ingesta masiva ni asumir disponibilidad productiva.

Este entregable no prueba licenciamiento, comunicacion configurada, entitlement, edition, scope item, payload final, autorizaciones, activacion tenant, visibilidad en launchpad, Event Mesh, Advanced Event Mesh, DRC/eDocument ni cumplimiento fiscal Mexico.

## Archivo CSV

- `docs/deliverables/sap-business-accelerator-hub-o2c-pilot-inventory.csv`

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 12 |
| APIs OData / SOAP | 10 |
| Business events | 2 |
| Proceso E2E | Lead-to-Cash / Order-to-Cash |
| Nivel de evidencia | Source-guided |
| Estado de validacion | Auth/licensing validation pending |

## Cobertura piloto

| Area O2C | Artefactos candidatos |
| --- | --- |
| Customer master | `API_BUSINESS_PARTNER` |
| Sales order | `API_SALES_ORDER_SRV`, Sales Order Events |
| Delivery / logistics | `API_OUTBOUND_DELIVERY_SRV` |
| Billing | `API_BILLING_DOCUMENT_SRV`, `BDwReferenceRequest_In`, Billing Document Events |
| Returns and claims | `API_CUSTOMER_RETURN_SRV`, `API_CREDIT_MEMO_REQUEST_SRV`, `API_DEBIT_MEMO_REQUEST_SRV` |
| AR / payment / accounting trace | `API_PAYMENT_ADVICE_SRV`, `API_OPLACCTGDOCITEMCUBE_SRV` |

## Fuentes oficiales consultadas

- SAP Business Accelerator Hub: `https://api.sap.com/`
- SAP Help Portal pages linked per row in the CSV under `OfficialHelpUrl`.

## Validaciones abiertas

- Confirmar el artifact URL exacto en Business Accelerator Hub para filas donde el hub requiere busqueda o sesion.
- Confirmar communication scenario, communication arrangement, authentication method and business user/catalog per tenant.
- Confirmar product edition, scope item, country, industry and license availability.
- Confirmar payload, filters, batching, data-volume limits and error handling before any interface design.
- Para Mexico, validar CFDI, complemento de pago, Carta Porte, DRC/eDocument, PAC/SAT, accounting trace, cancellations/reissue and audit evidence where applicable.

## Siguientes acciones

1. Revisar el piloto con Sales, Billing, Logistics, AR/Treasury, Tax/Localization and Integration owners.
2. Confirmar which artifacts are relevant for the target client and deployment model.
3. Validate Business Accelerator Hub pages and SAP Help pages against the target release.
4. Decide which O2C artifacts should later be promoted into cross-source traceability under SCI-007.
