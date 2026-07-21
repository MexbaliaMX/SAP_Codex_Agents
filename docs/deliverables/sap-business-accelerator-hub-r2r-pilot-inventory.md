# SAP Business Accelerator Hub R2R Pilot Inventory

Fecha de preparacion: 2026-07-19

## Proposito

Este inventario piloto registra artefactos SAP Business Accelerator Hub / api.sap.com y SAP Help candidatos para Record-to-Report core.

El piloto completa SCI-017 sin abrir ingesta masiva. El alcance se limita a financial master data, journal entry posting/change/clearing, journal entry events, line-item/accounting trace, trial balance, bank/payment evidence and posting controls.

Este entregable no prueba activacion tenant, licenciamiento, autorizaciones, communication arrangements, payloads, event enablement, edition, scope item oficial, DRC/eDocument, SAT/PAC, Mexico fiscal evidence, cierre contable ni aprobacion productiva.

## Archivo CSV

- `docs/deliverables/sap-business-accelerator-hub-r2r-pilot-inventory.csv`

## Resumen

| Metrica | Valor |
| --- | ---: |
| Filas piloto | 13 |
| Proceso E2E | Record-to-Report |
| APIs | 7 |
| SOAP services | 4 |
| Events | 1 |
| Documentation/control references | 1 |
| Nivel de evidencia | Source-guided |
| Estado de validacion | Auth/licensing validation pending |

## Cobertura piloto

| Etapa R2R | Artefactos candidatos |
| --- | --- |
| Financial master data foundation | G/L Account - Read; Bank Details - Read |
| Journal entry capture and verification | Journal Entry - Post synchronous/asynchronous; Journal Entry - Change; Journal Entry Event |
| Period-end close and recurring activities | Trial balance and line-item evidence candidates; close jobs remain FARL/app validation, not BAH-confirmed |
| Clearing, bank and payment operations | Journal Entry - Clearing; Payment Advice; Bank Details |
| AP/AR line-item and subledger handoff | Journal Entry Item - Read; Operational Journal Entry Item - Read; G/L Account Line Items |
| Financial reporting and statements | Trial Balance - Read; G/L Account Line Items |
| Controls, substitution/validation and audit evidence | Manage Substitution/Validation Rules as control reference, not API claim |

## Fuentes oficiales usadas

| Fuente | Uso |
| --- | --- |
| [SAP Help - APIs for General Ledger Accounting](https://help.sap.com/docs/SAP_S4HANA_CLOUD/b978f98fc5884ff2aeb10c8fdeb8a43b/e6c0a161b1874c47b5de2519917d0a8d-39.html) | Lista de APIs, technical names, protocols and communication scenarios |
| [SAP Help - Journal Entry - Post Asynchronous](https://help.sap.com/docs/SAP_S4HANA_CLOUD/b978f98fc5884ff2aeb10c8fdeb8a43b/22a267e571e948499fda007a65b27c64.html) | JournalEntryBulkCreationRequest_In and AIF/reprocessing cues |
| [SAP Help - Make Postings Using SOAP API Services](https://help.sap.com/docs/SAP_S4HANA_CLOUD/6979f136cfdc43598247b086991fc443/98b1951d13f34e4cbe3f2765c81d5f2d.html) | SAP_COM_0002 and synchronous/asynchronous posting API context |
| [SAP Help - Journal Entry - Change Asynchronous](https://help.sap.com/docs/SAP_S4HANA_CLOUD/6b39bd1d0e5e4099a5b65d835c29c696/c3833c31e7724a79b23e4273290f3e2e.html) | JournalEntryBulkChangeRequest_In restrictions |
| [SAP Help - Journal Entry Event](https://help.sap.com/docs/SAP_S4HANA_CLOUD/b978f98fc5884ff2aeb10c8fdeb8a43b/a97fa43157424cf582cd49baf9b708c1.html) | Journal Entry Created event and payload cues |
| [SAP Help - G/L Account - Read](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/3ab6e6fc510f4840a5508e126ef01e22/5f4d16d6a031437fbfd1f61937c6b3fd.html) | API_GLACCOUNTINCHARTOFACCOUNTS_SRV |
| [SAP Help - G/L Account Line Items - Read](https://help.sap.com/docs/SAP_S4HANA_CLOUD/0fa84c9d9c634132b7c4abb9ffdd8f06/80214b5ede2f4e97b640137a4eca208a.html) | API_GLACCOUNTLINEITEM_SRV and extraction limits |
| [SAP Help - Operational Journal Entry Item - Read](https://help.sap.com/docs/SAP_S4HANA_CLOUD/b978f98fc5884ff2aeb10c8fdeb8a43b/c024170fa7af40878975e218f3426387.html) | API_OPLACCTGDOCITEMCUBE_SRV and volume caveat |
| [SAP Help - Trial Balance - Read](https://help.sap.com/docs/SAP_S4HANA_CLOUD/b978f98fc5884ff2aeb10c8fdeb8a43b/61ab22d2f6da49a394004e459947e994.html) | C_TrialBalance_CDS and filter restrictions |
| [SAP Help - Bank Details](https://help.sap.com/docs/SAP_S4HANA_CLOUD/8e3ab24444a840ecb6a360fdffb1942f/88a469df500a4f8294e86d863b163b60.html) | API_BANKDETAIL_SRV retrieval candidate |
| [SAP Help - Payment Advice](https://help.sap.com/docs/SAP_S4HANA_CLOUD/4f22209d1f5d4bd79c4a55017608b51b/f8f29bb9d08a418d936ce5de8a78b33f.html) | API_PAYMENT_ADVICE_SRV and SAP_COM_0331 |
| [SAP Help - Manage Substitution/Validation Rules](https://help.sap.com/docs/SAP_S4HANA_CLOUD/adbae5bcd5994f159bf2847a11397b61/5c8c2825535f4e3aa9b7f716a0085221.html) | Posting-control reference for validation/substitution governance |

## Validaciones abiertas

- Revalidar API Hub URLs, artifact versions and lifecycle status before design use or client-specific promotion.
- Confirmar communication scenarios, communication arrangements, service activation, authentication, authorization objects and business catalogs.
- Confirmar payloads, filters, batching, event payloads, AIF monitoring, reprocessing and data-volume limits.
- Confirmar owner boundary between Record-to-Report, Order-to-Cash, Source-to-Pay / Procure-to-Pay, Treasury and Tax.
- Para Mexico, validar CFDI/complemento carry-forward, retenciones/VAT, tipo de cambio, bancos, conciliacion contable, evidencia fiscal, archivo/retencion, auditoria and SoD.

## Siguientes acciones

1. Revisar este inventario con General Ledger, Finance Controls, AP/AR, Treasury Operations, Integration, Security and Tax/Localization owners.
2. Ejecutar SCI-018 como Discovery Center R2R support-service inventory, limitado a servicios soporte para integracion, eventos, identidad, conectividad, workflow/process automation, compliance/document evidence and analytics candidates.
3. Mantener todos los artefactos como candidatos hasta validar tenant, licenciamiento, communication arrangements, payloads and Mexico fiscal evidence.
