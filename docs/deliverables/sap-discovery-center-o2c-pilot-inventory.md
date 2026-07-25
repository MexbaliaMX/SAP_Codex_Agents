# SAP Discovery Center O2C Pilot Inventory

Fecha de preparacion: 2026-07-19

## Proposito

Este inventario piloto identifica servicios soporte de SAP Discovery Center / SAP BTP para Lead-to-Cash / Order-to-Cash. Se conecta al piloto SCI-004 de SAP Business Accelerator Hub, pero no abre una ingesta general del catalogo BTP.

Este entregable no prueba entitlement, region, licencia, plan, cuota, pricing, contrato, tenant, suscripcion, SLA, service key, conexion, destination, Event Mesh/AEM broker, Identity tenant ni cumplimiento Mexico productivo.

## Archivo CSV

- `docs/deliverables/sap-discovery-center-o2c-pilot-inventory.csv`

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 8 |
| Proceso E2E | Lead-to-Cash / Order-to-Cash |
| Servicios de integracion/eventos | 3 |
| Servicios de identidad/conectividad | 3 |
| Servicios de workflow/cumplimiento | 2 |
| Nivel de evidencia | Source-guided |
| Estado de validacion | Entitlement/region/licensing validation pending |

## Cobertura piloto

| Area soporte O2C | Servicios candidatos |
| --- | --- |
| Integracion API/A2A/B2B | SAP Integration Suite |
| Eventos | SAP Integration Suite, advanced event mesh; SAP Event Mesh |
| Identidad y acceso | SAP Cloud Identity Services |
| Conectividad | Destination service; SAP BTP Connectivity / Connectivity service |
| Aprobaciones/excepciones | SAP Build Process Automation |
| Mexico fiscal/eDocument | SAP Document and Reporting Compliance service / eDocument Mexico |

## Fuentes oficiales consultadas

- SAP Discovery Center service URLs are captured per row under `DiscoveryCenterUrl`.
- SAP Help Portal references are captured per row under `OfficialHelpUrl`.

## Validaciones abiertas

- Confirmar cada servicio en SAP Discovery Center con region, commercial model, service plan, pricing, quotas and available missions.
- Confirmar entitlements and subscriptions in the target BTP global account/subaccount.
- Confirmar whether SAP Event Mesh classic, SAP Integration Suite advanced event mesh, or another approved event capability is the target for new O2C event scenarios.
- Confirmar identity tenant, trust, role collections, provisioning and MFA/security policies.
- Confirmar destination/connectivity architecture, Cloud Connector/private endpoint, principal propagation and credential handling.
- Confirmar whether approvals belong in SAP S/4HANA standard workflow, SAP Build Process Automation, SAP Task Center or another approved workflow tool.
- Para Mexico, confirmar DRC/eDocument, CFDI, complemento de pago, Carta Porte, PAC/SAT, cancellation/reissue, accounting trace and evidence retention.

## Siguientes acciones

1. Revisar el piloto con Integration, BTP Platform, Identity/Security, Sales/Billing, AR/Treasury and Tax/Localization owners.
2. Validar region y service plan en SAP Discovery Center y BTP cockpit para cada fila.
3. Identificar cuales servicios son obligatorios, opcionales o fuera de alcance para el escenario O2C objetivo.
4. Mantener todas las filas como `Source-guided` hasta contar con evidencia tenant/contrato.
