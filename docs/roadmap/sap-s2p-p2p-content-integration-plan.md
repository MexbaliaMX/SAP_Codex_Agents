# Source-to-Pay / Procure-to-Pay Content Integration Plan

Fecha de preparacion: 2026-07-19

## Proposito

Definir la siguiente ola controlada de integracion E2E para Source-to-Pay / Procure-to-Pay, reutilizando el patron probado en Order-to-Cash sin abrir ingesta masiva ni afirmar disponibilidad productiva.

Este plan no prueba vigencia SAP, tenant, licenciamiento, entitlement BTP, APIs, eventos, Signavio, DRC/eDocument, PAC/SAT, Carta Porte, retenciones, impuestos ni cumplimiento fiscal Mexico.

## Base local disponible

| Base | Estado | Observacion |
| --- | --- | --- |
| FARL / Fiori local | Disponible | 57 filas en `sap-content-cross-source-traceability.csv` para Source-to-Pay / Procure-to-Pay |
| Inventario Fiori P2P/S2P | Disponible | `s4hana-fiori-p2p-s2p-app-inventory.md` cubre sourcing, PR, PO, goods receipt, services, supplier invoice, GR/IR, analytics and supplier performance |
| Business Accelerator Hub P2P | Disponible | SCI-010 creo inventario piloto Source-guided con 14 filas y validacion auth/licensing pendiente |
| Discovery Center / BTP P2P | Disponible | SCI-011 creo inventario piloto Source-guided con 10 servicios soporte y entitlement/region/licensing pendiente |
| Signavio P2P | Disponible | SCI-012 creo mapping piloto Source-guided con 8 filas y access/licensing/content pendiente |
| Cross-source P2P | Disponible | SCI-013 creo matriz agregada por etapa conectando FARL, SCI-010, SCI-011 y SCI-012 |
| Mexico overlay P2P | Disponible | SCI-014 creo overlay Mexico ligado a SCI-013 con cues fiscales, logisticos, contables, auditoria y SoD |
| Readiness P2P | Disponible | SCI-015 creo reporte ejecutivo consolidando SCI-010 a SCI-014 |

## Cobertura FARL local

| Agrupacion local | Filas FARL |
| --- | ---: |
| Sourcing, supplier management and contracts | 15 |
| Goods receipt, service entry and logistics evidence | 12 |
| Operational procurement and approvals | 11 |
| Procurement analytics and spend control | 10 |
| Invoice management and AP handoff | 9 |
| Total | 57 |

## Alcance piloto recomendado

Mantener el piloto en Source-to-Pay / Procure-to-Pay core, sin extender todavia a una transformacion Ariba completa ni a Business Network salvo que las fuentes oficiales y el owner review lo soporten.

| Etapa piloto | Incluye | Validaciones Mexico principales |
| --- | --- | --- |
| Supplier and master data foundation | Supplier/BP/product master, tax data, approval/change evidence | RFC/tax ID, withholding/VAT, supplier evidence, SoD |
| Sourcing and contracts | RFQ, quotations, sourcing project candidates, purchase contracts, source lists/info records | Contract audit, supplier governance, approvals |
| Requisition and purchase order | Purchase requisitions, approvals, purchase orders, confirmations | SoD, approval evidence, tax/account assignment inputs |
| Goods receipt and service entry | Goods receipt, service entry sheets, inventory movement, receiving confirmations | Goods movement evidence, service acceptance, Carta Porte only if transport scenario applies |
| Supplier invoice and exceptions | Supplier invoices, blocked invoices, ERS, GR/IR, invoice verification | CFDI supplier invoice evidence, XML/PDF/acuses, PAC/SAT validation, tax code, withholding, accounting trace |
| AP handoff and payment readiness | GR/IR clearing, AP open item handoff, payment proposal dependency | Accounting reconciliation, payment evidence, SoD, R2R handoff |
| Procurement analytics and supplier performance | Spend, off-contract spend, supplier evaluation, delivery performance | Audit reporting, policy controls, supplier evidence |
| Workshop governance | Owner review, validation checklist, promotion criteria | Fiscal owner sign-off, evidence repository, decision log |

## Nueva ola de backlog

| ID | Prioridad | Item tecnico | Entregable | Criterio de aceptacion |
| --- | --- | --- | --- | --- |
| SCI-010 | P1 | Crear inventario Business Accelerator Hub para S2P/P2P | `sap-business-accelerator-hub-s2p-p2p-pilot-inventory.csv` | Completado 2026-07-19: 14 filas Source-guided limitadas a APIs/eventos/artefactos P2P core, con URL, owner, gaps y auth/licensing pendiente |
| SCI-011 | P1 | Crear inventario Discovery Center para servicios soporte S2P/P2P | `sap-discovery-center-s2p-p2p-pilot-inventory.csv` | Completado 2026-07-19: 10 servicios soporte Source-guided, con entitlement/region/licensing pendiente |
| SCI-012 | P1 | Crear mapping Signavio para S2P/P2P | `sap-signavio-s2p-p2p-pilot-process-mapping.csv` | Completado 2026-07-19: mapping Source-guided por etapas P2P, sin afirmar workspace/licencia/value accelerator |
| SCI-013 | P2 | Construir matriz cross-source S2P/P2P | `sap-s2p-p2p-cross-source-traceability-pilot.csv` | Completado 2026-07-19: 8 filas Derived por etapa conectando FARL, SCI-010, SCI-011 y SCI-012, con validacion pendiente |
| SCI-014 | P2 | Integrar overlay Mexico S2P/P2P | `sap-s2p-p2p-mexico-overlay-pilot.csv` | Completado 2026-07-19: 8 filas Derived ligadas a SCI-013 con cues CFDI proveedor, retenciones/VAT, Carta Porte condicional, auditoria, conciliacion contable y SoD pendientes |
| SCI-015 | P2 | Generar readiness report S2P/P2P | `sap-s2p-p2p-content-readiness-report.md` | Completado 2026-07-19: reporte separa hechos confirmados, supuestos, riesgos, validaciones abiertas, readiness por etapa y siguientes acciones |

## Reglas de control

- No abrir ingesta masiva de Business Accelerator Hub, Discovery Center o Signavio.
- No asumir SAP Ariba, SAP Business Network, DRC/eDocument, supplier invoice automation, OCR, payment automation o tax engine sin evidencia fuente.
- Mantener cada fila como `Source-guided` o `Derived` hasta contar con evidencia tenant/licensing/entitlement/workspace/fiscal.
- Tratar Mexico como overlay de validacion, no como cumplimiento confirmado.
- Revisar owner boundaries entre Source-to-Pay, Procure-to-Pay, Record-to-Report y Treasury antes de promover filas.

## Siguiente accion

Revisar `sap-s2p-p2p-content-readiness-report.md` con owners y convertir filas Critical Mexico en escenarios de prueba con evidencia minima requerida.
