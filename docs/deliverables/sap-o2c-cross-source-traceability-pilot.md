# SAP O2C Cross-Source Traceability Pilot

Fecha de preparacion: 2026-07-19

## Proposito

Esta matriz piloto conecta contenido existente de SAP Fiori Apps Reference Library, SAP Business Accelerator Hub / api.sap.com, SAP Discovery Center y SAP Signavio Process Explorer para Lead-to-Cash / Order-to-Cash.

El piloto completa SCI-007 sin ingerir nuevas fuentes. Usa un grano agregado por etapa O2C para soportar revision de owners y preparacion de Fit-to-Standard.

Este entregable no prueba tenant, licenciamiento, edition, scope item oficial, communication scenario, BTP entitlement, region, service plan, workspace Signavio, value accelerator instalado, metrica disponible, configuracion Mexico ni cumplimiento legal.

## Archivo CSV

- `docs/deliverables/sap-o2c-cross-source-traceability-pilot.csv`

## Overlay Mexico relacionado

- `docs/deliverables/sap-o2c-mexico-overlay-pilot.csv`

El overlay Mexico de SCI-008 mantiene las validaciones fiscales, logisticas, contables, de auditoria y SoD separadas de la matriz cross-source. Esta separacion evita presentar los cues Mexico como evidencia tenant o cumplimiento legal.

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 8 |
| Proceso E2E | Lead-to-Cash / Order-to-Cash |
| Fuente FARL local | `sap-content-cross-source-traceability.csv` O2C subset |
| Fuente SCI-004 | Business Accelerator Hub O2C pilot inventory |
| Fuente SCI-005 | SAP Discovery Center O2C support-service pilot inventory |
| Fuente SCI-006 | SAP Signavio O2C pilot process mapping |
| Nivel de evidencia | Derived |
| Estado de validacion | Tenant, licensing, entitlement, workspace and content validation pending |

## Cobertura piloto

| Etapa O2C | Enlace cross-source |
| --- | --- |
| Customer master foundation | Customer master apps, Business Partner API, Integration Suite, Cloud Identity Services, Destination service, Lead to Cash order-capture candidate |
| Sales order capture and approval | Sales order apps, Sales Order API/events, Integration Suite, event services, identity, destination, workflow candidate, Signavio order-capture metrics |
| Delivery and logistics execution | Outbound delivery apps, Outbound Delivery API, event services, connectivity, delivery metric candidate, Carta Porte cue |
| Billing and invoice evidence | Billing apps, Billing Document API/SOAP/events, DRC/eDocument candidate, Signavio billing metrics, CFDI cue |
| Returns and credit/debit adjustments | Returns apps, return/credit/debit memo APIs, workflow/compliance candidates, returns variant candidate |
| Accounts receivable, payments and clearing | AR, clearing, bank and payment advice apps, payment/journal APIs, DRC/eDocument candidate, Invoice to Cash relationship |
| Collections, dunning and disputes | Collections, dispute and dunning apps, AR trace APIs, identity/workflow candidates, Invoice to Cash relationship |
| Workshop governance and evidence control | Aggregated validation worklist across SCI-004, SCI-005 and SCI-006 |

## Validaciones abiertas

- Confirmar scope item IDs oficiales y test scripts contra SAP Process Navigator / SAP Best Practices o tenant.
- Confirmar activacion de apps, business roles, catalogs, spaces/pages and authorizations in tenant.
- Confirmar SAP Business Accelerator Hub artifact URLs, communication scenarios, payloads, filters, events, data-volume limits and auth model.
- Confirmar SAP Discovery Center region, entitlement, service plan, pricing, quotas, missions and BTP cockpit subscription evidence.
- Confirmar SAP Signavio workspace access, licensed content, value accelerators, exact variants, metric overlays and process boundary between Lead to Cash and Invoice to Cash.
- Para Mexico, validar CFDI, complemento de pago, Carta Porte, DRC/eDocument, PAC/SAT, cancellations/reissue, accounting trace and evidence retention.

## Siguientes acciones

1. Revisar la matriz con Sales, Billing, Logistics, AR/Treasury, Tax/Localization, Integration, BTP Platform, Identity/Security and Process Architecture owners.
2. Seleccionar filas que entran a workshop Fit-to-Standard y separar las que requieren validacion tecnica previa.
3. Usar el overlay Mexico de SCI-008 como input principal del reporte SCI-009.
4. Mantener esta matriz separada de evidencia cliente hasta validar fuentes, tenant, licenciamiento y evidencia fiscal.
