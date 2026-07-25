# SAP Discovery Center S2P/P2P Pilot Inventory

Fecha de preparacion: 2026-07-19

## Proposito

Este inventario piloto identifica servicios soporte de SAP Discovery Center / SAP BTP para Source-to-Pay / Procure-to-Pay. Se conecta al piloto SCI-010 de SAP Business Accelerator Hub, pero no abre una ingesta general del catalogo BTP.

Este entregable no prueba entitlement, region, licencia, plan, cuota, pricing, contrato, tenant, suscripcion, SLA, service key, conexion, destination, Event Mesh/AEM broker, Identity tenant, DRC/eDocument, Document Information Extraction, MDI ni cumplimiento Mexico productivo.

## Archivo CSV

- `docs/deliverables/sap-discovery-center-s2p-p2p-pilot-inventory.csv`

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 10 |
| Proceso E2E | Source-to-Pay / Procure-to-Pay |
| Servicios de integracion/eventos | 3 |
| Servicios de identidad/conectividad | 3 |
| Servicios de workflow/cumplimiento/documentos/master data | 4 |
| Nivel de evidencia | Source-guided |
| Estado de validacion | Entitlement/region/licensing validation pending |

## Cobertura piloto

| Area soporte S2P/P2P | Servicios candidatos |
| --- | --- |
| Integracion API/A2A/B2B | SAP Integration Suite |
| Eventos | SAP Integration Suite, advanced event mesh; SAP Event Mesh |
| Identidad y acceso | SAP Cloud Identity Services |
| Conectividad | Destination service; SAP BTP Connectivity / Connectivity service |
| Aprobaciones/excepciones | SAP Build Process Automation |
| Mexico fiscal/eDocument | SAP Document and Reporting Compliance service / eDocument Mexico |
| Supplier master integration | SAP Master Data Integration |
| Supplier invoice/document capture | Document Information Extraction |

## Fuentes oficiales consultadas

- SAP Discovery Center service URLs are captured per row under `DiscoveryCenterUrl`.
- SAP Help Portal references are captured per row under `OfficialHelpUrl`.

## Validaciones abiertas

- Confirmar cada servicio en SAP Discovery Center con region, commercial model, service plan, pricing, quotas and available missions.
- Confirmar entitlements and subscriptions in the target BTP global account/subaccount.
- Confirmar si SAP Event Mesh classic, SAP Integration Suite advanced event mesh, or another approved event capability is the target for procurement events.
- Confirmar identity tenant, trust, role collections, provisioning and MFA/security policies.
- Confirmar destination/connectivity architecture, Cloud Connector/private endpoint, principal propagation and credential handling.
- Confirmar whether approvals belong in SAP S/4HANA standard workflow, SAP Build Process Automation, SAP Task Center or another approved workflow tool.
- Confirmar whether SAP Master Data Integration is in scope; do not assume SAP Ariba, SAP Business Network or supplier data replication.
- Confirmar whether Document Information Extraction is in scope for supplier invoice or procurement document capture; do not assume OCR automation.
- Para Mexico, confirmar DRC/eDocument, supplier CFDI, XML/PDF/acuses, PAC/SAT, withholding/VAT, Carta Porte only when logistics applies, GR/IR, accounting trace and evidence retention.

## Siguientes acciones

1. Revisar el piloto con Procurement, Strategic Sourcing, Warehouse/Receiving, Services Procurement, AP, Finance/R2R, Tax/Localization, Integration, BTP Platform and Identity/Security owners.
2. Validar region y service plan en SAP Discovery Center y BTP cockpit para cada fila.
3. Identificar cuales servicios son obligatorios, opcionales o fuera de alcance para el escenario S2P/P2P objetivo.
4. Mantener todas las filas como `Source-guided` hasta contar con evidencia tenant/contrato.
5. Usar este inventario como input para SCI-012 Signavio mapping and later SCI-013 cross-source traceability.
