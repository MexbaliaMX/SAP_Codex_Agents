# SAP O2C Mexico Overlay Pilot

Fecha de preparacion: 2026-07-19

## Proposito

Este overlay Mexico completa SCI-008 sobre las 8 filas del piloto cross-source de Order-to-Cash. El objetivo es marcar cues fiscales, logisticos, contables, de auditoria y SoD que deben validarse antes de usar la matriz en Fit-to-Standard, diseno tecnico o decision de alcance.

Este entregable no es asesoria legal o fiscal. No prueba cumplimiento Mexico, configuracion tenant, CFDI emitido, complemento de pago, Carta Porte, PAC/SAT, DRC/eDocument, integracion productiva, almacenamiento XML/PDF/acuses, autorizaciones ni retencion documental.

## Archivo CSV

- `docs/deliverables/sap-o2c-mexico-overlay-pilot.csv`

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 8 |
| Proceso E2E | Lead-to-Cash / Order-to-Cash |
| Base de trazabilidad | `sap-o2c-cross-source-traceability-pilot.csv` |
| Nivel de evidencia | Derived |
| Estado de validacion | Mexico fiscal/tenant validation pending |
| Riesgo Critical | 4 |
| Riesgo High | 4 |

## Cobertura por etapa

| Etapa O2C | Aplicabilidad Mexico | Principales cues |
| --- | --- | --- |
| Customer master foundation | Indirect | RFC/tax ID, datos fiscales, auditoria, SoD |
| Sales order capture and approval | Indirect | Determinacion fiscal, aprobaciones, SoD, impacto downstream CFDI/Carta Porte |
| Delivery and logistics execution | Conditional | Carta Porte, goods movement evidence, transport audit |
| Billing and invoice evidence | Direct | CFDI, DRC/eDocument, PAC/SAT, XML/PDF, acuse/status, cancelacion, accounting trace |
| Returns and credit/debit adjustments | Direct | Cancelacion/reemision CFDI, notas de credito/debito, aprobaciones, inventario/contabilidad |
| Accounts receivable, payments and clearing | Direct | Complemento de pago, clearing, bancos, PAC/SAT, conciliacion contable |
| Collections, dunning and disputes | Conditional | Evidencia de disputa/cobranza, correcciones fiscales, SoD, reconciliacion AR |
| Workshop governance and evidence control | Governance | RACI, repositorio de evidencia, muestras, validaciones, sign-off |

## Validaciones abiertas

- Confirmar legal entity Mexico, country version, localization scope, tax procedure, output management and DRC/eDocument scope.
- Confirmar que escenarios emiten, cancelan, sustituyen o complementan CFDI, y donde se almacenan XML/PDF/acuses/status.
- Confirmar PAC/SAT/PAC ownership, monitoreo, contingencia, retencion de evidencia y manejo de errores.
- Confirmar Carta Porte solo para escenarios de transporte donde aplique; no asumirlo para toda entrega.
- Confirmar complemento de pago por metodo de pago, clearing, bancos, moneda y excepciones.
- Confirmar trazabilidad contable desde billing/payment/clearing hasta accounting document and reporting evidence.
- Confirmar roles, catalogs, communication users, BTP access and SoD across Sales, Billing, Logistics, AR, Tax and Integration.

## Siguientes acciones

1. Revisar las 8 filas con Tax/Localization, Sales/Billing, Logistics, AR/Treasury, Integration, Security and PMO owners.
2. Convertir los cues Critical en escenarios de prueba con evidencia minima requerida.
3. Usar este overlay como input principal de SCI-009 readiness report.
4. No promover ningun cue a validado hasta contar con evidencia tenant, fiscal owner sign-off y trazabilidad documental.
