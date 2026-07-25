# SAP Signavio R2R Pilot Process Mapping

Fecha de preparacion: 2026-07-20

## Proposito

Este mapping piloto conecta etapas locales de Record-to-Report con candidatos de SAP Signavio Process Explorer, SAP Signavio Process Intelligence y value accelerators relacionados, manteniendo el alcance en cierre financiero, journal entries, clearing/reconciliacion, reporting, controles y evidencia de auditoria.

Este entregable no prueba acceso al workspace, licencia, API disponible, value accelerator instalado, contenido vigente, variante exacta, metricas cargadas, datos extraidos, proceso aprobado por cliente ni fit-to-standard validado.

## Archivo CSV

- `docs/deliverables/sap-signavio-r2r-pilot-process-mapping.csv`

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 8 |
| Proceso E2E local | Record-to-Report |
| Filas con Record to Report directo | 8 |
| Filas con boundary Invoice to Pay / Invoice to Cash | 2 |
| Overlay Mexico local | 1 |
| Nivel de evidencia | Source-guided |
| Estado de validacion | Access/licensing/content validation pending |

## Cobertura piloto

| Etapa local R2R | Candidato Signavio |
| --- | --- |
| Financial master data foundation | Record to Report master-data and posting-readiness metrics |
| Journal entry capture and verification | Record to Report journal entry / financial document metrics |
| Period-end close and recurring activities | Value Accelerator for Analysis of Record to Report Processes (Financial Closing) |
| Clearing, bank and payment operations | R2R open-item / clearing metrics with Invoice-to-Cash and Invoice-to-Pay boundary validation |
| AP/AR line-item and subledger handoff | Subledger-to-GL reconciliation candidate with R2R/S2P/O2C boundary validation |
| Financial reporting and statements | Financial closing, trial balance and reporting evidence candidate |
| Controls, substitution/validation and audit evidence | Finance change, harmonization and control-exception candidate |
| Mexico fiscal evidence and workshop governance | Local overlay only |

## Fuentes oficiales consultadas

- SAP Signavio Process Explorer Getting Started: `https://help.sap.com/docs/signavio-process-explorer/user-guide/getting-started`
- Value Accelerators in a Fit-to-Standard Scenario - Importing Content: `https://help.sap.com/docs/signavio-process-explorer/value-accelerators-in-fit-to-standard/importing-content?version=SHIP`
- SAP Signavio user/access guidance: `https://help.sap.com/docs/signavio-process-transformation-suite/user-management-authentication-and-authorization/roles-and-user-management`
- Value Accelerator for Analysis of Record to Report Processes (Financial Closing): `https://help.sap.com/docs/signavio-process-intelligence/reference-guide-for-value-accelerators/value-accelerator-for-analysis-of-record-to-report`
- Scope of Performance Indicators in Value Accelerators: `https://help.sap.com/docs/signavio-process-transformation-suite/getting-started-guide-plug-and-gain-approach/standard-performance-indicators`
- Process Performance Indicators: `https://help.sap.com/docs/signavio-process-insights/business-content-reference/process-performance-indicators`

## Hechos fuente usados con cautela

- SAP Help lista un value accelerator disponible para analisis de procesos Record to Report (Financial Closing) en SAP Signavio Process Intelligence.
- SAP Help describe el alcance del accelerator como analisis del flujo de cierre de periodo, con eventos de programas/transacciones relevantes de cierre y dashboards configurables por consultor tecnico SAP.
- SAP Help lista `KFFI001201 - Overview of financial closing activities and their run times` como indicador asociado al value accelerator Record-to-Report (Financial Closing).
- SAP Help lista otros indicadores financieros relacionables a R2R, incluyendo cambios en documentos financieros, documentos financieros creados, cambios en master data de G/L, uso de cuentas G/L y open items.
- SAP Help indica que el uso/importacion de value accelerators depende de licencia, autorizaciones, workspace y condiciones de consumo.

## Validaciones abiertas

- Confirmar acceso de usuario, licencia y workspace en SAP Signavio Process Transformation Suite.
- Confirmar si el value accelerator Record to Report (Financial Closing) esta disponible, instalado o solo explorable para el workspace objetivo.
- Confirmar region del workspace, import package, contenido vigente, dashboards creados y documentacion de template accesible.
- Confirmar source system SAP ECC/SAP S/4HANA, extraccion, data pipeline, event log, case ID y cobertura de programas/transacciones de cierre.
- Confirmar limites entre Record-to-Report, Invoice to Pay, Invoice to Cash, Source-to-Pay / Procure-to-Pay, Order-to-Cash, Treasury, Tax and GRC.
- Confirmar si hay API/export autorizado para automatizar evidencia; no asumirlo desde Process Explorer o Process Intelligence.
- Para Mexico, tratar CFDI, complemento de pago, retenciones/VAT, SAT/PAC, DRC/eDocument, tipo de cambio, evidencia bancaria, archivo/retencion, auditoria y SoD como overlay local hasta validacion por owners.

## Siguientes acciones

1. Revisar este piloto con Process Architecture, General Ledger, Financial Close, AP/AR, Treasury Operations, Finance Controls, Tax/Localization, Integration, BTP Platform, Identity/Security and Signavio workspace owners.
2. Abrir SAP Signavio con usuario licenciado y validar ruta exacta de Record to Report (Financial Closing), metricas disponibles y estado de importacion.
3. Confirmar con el owner tecnico si el accelerator se configura con SAP technical consultant, pipelines y dashboards para el sistema objetivo.
4. Mantener este mapping separado de `sap-r2r-cross-source-traceability-pilot.csv` hasta SCI-020.
