# SAP R2R Cross-Source Traceability Pilot

Fecha de preparacion: 2026-07-20

## Proposito

Esta matriz piloto conecta contenido local ya inventariado de SAP Fiori Apps Reference Library, SAP Business Accelerator Hub / api.sap.com, SAP Discovery Center y SAP Signavio para Record-to-Report.

El piloto completa SCI-020 sin abrir nuevas fuentes ni ampliar el alcance a Treasury avanzado, Group Reporting, GRC, tax engine externo, data lake o cierre global complejo. Usa un grano agregado por etapa para soportar revision de owners y preparacion de Fit-to-Standard.

Este entregable no prueba tenant, licenciamiento, edition, scope item oficial, communication scenario, BTP entitlement, region, service plan, workspace Signavio, value accelerator instalado, metrica disponible, configuracion Mexico ni cumplimiento legal.

## Archivo CSV

- `docs/deliverables/sap-r2r-cross-source-traceability-pilot.csv`

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 8 |
| Proceso E2E | Record-to-Report |
| Fuente FARL local | `sap-content-cross-source-traceability.csv` R2R subset |
| Fuente SCI-017 | Business Accelerator Hub R2R pilot inventory |
| Fuente SCI-018 | SAP Discovery Center R2R support-service pilot inventory |
| Fuente SCI-019 | SAP Signavio R2R pilot process mapping |
| Nivel de evidencia | Derived |
| Estado de validacion | Tenant, licensing, entitlement, workspace and content validation pending |

## Cobertura piloto

| Etapa R2R | FARL | SCI-017 | SCI-018 | SCI-019 |
| --- | --- | --- | --- | --- |
| Financial master data foundation | G/L and bank master apps | G/L account and bank detail APIs | Identity, destination and data-fabric candidates | R2R master-data metrics |
| Journal entry capture and verification | Journal entry, upload and verification apps | Journal entry post/change/event candidates | Integration, eventing, identity, destination and workflow candidates | R2R financial-document metrics |
| Period-end close and recurring activities | GL/AP/AR jobs, recurring journals and FX valuation | Journal posting/event, line-item, trial balance and control candidates | Integration, identity, workflow and analytics candidates | R2R Financial Closing accelerator |
| Clearing, bank and payment operations | Payments, bank, bank statements, clearing and payment media apps | Bank detail, clearing and payment advice candidates | Integration, connectivity, workflow, compliance and document extraction candidates | R2R open-item and clearing metrics |
| AP/AR line-item and subledger handoff | Supplier/customer line items, dunning and correspondence apps | Journal item, GL line item, operational accounting item and payment advice candidates | Integration, connectivity, DRC, SAC and Datasphere candidates | R2R / Invoice-to-Pay / Invoice-to-Cash boundary metrics |
| Financial reporting and statements | Balance sheet, income statement and trial balance apps | GL line item, operational item and trial balance candidates | DRC, SAC and Datasphere candidates | R2R financial closing/reporting metrics |
| Controls, substitution/validation and audit evidence | Verification, workflow, teams, substitution/validation and logging apps | Journal change/event and substitution/validation control candidates | Identity, workflow and analytics candidates | R2R control and change indicators |
| Workshop governance and Mexico evidence control | Full 36-row FARL R2R subset as reference | Full SCI-017 R2R inventory as reference | Full SCI-018 R2R service inventory as reference | Full SCI-019 R2R Signavio mapping as reference |

## Hechos derivados

- La base FARL local contiene 36 filas Record-to-Report, con app, catalogo, proceso local y validacion tenant pendiente.
- SCI-017 contiene 13 candidatos R2R de SAP Business Accelerator Hub / SAP Help, todos Source-guided y con auth/licensing pendiente.
- SCI-018 contiene 11 servicios soporte BTP/Discovery Center para R2R, todos Source-guided y con entitlement/region/licensing pendiente.
- SCI-019 contiene 8 mappings Signavio R2R, todos Source-guided y con access/licensing/content pendiente.
- SCI-020 agrega esas fuentes por etapa de negocio; no crea evidencia nueva de tenant, licenciamiento, entitlement, workspace o cumplimiento Mexico.

## Validaciones abiertas

- Confirmar apps FARL activas en tenant, roles, catalogs, spaces/pages, edition, scope item oficial y visibilidad launchpad.
- Confirmar APIs, SOAP services, eventos, CDS/read services, communication scenarios, payloads, filtros, volumen y autorizaciones.
- Confirmar BTP entitlements, regiones, service plans, quotas, pricing, destinations, connectivity, identity and operations ownership.
- Confirmar workspace SAP Signavio, licencia, value accelerator Record to Report (Financial Closing), metricas visibles, event log, case ID and extraction pipeline.
- Confirmar limites con Order-to-Cash, Source-to-Pay / Procure-to-Pay, Treasury, Tax, GRC, Group Reporting and analytics architecture.
- Para Mexico, tratar CFDI, complemento de pago, retenciones/VAT, SAT/PAC, DRC/eDocument, tipo de cambio, evidencia bancaria, archivo/retencion, auditoria and SoD as local overlay until SCI-021 and owner validation.

## Siguientes acciones

1. Revisar esta matriz con General Ledger, Financial Close, AP/AR, Treasury Operations, Finance Controls, Tax/Localization, Integration, BTP Platform, Identity/Security, Finance Analytics and Signavio workspace owners.
2. Seleccionar filas candidatas para validacion tenant/workspace y no promover ninguna fila agregada sin evidencia por fuente.
3. Ejecutar SCI-021 Mexico overlay R2R usando `SCI-R2R-XTRACE-*` como llave de trazabilidad.
4. Mantener SCI-022 readiness report bloqueado hasta cerrar el overlay Mexico y owner review minimo.
