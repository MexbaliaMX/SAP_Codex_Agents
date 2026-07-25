# Inventario SAP Fiori Apps FI / Record-to-Report

Fecha de preparacion: 2026-07-13

## Alcance y fuentes

Este entregable consolida una revision profunda de SAP Fiori Apps Reference Library para construir una base de conocimiento reutilizable en implementaciones futuras de SAP S/4HANA Finance, enfocada en Record-to-Report y procesos FI adyacentes cubiertos por TS4F01.

Fuentes oficiales consultadas:

- SAP Fiori Apps Reference Library: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/
- Servicio OData publico de referencia de apps: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/
- Metadata OData consultado: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/$metadata
- Lista de releases consultada: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/Releases

La SAP Fiori Apps Reference Library indica que permite explorar, planear e implementar contenido SAP Fiori para SAP Fiori launchpad, obtener datos tecnicos por app, revisar versiones anteriores, generar informacion agregada de instalacion/configuracion y navegar a documentacion, Product Availability Matrix y Maintenance Planner.

## Release anchor vigente

La consulta de releases al 2026-07-13 devolvio como versiones mas recientes:

| Deployment model | Release ID | Nombre en FARL | Uso en este inventario |
| --- | --- | --- | --- |
| SAP S/4HANA Private Cloud / On-Premise | S32PCE | S/4HANA 2025 FPS01 - PCE | Anchor principal para inventario privado/PCE |
| SAP S/4HANA On-Premise | S32OP | S/4HANA 2025 FPS01 | Referencia on-premise equivalente |
| SAP S/4HANA Public Cloud | S36 | S/4HANA Cloud 2602 | Senal de disponibilidad Public Cloud cuando aparece en ProductVersion |

Confirmado: FARL distingue `SAP S/4HANA Public Cloud`, `SAP S/4HANA (Private Cloud and On-Premise)`, `SAP Business Suite`, `SAP Business Suite - Lower back-end versions` y `Apps on SAP BTP`.

## Metodo de consulta

Se consulto el entity set `InputFilterParam(InpFilterValue='1NA')/Results` del servicio `SingleApp.xsodata`, filtrando por nombres de app y app IDs relacionados con TS4F01 y Record-to-Report. Los campos usados para la matriz fueron:

- `appId`
- `AppName`
- `ApplicationType`
- `RoleName`
- `releaseId`
- `releaseGroupText`
- `BusinessCatalog`
- `TechnicalCatalog`
- `ApplicationComponent`
- `PrimaryPVOfficialNameCombined`

La columna `Public Cloud 2602` se marco como `Si` cuando el campo `PrimaryPVOfficialNameCombined` incluyo `SAP S/4HANA Cloud Public Edition 2602`. Si el resultado no lo incluyo, se marco como `No / validar`; esto no prueba indisponibilidad funcional absoluta, solo que la senal no aparecio en la fila consultada.

## Mapa E2E

| Etapa E2E | Objetivo de negocio | Apps candidatas |
| --- | --- | --- |
| Setup financiero y datos maestros | Mantener cuentas de mayor, bancos, cuentas bancarias y datos base para contabilizacion | F0731A, F1366A, F1574A, F6437 |
| Registro contable | Crear, cargar, revisar y consultar documentos financieros | F0718, F2548, F0717A, F0717 |
| Parking y aprobacion | Verificacion humana de journal entries antes de contabilizar | F2547A, F2728, F2729, F2720, F3932 |
| Cierre periodico | Jobs de GL, recurring entries, valuacion moneda extranjera y reportes financieros | F1927, F1598, FAGL_FCV, F0708, W0161, W0097 |
| Compensacion y bancos | Clearing, bank statements, pagos automaticos y payment media | F-03, FB1SL, FEB_BSPROC, F0770, F1868, F110, F110S |
| Cuentas por cobrar | Line items, dunning y correspondencia | F0711, F2435, F150, F0744A |
| Cuentas por pagar | Line items, pagos y jobs periodicos | F0712, F0770, F1868, F2257 |
| Controles de contabilizacion | Validaciones, sustituciones y logging | F4406, F4886, F4945 |
| Archivo y retencion | Archiving FI segun objetos y evidencia | Gap FARL; validar objetos FI, SARA/ILM, roles y apps tecnicas por tenant |

## Inventario curado

| Proceso | App ID | App oficial | Tipo | Rol FARL | Release anchor | Public Cloud 2602 | Catalogo principal observado | Componente |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Reporting financiero | F0708 | Balance Sheet/Income Statement | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_REPORTING | FI-GL-GL |
| Reporting financiero | W0161 | Balance Sheet / Income Statement - Multidimensional | Web Dynpro | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_REPORTING | FI-FIO-GL |
| Reporting financiero | W0097 | Trial Balance Comparison | Web Dynpro | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_REPORTING | FI-FIO-GL-IS |
| Journal entry | F0717A | Manage Journal Entries - New Version | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_JE_PROC | FI-FIO-GL-TRA |
| Journal entry | F0717 | Manage Journal Entries | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_JE_PROC | FI-FIO-GL-TRA |
| Journal entry | F0718 | Post General Journal Entries | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_JE_PROC | FI-FIO-GL-TRA |
| Journal entry upload | F2548 | Upload General Journal Entries | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_JE_PROC | FI-FIO-GL-TRA |
| Journal entry verification | F2547A | Verify General Journal Entries - New Version | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_PARKDCPRE | FI-FIO-GL |
| Journal entry verification | F2728 | Verify Journal Entries in General Ledger - For Processor (Inbox) | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_PARKDCPST | FI-FIO-GL-TRA |
| Journal entry verification | F2729 | Verify Journal Entries in General Ledger - For Processor (Outbox) | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_PARKDCPST | FI-FIO-GL-TRA |
| Workflow control | F2720 | Manage Workflows for Journal Entry Verification - In General Ledger | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_CONTROL | FI-FIO-GL-CA |
| Responsibility management | F3932 | Manage Teams and Responsibilities For Journal Entry Verification - In General Ledger | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_CONTROL | FI-FIO-GL-TRA |
| Recurring postings | F1598 | Manage Recurring Journal Entries | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_CLOSING | FI-FIO-GL-TRA |
| Periodic jobs | F1927 | Schedule General Ledger Jobs | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_CLOSING | FI-FIO-GL-PER |
| GL master data | F0731A | Manage G/L Account Master Data (Version 2) | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_MD_COA | FI-FIO-GL-MD |
| Automatic payments | F0770 | Manage Automatic Payments | Transactional | Accounts Payable Accountant | S32PCE | Si | SAP_SFIN_BC_AP_PAY_PROC | FI-FIO-AP-PAY |
| Payment media | F1868 | Manage Payment Media | Transactional | Accounts Payable Accountant | S32PCE | Si | SAP_SFIN_BC_AP_PAY_PROC | FI-FIO-AP-PAY |
| Automatic payments fallback | F110 | Schedule Automatic Payments | SAP GUI | Other | S32PCE | No / validar | SAP_SFIN_BC_APAR_OPER | FI-AP-AP-B |
| Automatic payments fallback | F110S | Schedule Automatic Payments Periodically | SAP GUI | Other | S32PCE | No / validar | SAP_SFIN_BC_APAR_PAYM | FI-AP-AP-B |
| Bank account management | F1366A | Manage Bank Accounts | Transactional | Cash Manager | S32PCE | Si | SAP_SFIN_BC_CM_BAM_BASIC | FIN-FSCM-CLM-BAM |
| Bank master / house bank | F1574A | Manage Banks - Cash Management | Transactional | Cash Manager | S32PCE | Si | SAP_SFIN_BC_CM_BAM_BASIC | FIN-FSCM-CLM-BAM |
| Bank master data | F6437 | Manage Banks - Master Data | Transactional | Master Data Specialist - Bank Data | S32PCE | Si | SAP_CA_BC_BNK | CA-BK-BNK |
| Bank statement exception handling | FEB_BSPROC | Reprocess Bank Statement Items - FEB_BSPROC | SAP GUI | Other | S32PCE | Si | SAP_SFIN_BC_BA_BANKSTAT | FI-BL-PT-BA |
| AR line items | F0711 | Manage Customer Line Items | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_DOC_PROC | FI-FIO-AR-IS |
| AP line items | F0712 | Manage Supplier Line Items | Transactional | Accounts Payable Accountant | S32PCE | Si | SAP_SFIN_BC_AP_DOC_PROC | FI-FIO-AP-IS |
| AR dunning | F2435 | My Dunning Proposals | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_DUNNING | FI-FIO-AR |
| AR dunning fallback | F150 | Create Dunning Notices | SAP GUI | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_DUNNING | FI-AP-AP-B |
| Correspondence | F0744A | Create Correspondence (Version 2) | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_APAR_CORR | FI-FIO-AR-IS |
| AP periodic jobs | F2257 | Schedule Accounts Payable Jobs | Transactional | Accounts Payable Accountant | S32PCE | Si | SAP_SFIN_BC_AP_PERIOD_ACT | FI-FIO-AP-IS |
| AR periodic jobs | F2366 | Schedule Accounts Receivable Jobs | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_PERIODICACT | FI-FIO-AR-IS |
| Substitution / validation | F4406 | Manage Substitution and Validation Rules | Transactional | Configuration Expert - Business Process Configuration | S32PCE | Si | SAP_CA_BC_ACC_CONFIG | FI-SL-VSR |
| Substitution / validation audit | F4886 | Substitution/Validation Log | Analytical | Configuration Expert - Business Process Configuration | S32PCE | Si | SAP_TRM_BC_SUBVALLOG | FI-SL-VSR |
| Substitution / validation audit setup | F4945 | Set Substitution/Validation Logging | Transactional | Configuration Expert - Business Process Configuration | S32PCE | Si | SAP_CA_BC_ACC_CONFIG | FI-SL-VSR |
| Foreign currency valuation | FAGL_FCV | Perform Foreign Currency Valuation | SAP GUI | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_CLOSING | FI-GL-GL-G |
| Clearing fallback | F-03 | Clear G/L Accounts | SAP GUI | Other | S32PCE | No / validar | Without Catalog Assignment | FI-AP-AP-B |
| Clearing by ledger group | FB1SL | Clear G/L Accounts - For Ledger Group | SAP GUI | General Ledger Accountant | S32PCE | No / validar | SAP_SFIN_BC_GL_JE_CLRING | FI-GL-GL-A |

## Observaciones de implementacion

1. Preferir apps transaccionales nuevas cuando FARL muestra una version nueva, por ejemplo `F0717A` sobre `F0717` y `F2547A` sobre versiones previas, sujeto a disponibilidad real del tenant.
2. Mantener apps SAP GUI como fallback operativo o tecnico solo cuando el flujo, release o tenant lo requiera. No asumir que una transaccion GUI esta aprobada para usuarios finales sin diseno de roles y controles.
3. Para pagos automaticos, combinar `F0770`, `F1868`, `F1366A`, `F1574A` y `F6437` con validacion de house banks, bank accounts, payment methods, payment media, aprobaciones y conectividad bancaria.
4. Para journal entry verification, tratar `F2720` y `F3932` como prerequisitos de gobierno: workflow, equipos, responsabilidades, segregacion de funciones y evidencia de aprobacion.
5. Para validaciones/sustituciones, `F4406`, `F4886` y `F4945` deben entrar al diseno de controles, no solo a configuracion tecnica. Documentar owner, regla, alcance, evidencia y ciclo de cambios.
6. Para archivo FI, FARL no devolvio una app Fiori financiera generica al buscar `Archive Financial Accounting Documents`, `FI_DOCUMNT`, `FI_TF_GLF` o terminos equivalentes. Validar por objeto de archivo, ILM/SARA, roles tecnicos y retencion legal.

## Overlay Mexico

Para implementaciones en Mexico, agregar validaciones especificas antes de cerrar fit-to-standard:

- CFDI de ingreso/egreso y complementos de pago vinculados a line items, pagos, clearing y correspondencia.
- Evidencia entre documento financiero, XML/PDF fiscal, banco, complemento de pago, tipo de cambio y poliza.
- Retenciones, IVA, moneda extranjera y diferencias cambiarias por escenario.
- Segregacion de funciones para creacion de journal entries, verificacion, aprobacion, pagos, cambios bancarios y reglas de sustitucion/validacion.
- Conservacion de evidencia fiscal y contable antes de activar archivo o purga de datos.
- Carta Porte solo si el flujo financiero se cruza con traslado de bienes o evidencia logistica fiscal.

## Gaps de validacion

- Este inventario no prueba que las apps esten activadas, licenciadas o autorizadas en un tenant especifico.
- La senal `Public Cloud 2602` viene del campo de version de FARL, no de un tenant real.
- FARL puede cambiar; refrescar el inventario antes de cada discovery, fit-to-standard o proposal.
- Validar business roles, catalogs, spaces/pages, OData services, ICF nodes, SAP Notes, product versions, extensibilidad y restricciones por edition directamente en FARL y en el landscape del cliente.
- Confirmar si el cliente usa SAP S/4HANA Cloud Public Edition, Private Edition, on-premise o landscape hibrido antes de comprometer alcance.

## Query pattern reutilizable

Ejemplo de consulta OData por app ID:

```text
https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/InputFilterParam(InpFilterValue='1NA')/Results?$format=json&$select=appId,AppName,ApplicationType,RoleName,releaseId,releaseGroupText,BusinessCatalog,TechnicalCatalog,ApplicationComponent,PrimaryPVOfficialNameCombined&$filter=appId eq 'F0717A'
```

Ejemplo de deep link FARL:

```text
https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/#/detail/Apps('F0717A')/S32PCE
```

## Siguientes acciones

1. Convertir este inventario en matriz de fit-to-standard por proceso: GL, AP, AR, Bank, Dunning, Correspondence, Workflow, Controls y Archiving.
2. Crear una matriz adicional por rol: General Ledger Accountant, Accounts Payable Accountant, Accounts Receivable Accountant, Cash Manager, Master Data Specialist - Bank Data y Configuration Expert.
3. En cada proyecto, validar FARL contra el tenant: apps visibles, business catalogs asignados, spaces/pages, autorizaciones, workflow, OData/ICF y restricciones por edition.
4. Para Mexico, agregar evidencia CFDI/complementos de pago y controles de auditoria por escenario de prueba.
