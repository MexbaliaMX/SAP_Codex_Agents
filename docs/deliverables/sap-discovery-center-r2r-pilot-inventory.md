# SAP Discovery Center R2R Pilot Inventory

Fecha de preparacion: 2026-07-19

## Proposito

Este inventario piloto registra servicios SAP BTP / SAP Discovery Center candidatos para soportar Record-to-Report core.

El piloto completa SCI-018 sin abrir el universo completo de BTP. El alcance se limita a servicios soporte para integracion, eventos, identidad, conectividad, workflow/process automation, compliance/document evidence and analytics candidates.

Este entregable no prueba entitlement, region, servicio contratado, consumo, pricing, cuota, licencia, tenant, suscripcion, plan productivo, SLA, disponibilidad por hyperscaler, DRC/eDocument, PAC/SAT, Mexico fiscal evidence ni aprobacion de arquitectura.

## Archivo CSV

- `docs/deliverables/sap-discovery-center-r2r-pilot-inventory.csv`

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 11 |
| Proceso E2E | Record-to-Report |
| Nivel de evidencia | Source-guided |
| Estado de validacion | Entitlement/region/licensing validation pending |

## Cobertura piloto

| Categoria | Servicios candidatos |
| --- | --- |
| Integration | SAP Integration Suite |
| Events | SAP Integration Suite, advanced event mesh; SAP Event Mesh |
| Identity | SAP Cloud Identity Services |
| Connectivity | Destination service; SAP BTP Connectivity / Connectivity service |
| Process Automation | SAP Build Process Automation |
| Compliance | SAP Document and Reporting Compliance, cloud edition / service |
| Document Processing | Document Information Extraction |
| Analytics | SAP Analytics Cloud; SAP Datasphere |

## Fuentes oficiales usadas

| Fuente | Uso |
| --- | --- |
| [SAP Help - SAP Integration Suite](https://help.sap.com/docs/integration-suite/sap-integration-suite/configuration-guide) | Integration, API management and business event capabilities |
| [SAP Help - SAP Integration Suite, advanced event mesh](https://help.sap.com/docs/SAP_ADVANCED_EVENT_MESH/649cec0ae9ac49059564a1870fb8a1b7/b405681a132242169707c2808b5216ee.html) | Entitlement, subscription and broker-plan cues |
| [SAP Help - SAP Event Mesh](https://help.sap.com/docs/event-mesh) | Event-driven messaging candidate and plan validation cues |
| [SAP Help - SAP Cloud Identity Services](https://help.sap.com/docs/identity-authentication/identity-authentication/what-is-identity-authentication) | Identity, SSO, provisioning and authorization management |
| [SAP Help - Destination service](https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/create-and-bind-destination-service-instance) | Destination service instance and credential/configuration dependency |
| [SAP Help - SAP BTP Connectivity](https://help.sap.com/docs/connectivity) | Connectivity and Cloud Connector / on-premise access |
| [SAP Help - SAP Build Process Automation](https://help.sap.com/docs/build-process-automation/sap-build-process-automation) | Workflow, automation, decisions, task and process visibility candidates |
| [SAP Help - SAP Document and Reporting Compliance](https://help.sap.com/docs/SAP_S4HANA_CLOUD/71af4585db6d4904b1724730f3776c9b/55a418a0093b4ae6a68b4c492b472bde.html) | Compliance/eDocument/statutory reporting integration candidates |
| [SAP Help - Document Information Extraction](https://help.sap.com/docs/build-process-automation/sap-build-process-automation/document-information-extraction-process-automation) | Finance document extraction candidate and regional availability caveat |
| [SAP Help - SAP Analytics Cloud](https://help.sap.com/docs/r/product/SAP_ANALYTICS_CLOUD) | BI/planning/analytics candidate |
| [SAP Help - SAP Datasphere](https://help.sap.com/docs/SAP_DATASPHERE/d4f3c5a0bb074d09ae9b42b2b9bd7a08) | Governed data fabric / finance data warehouse candidate |

## Validaciones abiertas

- Confirmar service catalog URLs, commercial packaging, service plans, quotas, regions and availability in SAP Discovery Center.
- Confirmar BTP cockpit entitlements, subscriptions, instances, role collections, destinations and connectivity approvals.
- Confirmar portfolio choice between Advanced Event Mesh and classic Event Mesh for journal-entry events.
- Confirmar whether analytics stays in S/4HANA embedded analytics, SAP Analytics Cloud, SAP Datasphere or SAP Business Data Cloud scope.
- Confirmar whether DRC/cloud edition, Integration Suite or another approved solution owns Mexico statutory reporting and eDocument evidence.
- Confirmar whether Document Information Extraction is in scope for payment advice, invoice or custom finance evidence capture.

## Siguientes acciones

1. Revisar este inventario con General Ledger, Finance Controls, AP/AR, Treasury Operations, Integration, BTP Platform, Identity/Security, Tax/Localization and Finance Analytics owners.
2. Ejecutar SCI-019 como Signavio R2R process mapping, sin afirmar workspace, licencia, value accelerator or metric availability.
3. Mantener todos los servicios como candidatos hasta validar entitlement, region, licensing, service plan, BTP cockpit evidence and Mexico fiscal evidence.
