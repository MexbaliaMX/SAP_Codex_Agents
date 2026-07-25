# SAP Signavio S2P/P2P Pilot Process Mapping

Fecha de preparacion: 2026-07-19

## Proposito

Este mapping piloto conecta etapas locales de Source-to-Pay / Procure-to-Pay con candidatos de SAP Signavio Process Explorer, SAP Signavio Process Intelligence y value accelerators relacionados.

Este entregable no prueba acceso al workspace, licencia, API disponible, value accelerator instalado, contenido vigente, variante exacta, metricas cargadas, datos extraidos, proceso aprobado por cliente ni fit-to-standard validado.

## Archivo CSV

- `docs/deliverables/sap-signavio-s2p-p2p-pilot-process-mapping.csv`

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 8 |
| Proceso E2E local | Source-to-Pay / Procure-to-Pay |
| Filas vinculadas a Source to Pay / Procure to Pay | 7 |
| Filas con Invoice to Pay relacionable | 1 |
| Overlay Mexico local | 1 |
| Nivel de evidencia | Source-guided |
| Estado de validacion | Access/licensing/content validation pending |

## Cobertura piloto

| Etapa local S2P/P2P | Candidato Signavio |
| --- | --- |
| Supplier and master data foundation | Source to Pay master data metrics |
| Sourcing and contracts | Source to Pay / Procure to Pay sourcing and contract variant candidate |
| Requisition to purchase order | Source to Pay / PR item creation to PO item creation |
| Purchase order management and events | Procure to Pay PO lifecycle and change analysis |
| Goods receipt and service entry | Procure to Pay material inbound and service acceptance candidate |
| Supplier invoice and AP handoff | Procure to Pay / Invoice to Pay related process candidate |
| Procurement analytics and supplier performance | Procure to Pay dashboards and performance indicator candidates |
| Mexico fiscal evidence and workshop governance | Local overlay only |

## Fuentes oficiales consultadas

- SAP Signavio Process Explorer Navigation: `https://help.sap.com/docs/signavio-process-explorer/user-guide/navigation`
- Value Accelerator Library for SAP Signavio Solutions: `https://help.sap.com/docs/signavio-process-transformation-suite/value-accelerator-library/user-guide`
- Value Accelerator for Analysis of Source to Pay: `https://help.sap.com/docs/signavio-process-intelligence/accelerators/value-accelerator-for-analysis-of-source-to-pay`
- Value Accelerator for Cross-System Analysis of Source to Pay Across SAP Ariba and SAP ERP: `https://help.sap.com/docs/signavio-process-transformation-suite/getting-started-guide-plug-and-gain-approach/value-accelerator-for-analysis-of-source-to-pay-across-sap-ariba-and-sap-erp`
- Procure to Pay (SAP S/4HANA): `https://help.sap.com/docs/signavio-process-intelligence/accelerators/procure-to-pay-in-sap-s4hana`
- Procure to Pay cross-system accelerator: `https://help.sap.com/docs/signavio-process-intelligence/accelerators/cross-system-accelerator-procure-to-pay-in-sap-ariba-and-sap-s-4hana`
- Scope of Performance Indicators in Value Accelerators: `https://help.sap.com/docs/signavio-process-transformation-suite/getting-started-guide-plug-and-gain-approach/standard-performance-indicators`
- Metrics for Procure to Pay (SAP S/4HANA): `https://help.sap.com/docs/signavio-process-intelligence/reference-guide-for-value-accelerators/metrics-for-procure-to-pay-in-sap-s4hana`
- Value Accelerator for Analysis of Invoice to Pay: `https://help.sap.com/docs/signavio-process-intelligence/accelerators/value-accelerator-for-analysis-of-invoice-to-pay`

## Validaciones abiertas

- Confirmar acceso de usuario, licencia y workspace en SAP Signavio Process Transformation Suite.
- Confirmar si el value accelerator Source to Pay, Procure to Pay (SAP S/4HANA), cross-system SAP Ariba/SAP S/4HANA or Invoice to Pay esta disponible, instalado o solo explorable.
- Confirmar si SAP Ariba, SAP Business Network, central procurement, service entry and AP clearing are in scope.
- Confirmar variantes por legal entity, pais, sistema origen, release, procurement model and source-system boundary.
- Confirmar metricas disponibles, data pipelines, case ID, object model, RFC/extraction template and extraction from SAP ECC/SAP S/4HANA.
- Confirmar si hay API/export autorizado para automatizar evidencia; no asumirlo desde Process Explorer.
- Para Mexico, tratar supplier CFDI, XML/PDF/acuses, PAC/SAT, withholding/VAT, Carta Porte, DRC/eDocument and accounting trace as local overlay until validated by client owners.

## Siguientes acciones

1. Revisar este piloto con Process Architecture, Strategic Sourcing, Procurement Operations, Warehouse/Receiving, Services Procurement, AP, Finance/R2R, Tax/Localization and Signavio workspace owners.
2. Abrir SAP Signavio con usuario licenciado y validar rutas exactas de Source to Pay, Procure to Pay, cross-system Procure to Pay and Invoice to Pay.
3. Capturar evidencia aprobada del workspace antes de usarlo en Fit-to-Standard.
4. Mantener este mapping separado de `sap-content-cross-source-traceability.csv` hasta SCI-013.
