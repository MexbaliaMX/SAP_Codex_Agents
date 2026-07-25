# Backlog tecnico corto: integracion de contenido SAP

Fecha de preparacion: 2026-07-19

## Proposito

Definir un backlog corto para integrar contenido de SAP Fiori Apps Reference Library, SAP Business Accelerator Hub / api.sap.com, SAP Discovery Center y SAP Signavio Process Explorer dentro de la base local de conocimiento SAP E2E.

Este backlog no prueba vigencia SAP, activacion tenant, licenciamiento, disponibilidad por edition, API publica, entitlement BTP ni autorizacion Signavio. Cada fuente debe mantener trazabilidad, fecha de consulta, nivel de evidencia y validaciones pendientes.

## Alcance inicial

| Fuente | Uso objetivo | Nivel de evidencia inicial |
| --- | --- | --- |
| SAP Fiori Apps Reference Library | Apps, roles, business catalogs, componentes, releases y prerequisitos Fiori | FARL sourced |
| SAP Business Accelerator Hub / api.sap.com | APIs, eventos, integration packages, CDS views, Build content y documentacion tecnica | Source-guided |
| SAP Discovery Center | Misiones, servicios BTP, service plans, regiones, recursos y guias de adopcion | Source-guided |
| SAP Signavio Process Explorer | Procesos E2E, variantes, capabilities, procesos de industria y metricas disponibles | Source-guided |

## Backlog priorizado

| ID | Prioridad | Item tecnico | Entregable | Criterio de aceptacion |
| --- | --- | --- | --- | --- |
| SCI-001 | P0 | Definir modelo comun de contenido | Esquema CSV/Markdown con campos canonicos | Completado 2026-07-19: campos minimos definidos en `docs/templates/sap-content-common-schema.md` y CSV base creado |
| SCI-002 | P0 | Extender registro de estado de artefactos | Nueva seccion o matriz para fuentes SAP Content | Completado 2026-07-19: fuentes SAP Content registradas con owner, refresh, gaps y validacion pendiente |
| SCI-003 | P0 | Refrescar adaptador FARL existente | Script o procedimiento FARL actualizado | Completado 2026-07-19: refresh local FARL genero 456 filas, trazabilidad comun FARL-only y 8 checks de validacion pass |
| SCI-004 | P1 | Crear inventario Business Accelerator Hub | CSV inicial de APIs, eventos, packages e integraciones relevantes | Completado 2026-07-19 para piloto O2C: template creado y 12 filas Source-guided con URL, artifact type, owner, gaps y validacion pendiente |
| SCI-005 | P1 | Crear inventario Discovery Center | CSV inicial de servicios, missions y service plans relevantes | Completado 2026-07-19 para piloto O2C: template creado y 8 filas Source-guided con servicio, URL, owner, gaps y entitlement/region/licensing pendiente |
| SCI-006 | P1 | Crear mapping Signavio Process Explorer | Matriz proceso E2E local vs procesos/capabilities Signavio | Completado 2026-07-19 para piloto O2C: template creado y 8 filas Source-guided con candidato Signavio, fuente, owner, gaps y access/licensing/content pendiente |
| SCI-007 | P2 | Construir matriz de trazabilidad cross-source | `sap-o2c-cross-source-traceability-pilot.csv` | Completado 2026-07-19 para piloto O2C: template creado y 8 filas Derived agregadas por etapa, conectando FARL, SCI-004, SCI-005 y SCI-006 con validacion tenant/licensing/entitlement/workspace pendiente |
| SCI-008 | P2 | Integrar overlay Mexico | `sap-o2c-mexico-overlay-pilot.csv` | Completado 2026-07-19 para piloto O2C: template creado y 8 filas Derived ligadas a SCI-007, marcando CFDI, complemento de pago, Carta Porte, DRC/eDocument, PAC/SAT, auditoria, conciliacion contable y SoD como validacion pendiente |
| SCI-009 | P2 | Generar reporte ejecutivo de readiness | `sap-o2c-content-readiness-report.md` | Completado 2026-07-19 para piloto O2C: reporte separa hechos confirmados, supuestos, riesgos, validaciones abiertas y siguientes acciones, con decision de readiness por fuente y etapa |
| SCI-010 | P1 | Crear inventario Business Accelerator Hub para S2P/P2P | `sap-business-accelerator-hub-s2p-p2p-pilot-inventory.csv` | Completado 2026-07-19 para piloto S2P/P2P: 14 filas Source-guided para supplier master, sourcing/contracts, PR/PO, goods receipt/service entry, supplier invoice, GR/IR/AP handoff y procurement analytics, con auth/licensing pendiente |
| SCI-011 | P1 | Crear inventario Discovery Center para servicios soporte S2P/P2P | `sap-discovery-center-s2p-p2p-pilot-inventory.csv` | Completado 2026-07-19 para piloto S2P/P2P: 10 filas Source-guided para integracion, eventos, identidad, conectividad, workflow, cumplimiento/eDocument, MDI y document extraction, con entitlement/region/licensing pendiente |
| SCI-012 | P1 | Crear mapping Signavio para S2P/P2P | `sap-signavio-s2p-p2p-pilot-process-mapping.csv` | Completado 2026-07-19 para piloto S2P/P2P: 8 filas Source-guided por etapa, conectadas a SCI-010 y SCI-011, sin asumir workspace/licencia/value accelerator |
| SCI-013 | P2 | Construir matriz cross-source S2P/P2P | `sap-s2p-p2p-cross-source-traceability-pilot.csv` | Completado 2026-07-19 para piloto S2P/P2P: 8 filas Derived por etapa conectando FARL, SCI-010, SCI-011 y SCI-012, con validacion tenant/licensing/entitlement/workspace/content pendiente |
| SCI-014 | P2 | Integrar overlay Mexico S2P/P2P | `sap-s2p-p2p-mexico-overlay-pilot.csv` | Completado 2026-07-19 para piloto S2P/P2P: 8 filas Derived ligadas a SCI-013 con CFDI proveedor, retenciones/VAT, Carta Porte condicional, auditoria, conciliacion contable y SoD como validaciones pendientes |
| SCI-015 | P2 | Generar readiness report S2P/P2P | `sap-s2p-p2p-content-readiness-report.md` | Completado 2026-07-19: reporte ejecutivo consolida SCI-010 a SCI-014 y separa hechos confirmados, supuestos, riesgos, validaciones abiertas, readiness por etapa y siguientes acciones |
| SCI-016 | P1 | Crear plan de integracion R2R | `sap-r2r-content-integration-plan.md` | Completado 2026-07-19: plan define base local, cobertura FARL, alcance piloto y secuencia SCI-017 a SCI-022 |
| SCI-017 | P1 | Crear inventario Business Accelerator Hub para R2R core | `sap-business-accelerator-hub-r2r-pilot-inventory.csv` | Completado 2026-07-19 para piloto R2R: 13 filas Source-guided para master data, journal entry post/change/clearing/event, line-item/accounting trace, trial balance, bank/payment and controls, con auth/licensing pendiente |
| SCI-018 | P1 | Crear inventario Discovery Center para servicios soporte R2R | `sap-discovery-center-r2r-pilot-inventory.csv` | Completado 2026-07-19 para piloto R2R: 11 filas Source-guided para integracion, eventos, identidad, conectividad, workflow/process automation, compliance/document evidence and analytics candidates, con entitlement/region/licensing pendiente |
| SCI-019 | P1 | Crear mapping Signavio para R2R | `sap-signavio-r2r-pilot-process-mapping.csv` | Completado 2026-07-20 para piloto R2R: 8 filas Source-guided por etapa, conectadas a SCI-017 y SCI-018, con Record to Report Financial Closing accelerator como candidato y access/licensing/content pendiente |
| SCI-020 | P2 | Construir matriz cross-source R2R | `sap-r2r-cross-source-traceability-pilot.csv` | Completado 2026-07-20 para piloto R2R: 8 filas Derived por etapa conectando FARL, SCI-017, SCI-018 y SCI-019, con validacion tenant/licensing/entitlement/workspace/content pendiente |
| SCI-021 | P2 | Integrar overlay Mexico R2R | `sap-r2r-mexico-overlay-pilot.csv` | Completado 2026-07-20 para piloto R2R: 8 filas Derived ligadas a SCI-020 con CFDI/complemento carry-forward, retenciones/VAT, tipo de cambio, bancos, conciliacion contable, evidencia fiscal, archivo/retencion, auditoria y SoD como validaciones pendientes |
| SCI-022 | P2 | Generar readiness report R2R | `sap-r2r-content-readiness-report.md` | Completado 2026-07-20: reporte ejecutivo consolida SCI-017 a SCI-021 y separa hechos confirmados, supuestos, riesgos, validaciones abiertas, readiness por etapa y siguientes acciones |

## Definicion de listo

- No se guardan credenciales, tokens, cookies, tenant URLs privados ni datos de cliente.
- Cada fuente incluye URL o referencia local, fecha de consulta y nivel de evidencia.
- Los datos derivados no se presentan como prueba productiva.
- Las filas con impacto en licenciamiento, edition, pais, industria, seguridad o tenant quedan marcadas como validacion pendiente.
- Los cambios regeneran o actualizan el registro de estado antes de usarse en discovery formal o Fit-to-Standard.

## Primer sprint sugerido

| Semana | Objetivo | Items |
| --- | --- | --- |
| 1 | Base de gobierno | SCI-001, SCI-002 |
| 1 | FARL refresh controlado | SCI-003 |
| 2 | Inventarios externos iniciales | SCI-004, SCI-005 |
| 2 | Proceso y trazabilidad | SCI-006, SCI-007 |
| 3 | Mexico y reporte ejecutivo | SCI-008, SCI-009 |
| 4 | Segunda ola S2P/P2P | SCI-010, SCI-011, SCI-012 |
| 5 | Trazabilidad y readiness S2P/P2P | SCI-013, SCI-014, SCI-015 |
| 6 | Tercera ola R2R | SCI-016, SCI-017, SCI-018, SCI-019 |
| 7 | Trazabilidad y readiness R2R | SCI-020, SCI-021, SCI-022 |

## Riesgos y controles

| Riesgo | Control |
| --- | --- |
| Confundir contenido publico con disponibilidad productiva | Mantener `EvidenceLevel` y `ValidationStatus` obligatorios |
| Cambios de SAP en releases, APIs o contenido | Refresh fechado y registro de gaps |
| Uso de API o contenido que requiere login/licencia | Marcar como `Auth/licensing validation pending` |
| Mapeo incorrecto entre procesos, scope items y apps | Validar con SAP Process Navigator, SAP Best Practices o tenant |
| Mexico fiscal tratado como generico | Revisar CFDI, complemento de pago, Carta Porte, DRC/eDocument, PAC/SAT y evidencia contable cuando aplique |

## Siguientes acciones inmediatas

1. Revisar `sap-o2c-content-readiness-report.md` con owners de Sales, Billing, Logistics, AR/Treasury, Integration, BTP Platform, Identity/Security, Tax/Localization y Process Architecture.
2. Revisar `sap-s2p-p2p-content-readiness-report.md` con owners de Supplier Master, Strategic Sourcing, Procurement, Receiving, Services Procurement, AP, R2R, Integration, BTP Platform, Identity/Security, Tax/Localization y Process Architecture.
3. Revisar `sap-r2r-content-readiness-report.md` con owners de General Ledger, Financial Close, AP/AR, Treasury Operations, Finance Controls, Reporting/Analytics, Integration, BTP Platform, Identity/Security, Tax/Localization, Signavio y PMO.
4. Convertir filas Critical de overlays Mexico O2C, S2P/P2P y R2R en escenarios de prueba con evidencia minima requerida.
5. Definir criterio de promocion de filas piloto a matriz cliente-especifica con evidencia tenant/licensing/entitlement/workspace/fiscal.
6. Mantener nuevas ingestas fuera de alcance hasta cerrar owner review y validaciones criticas de cada piloto.
