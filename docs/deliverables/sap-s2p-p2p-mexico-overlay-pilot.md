# SAP S2P/P2P Mexico Overlay Pilot

Fecha de preparacion: 2026-07-19

## Proposito

Este overlay Mexico marca cues fiscales, logisticos, contables, de auditoria y SoD sobre la matriz cross-source Source-to-Pay / Procure-to-Pay de SCI-013.

El piloto completa SCI-014 sin afirmar cumplimiento legal, configuracion tenant, activacion de DRC/eDocument, integracion PAC/SAT, vigencia fiscal aplicable a una entidad legal especifica ni aprobacion productiva.

## Archivo CSV

- `docs/deliverables/sap-s2p-p2p-mexico-overlay-pilot.csv`

## Fuente de trazabilidad

- `docs/deliverables/sap-s2p-p2p-cross-source-traceability-pilot.csv`

## Fuentes externas de referencia

Estas fuentes se usaron solo para orientar los cues. No sustituyen validacion fiscal, legal, tenant o contractual.

| Fuente | Uso en el overlay |
| --- | --- |
| [SAP Help - Document and Reporting Compliance para Mexico](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/835ce9e19dfb46b5b4e3b48d76eb00a7/85ebbf5d8ad849a7977f239ba940deb1.html) | Referencia general para eDocument/DRC y procesamiento de documentos electronicos |
| [SAP Help - Receiving Electronic Supplier Invoices Using SAP Document and Reporting Compliance, cloud edition](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/c30311a28bc24fe08bd47eafbf3fd930/2b7f809575154e56a62492ff3beffafc.html) | Referencia para received supplier invoice/eDocument validation candidates |
| [SAT - CFDI version 4.0 / Anexo 20](https://wwwmat.sat.gob.mx/cs/Satellite?c=ConsultaInfo&childpagename=SatTyR%2FConsultaInfo%2FSAT_LandingConsultaInformacion&cid=1462228635025&packedargs=d%3DTouch&pagename=TySWrapper) | Referencia de CFDI, XML y estructura fiscal a validar con Tax |
| [SAT - Complemento Carta Porte](https://wwwmatnp.sat.gob.mx/consultas/68823/complemento-carta-porte-) | Referencia para marcar Carta Porte como cue condicional de transporte de bienes o mercancias |
| [SAT - Cancelacion de facturas](https://www.sat.gob.mx/minisitio/Factura/cancela_procesocancelacion.htm) | Referencia para marcar cancelacion, sustitucion, aceptacion/rechazo y evidencia de estatus como validaciones abiertas |

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 8 |
| Proceso E2E | Source-to-Pay / Procure-to-Pay |
| Fuente base | SCI-013 cross-source traceability |
| Nivel de evidencia | Derived |
| Estado de validacion | Mexico fiscal/tenant validation pending |

## Cobertura piloto

| Etapa S2P/P2P | Cues Mexico |
| --- | --- |
| Supplier and master data foundation | RFC/tax ID, withholding/VAT, supplier fiscal master data, bank-data governance, audit and SoD |
| Sourcing and contracts | Supplier governance, contract audit, tax/withholding terms, approvals and downstream PO/invoice controls |
| Requisition and purchase order | Account assignment, tax input validation, approval evidence, downstream CFDI/Carta Porte relevance and SoD |
| Goods receipt and service entry | Goods movement evidence, service acceptance, Carta Porte conditional, invoice match, cancellation/reversal and SoD |
| Supplier invoice and exceptions | Supplier CFDI, XML/PDF/acuses, SAT/PAC status, DRC/eDocument, withholding/VAT, blocked invoice and accounting trace |
| GR/IR and AP handoff | GR/IR reconciliation, supplier CFDI status carry-forward, accounting trace, reversal handling and AP/R2R boundary |
| Procurement analytics and supplier performance | Audit reporting, supplier evidence, policy controls, tax-code visibility and analytics access controls |
| Workshop governance and evidence control | Scenario scoping, evidence repository, owner RACI, DRC/PAC/SAT validation method, Carta Porte decision tree and SoD review |

## Validaciones abiertas

- Confirmar Mexico legal entity, country version, tax procedure, DRC/eDocument scope, PAC/SAT flow, supplier invoice intake and evidence retention.
- Confirmar si supplier invoice CFDI validation is handled in S/4HANA, DRC/eDocument, external PAC/SAT service, AP shared service or another approved solution.
- Confirmar withholding/VAT, tax code, account assignment and supplier fiscal master-data requirements with Tax/Localization.
- Confirmar Carta Porte applicability only for relevant inbound, return, stock transfer or transport scenarios.
- Confirmar GR/IR, AP open item, accounting document and R2R handoff evidence.
- Confirmar role/catalog access, communication users, BTP services, DRC/eDocument access, Signavio workspace access and SoD risks.

## Siguientes acciones

1. Revisar este overlay con Tax/Localization, Supplier Master, Strategic Sourcing, Procurement Operations, Warehouse/Receiving, Services Procurement, AP, Finance/R2R, Integration, BTP Platform, Identity/Security and PMO owners.
2. Seleccionar escenarios Mexico para evidencia minima: supplier master, PR/PO approval, GR/SES, supplier invoice CFDI, blocked invoice, GR/IR/AP handoff and analytics exception reporting.
3. Documentar out-of-scope decisions for payment execution, Treasury, SAP Ariba, SAP Business Network, OCR/document extraction and external tax engines unless project evidence brings them into scope.
4. Usar este overlay como input principal para SCI-015 readiness report.
