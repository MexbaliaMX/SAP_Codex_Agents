# SAP Signavio O2C Pilot Process Mapping

Fecha de preparacion: 2026-07-19

## Proposito

Este mapping piloto conecta etapas locales de Lead-to-Cash / Order-to-Cash con candidatos de SAP Signavio Process Explorer, SAP Signavio Process Intelligence y value accelerators relacionados.

Este entregable no prueba acceso al workspace, licencia, API disponible, value accelerator instalado, contenido vigente, variante exacta, metricas cargadas, datos extraidos, proceso aprobado por cliente ni fit-to-standard validado.

## Archivo CSV

- `docs/deliverables/sap-signavio-o2c-pilot-process-mapping.csv`

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 8 |
| Proceso E2E local | Lead-to-Cash / Order-to-Cash |
| Filas vinculadas a Lead to Cash | 6 |
| Filas con Invoice to Cash / AR relacionable | 2 |
| Overlay Mexico local | 1 |
| Nivel de evidencia | Source-guided |
| Estado de validacion | Access/licensing/content validation pending |

## Cobertura piloto

| Etapa local O2C | Candidato Signavio |
| --- | --- |
| Order capture | Lead to Cash / Order to Fulfill |
| Delivery / logistics | Lead to Cash / Order to Fulfill metrics |
| Billing | Lead to Cash / sales invoice metrics |
| Returns / credit-debit memo | Lead to Cash process variant candidate |
| Accounts receivable / payments | Lead to Cash / Invoice to Cash |
| Dispute / collections | Invoice to Cash / related process candidate |
| Mexico fiscal evidence | Local overlay only |
| Workshop navigation | Process Explorer linked content, variants and overlays |

## Fuentes oficiales consultadas

- SAP Signavio Process Explorer Processes: `https://help.sap.com/docs/signavio-process-explorer/user-guide/processes`
- SAP Signavio Process Explorer Navigation: `https://help.sap.com/docs/signavio-process-explorer/user-guide/navigation`
- SAP Signavio Process Explorer Getting Started: `https://help.sap.com/docs/signavio-process-explorer/user-guide/getting-started`
- Feature Scope Description of SAP Signavio Process Explorer: `https://help.sap.com/docs/SIGNAVIO_PROCESS_EXPLORER/9a01f346d571412580d84b4f5c96693e/sap-signavio-process-explorer`
- Value Accelerator for Analysis of Lead to Cash: `https://help.sap.com/docs/signavio-process-transformation-suite/getting-started-guide-plug-and-gain-approach/value-accelerator-for-analysis-of-lead-to-cash`
- Scope of Value Accelerators: `https://help.sap.com/docs/signavio-process-transformation-suite/getting-started-guide-plug-and-gain-approach/scope-of-value-accelerators`
- Required Licenses and Authorizations: `https://help.sap.com/docs/signavio-process-transformation-suite/value-accelerator-library/required-licenses-and-authorization`

## Validaciones abiertas

- Confirmar acceso de usuario, licencia y workspace en SAP Signavio Process Transformation Suite.
- Confirmar si el value accelerator Lead to Cash esta disponible, instalado o solo explorable.
- Confirmar si Invoice to Cash debe manejarse como proceso separado para AR/payments/collections.
- Confirmar variantes por industria, legal entity, pais, sistema origen y release.
- Confirmar metricas disponibles, data pipelines, case ID, object model y extraccion SAP ECC/SAP S/4HANA.
- Confirmar si hay API/export autorizado para automatizar evidencia; no asumirlo desde Process Explorer.
- Para Mexico, tratar CFDI, complemento de pago, Carta Porte, DRC/eDocument, PAC/SAT y auditoria como overlay local hasta validar contenido cliente.

## Siguientes acciones

1. Revisar este piloto con Process Architecture, Sales/Billing, Logistics, AR/Treasury, Tax/Localization and Signavio workspace owners.
2. Abrir SAP Signavio Process Explorer con usuario licenciado y validar rutas exactas de Lead to Cash, Order to Fulfill and Invoice to Cash.
3. Capturar evidencia aprobada del workspace antes de usarlo en Fit-to-Standard.
4. Mantener este mapping separado de `sap-content-cross-source-traceability.csv` hasta SCI-007.
