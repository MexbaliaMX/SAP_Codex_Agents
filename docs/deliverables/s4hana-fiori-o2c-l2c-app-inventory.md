# Inventario SAP Fiori Apps Order-to-Cash / Lead-to-Cash

Fecha de preparacion: 2026-07-13

## Alcance y fuentes

Este entregable consolida una revision de SAP Fiori Apps Reference Library para construir una base de conocimiento reutilizable en implementaciones futuras de SAP S/4HANA, enfocada en Lead-to-Cash y Order-to-Cash. El alcance cubre datos maestros comerciales, cotizacion, contrato, pedido, aprobaciones, disponibilidad/fulfillment, entrega, picking, facturacion, devoluciones, credito, cuentas por cobrar, cobro, clearing, disputas, collections, analitica y handoff a Record-to-Report.

Fuentes oficiales consultadas:

- SAP Fiori Apps Reference Library: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/
- Servicio OData publico de referencia de apps: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/
- Metadata OData consultado: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/$metadata
- Lista de releases consultada: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/Releases

La SAP Fiori Apps Reference Library se uso como fuente primaria para app IDs, nombres oficiales, tipo de aplicacion, rol, business catalog, componente y senal de version.

## Release anchor vigente

La consulta de releases al 2026-07-13 devolvio como versiones mas recientes:

| Deployment model | Release ID | Nombre en FARL | Uso en este inventario |
| --- | --- | --- | --- |
| SAP S/4HANA Private Cloud / On-Premise | S32PCE | S/4HANA 2025 FPS01 - PCE | Anchor principal para inventario privado/PCE |
| SAP S/4HANA On-Premise | S32OP | S/4HANA 2025 FPS01 | Referencia on-premise equivalente |
| SAP S/4HANA Public Cloud | S36 | S/4HANA Cloud 2602 | Senal de disponibilidad Public Cloud cuando aparece en ProductVersion |

## Metodo de consulta

Se consulto el entity set `InputFilterParam(InpFilterValue='<termino-o-app-id>')/Results` del servicio `SingleApp.xsodata`, filtrando primero por terminos de proceso y despues por IDs exactos de apps curadas.

Campos usados para la matriz:

- `appId`
- `AppName`
- `ApplicationType`
- `RoleName`
- `releaseId`
- `releaseGroupText`
- `BusinessCatalog`
- `ApplicationComponent`
- `PrimaryPVOfficialNameCombined`

La columna `Public Cloud 2602` se marco como `Si` cuando el campo `PrimaryPVOfficialNameCombined` incluyo `SAP S/4HANA Cloud Public Edition 2602`. Si el resultado no lo incluyo, se marco como `No / validar`; esto no prueba indisponibilidad absoluta, solo indica que la senal no aparecio en la fila consultada.

## Limite Lead-to-Cash

Este catalogo se concentra en SAP S/4HANA. En escenarios Lead-to-Cash completos, las etapas de lead, oportunidad, CPQ, commerce, suscripciones o customer success pueden vivir en SAP Sales Cloud, SAP CPQ, SAP Commerce, SAP Subscription Billing u otros sistemas. Esas capacidades deben validarse con sus fuentes oficiales y landscape del cliente antes de asumir cobertura en S/4HANA.

## Mapa E2E

| Etapa E2E | Objetivo de negocio | Apps candidatas |
| --- | --- | --- |
| Datos maestros comerciales | Mantener customers, customer-material info y vistas de cliente | F0850A, F0046A, F2499 |
| Cotizacion | Crear, importar, aprobar y dar seguimiento a sales quotations | F5630, F1852, F6381, F5044 |
| Contratos comerciales | Mantener sales contracts y cambios masivos | F5987, F1851, F5275 |
| Pedido de venta | Crear, gestionar, aprobar y consultar sales orders | F3893, F1873, F1814, F5041, VA01, VA02, VA03, VA05 |
| Fulfillment y excepciones | Monitorear progreso, fulfillment issues, backorders y precio esperado | F2577, F2981, F0029A, F2713, F5307, F5308 |
| Entrega y picking | Crear entrega, gestionar outbound delivery, picking y scheduling | F0869A, F3487, F0867A, F0868, F2228, F0233A, VL01N, VL02N, VL03N |
| Facturacion | Crear, gestionar, aprobar y calendarizar billing documents | F0798, F0797, F1901, F2875, F2876, F2960, F1518, F4563, F5137, F5043, VF01, VF02, VF03, VF04 |
| Devoluciones y credit memo | Gestionar customer returns, refunds y credit memo requests | F4832, F1708, F2651, F2652, F5053, F4092, F1989A, F1846 |
| Credito | Gestionar credit accounts, exposure, credit decisions y jobs | F4596, F2541, F1751, F2162, F3748, F4825, F4826, F5587, F5602 |
| Cuentas por cobrar | Procesar receivables, customer line items, balances y customer list | F0106A, F0711, F0703A, F2640, F3242, F1747, F1748, F1744 |
| Pagos y clearing | Registrar pagos entrantes, payment advices, lockbox, bank statements y clearing | F1345, F0773, F2626, F2550, F1680, F1681, F3398, F1520, F1564 |
| Dunning, disputes y collections | Gestionar disputas, propuestas de dunning, worklists y estrategias de cobranza | F0702A, F1752, F2521, F2522, F2523, F2540, F5999, F3578, F2328, F2435, F0380, F2375, F2946, F5400, F6120, F4708 |
| Analitica de ventas y cobro | Medir ventas, devoluciones, receivables, collections e incoming payments | F1250, F2235, F2270, F2271, F2458, F2941, F2925, F3182, F1619, F5588 |
| Revenue accounting | Revisar revenue schedule e issues de revenue recognition asociados a sales orders | F3882, F4185 |
| Localizacion Mexico | Gestionar CFDI/eDocument, DRC, reportes legales y evidencia fiscal aplicable | F5218, CFDI_MONITOR, EDOC_MX_SUMMARY, EDOC_MX_COMP_INV, EDOC_MX_PROD_INV |

## Inventario curado

| Proceso | App ID | App oficial | Tipo | Rol FARL | Release anchor | Public Cloud 2602 | Catalogo principal observado | Componente |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Customer master | F0850A | Manage Customer Master Data | Transactional | Master Data Specialist - Business Partner Data | S32PCE | Si | SAP_CMD_BC_CUSTOMER_MAINT | LO-MD-FIO-CM |
| Customer master | F0046A | Customer Master FactSheets | Fact sheet | Master Data Specialist - Business Partner Data | S32PCE | Si | SAP_CMD_BC_CUSTOMER_DSP | LO-MD-FIO-CM |
| Customer material | F2499 | Manage Customer Materials | Transactional | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_MD_MANAGE | SD-MD-AM-CMI |
| Cotizacion | F5630 | Manage Sales Quotation - Version 2 | Transactional | Others | S32PCE | Si | SAP_SD_BC_QUOT_PROC_OP | SD-SLS-QUT |
| Cotizacion | F1852 | Manage Sales Quotations | Transactional | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_QUOT_PROC_OP | SD-SLS |
| Cotizacion import | F6381 | Import Sales Quotations | Transactional | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_QTN_IMPORT | SD-SLS-IMP-SPR |
| Aprobacion cotizacion | F5044 | My Inbox - Approve Sales Quotations | Transactional | Sales Manager | S32PCE | Si | SAP_SD_BC_MYINBOX | SD-FIO-SLS |
| Contrato de venta | F5987 | Manage Sales Contracts - Version 2 | Transactional | Others | S32PCE | Si | SAP_SD_BC_CONTR_PROC_OP | SD-SLS-OA-CCO |
| Contrato de venta | F1851 | Manage Sales Contracts | Transactional | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_CONTR_PROC_OP | SD-SLS |
| Contrato cambio masivo | F5275 | Mass Change of Sales Contracts | Transactional | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_MCC_SLSDOC | SD-SLS-MCC |
| Pedido de venta | F3893 | Manage Sales Orders - Version 2 | Transactional | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_SO_PROC_OP | SD-FIO-SLS |
| Pedido de venta | F1873 | Manage Sales Orders | Transactional | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_SO_PROC_OP | SD-SLS |
| Pedido fact sheet | F1814 | Sales Order (S/4HANA) | Fact sheet | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_SO_DISPL | SD-FIO-SLS |
| Aprobacion pedido | F5041 | My Inbox - Approve Sales Orders | Transactional | Sales Manager | S32PCE | Si | SAP_SD_BC_MYINBOX | SD-FIO-SLS |
| Fulfillment | F2577 | Track Sales Orders (S/4HANA) | Transactional, Analytical | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_SLS_ORD_TRACKING | SD-FIO-HBA |
| Fulfillment detalle | F2981 | Track Sales Order Details | Transactional | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_SLS_ORD_TRACKING | SD-FIO-HBA |
| Excepciones fulfillment | F0029A | Sales Order Fulfillment Issues (Version 2) | Transactional, Analytical | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_SLS_ORD_MNTRG | SD-FIO-HBA |
| Precio esperado | F2713 | Manage Sales Documents with Customer-Expected Price | Transactional | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_SO_PROC_OP | SD-ANA |
| Backorders | F5307 | Sales Order Items - Backorders | Analytical | Others | S32PCE | Si | SAP_SD_BC_SALES_ANLYTS_OP | SD-ANA |
| Confirmacion requerida | F5308 | Sales Order Items - Confirmed as Requested | Analytical | Others | S32PCE | Si | SAP_SD_BC_SALES_ANLYTS_OP | SD-ANA |
| Entrega | F0869A | Create Outbound Deliveries - From Sales Orders | Transactional | Shipping Specialist | S32PCE | Si | SAP_LE_BC_OBDLV_PROC | LE-SHP-FIO |
| Entrega | F3487 | Create Delivery with Reference to Sales Order | Transactional | Shipping Specialist | S32PCE | Si | SAP_LE_BC_OBDLV_PROC | LE-SHP-FIO |
| Entrega | F0867A | Manage Outbound Deliveries | Transactional | Shipping Specialist | S32PCE | Si | SAP_LE_BC_OBDLV_PROC | LE-SHP-FIO |
| Picking | F0868 | Pick Outbound Delivery | Transactional | Shipping Specialist | S32PCE | Si | SAP_LE_BC_OBDLV_PROC | LE-SHP-FIO-NAT |
| Scheduling entrega | F2228 | Schedule Delivery Creation | Transactional | Shipping Specialist | S32PCE | Si | SAP_LE_BC_OBDLV_PROC | LE-SHP-GF-JS |
| Entrega fact sheet | F0233A | Outbound Delivery (S/4HANA) | Fact sheet | Shipping Specialist | S32PCE | Si | SAP_LE_BC_OBDLV_DISPLAY | LE-SHP-FIO-OBP |
| Facturacion | F0798 | Create Billing Documents | Transactional | Billing Clerk | S32PCE | Si | SAP_SD_BC_BIL_DOC | SD-FIO-BIL |
| Facturacion | F0797 | Manage Billing Documents | Transactional | Billing Clerk | S32PCE | Si | SAP_SD_BC_BIL_DOC | SD-FIO-BIL |
| Factura fact sheet | F1901 | Billing Document | Fact sheet | Billing Clerk | S32PCE | Si | SAP_SD_BC_BIL_DOC_DISPL | SD-FIO-BIL |
| Preliminary billing | F2875 | Manage Preliminary Billing Documents | Transactional | Billing Clerk | S32PCE | Si | SAP_SD_BC_PRE_BIL_DOC | SD-BIL-PBD |
| Preliminary billing | F2876 | Create Preliminary Billing Documents | Transactional | Billing Clerk | S32PCE | Si | SAP_SD_BC_PRE_BIL_DOC | SD-BIL-PBD |
| Billing request | F2960 | Manage Billing Document Requests | Transactional | Billing Clerk | S32PCE | Si | SAP_SD_BC_BIL_DOC_REQ | SD-FIO-BIL |
| Billing schedule | F1518 | Schedule Billing Release | Transactional | Billing Clerk | S32PCE | Si | SAP_SD_BC_BIL_SCHEDULE | SD-BIL |
| Preliminary billing jobs | F4563 | Schedule Creation of Preliminary Billing Documents | Transactional | Billing Clerk | S32PCE | Si | SAP_SD_BC_BIL_SCHEDULE | SD-BIL-PBD |
| Billing from preliminary | F5137 | Schedule Billing Creation for Preliminary Billing Documents | Transactional | Others | S32PCE | Si | SAP_SD_BC_BIL_SCHEDULE | SD-BIL |
| Aprobacion preliminary billing | F5043 | My Inbox - Approve Preliminary Billing Documents | Transactional | Billing Clerk | S32PCE | Si | SAP_SD_BC_BIL_MYINBOX | SD-FIO-BIL |
| Devoluciones | F4832 | Manage Customer Returns - Version 2 | Transactional | Returns and Refund Clerk | S32PCE | Si | SAP_SD_BC_RETURNS_PROC | SD-SLS-RE |
| Devoluciones | F1708 | Manage Customer Returns | Transactional | Returns and Refund Clerk | S32PCE | Si | SAP_SD_BC_RETURNS_PROC | SD-SLS-RE |
| Devolucion create | F2651 | Manage Customer Returns - Create | Transactional | Returns and Refund Clerk | S32PCE | Si | SAP_SD_BC_RETURNS_PROC | SD-SLS-RE |
| Devolucion refund | F2652 | Manage Customer Returns - Refund | Transactional | Returns and Refund Clerk | S32PCE | Si | SAP_SD_BC_RETURNS_PROC | SD-SLS-RE |
| Aprobacion devolucion | F5053 | My Inbox - Approve Customer Returns | Transactional | Sales Manager | S32PCE | Si | SAP_SD_BC_MYINBOX | SD-FIO-SLS |
| Analitica devoluciones | F4092 | Customer Returns - Return Rate | Analytical | Sales Manager | S32PCE | Si | SAP_SD_BC_RETURNS_ANA | SD-ANA |
| Credit memo | F1989A | Manage Credit Memo Requests - Version 2 | Transactional | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_CMR_PROC | SD-SLS-CMR |
| Credit memo fact sheet | F1846 | Credit Memo Request | Fact sheet | Internal Sales Representative | S32PCE | Si | SAP_SD_BC_DMR_CMR_DISPL | SD-SLS-CMR |
| Credito | F4596 | Manage Credit Accounts | Transactional | Credit Controller | S32PCE | Si | SAP_SFIN_BC_CR_CREDIT_ACC | FIN-FIO-CCD-CR |
| Credito | F2541 | Analyze Credit Exposure | Analytical | Credit Controller | S32PCE | Si | SAP_SFIN_BC_CR_ANALYTICS | FI-FIO-AR-ANA |
| Credito | F1751 | Credit Limit Utilization (S/4HANA) | Analytical | Credit Controller | S32PCE | Si | SAP_SFIN_BC_CR_ANALYTICS | FIN-FIO-CCD |
| Credito log | F2162 | Display Credit Management Log | Transactional | Credit Controller | S32PCE | Si | SAP_SFIN_BC_CR_DISP_DATA | FIN-FIO-CCD |
| Credito jobs | F3748 | Schedule Credit Management Jobs | Transactional | Credit Controller | S32PCE | Si | SAP_SFIN_BC_CR_PERIODC_ACT | FIN-FIO-CCD |
| Credito datos | F4825 | Display Credit Account Data | Transactional | Credit Controller | S32PCE | Si | SAP_SFIN_BC_CR_DISP_DATA | FIN-FIO-CCD |
| Credito exposure | F4826 | Display Credit Exposure | Transactional | Credit Controller | S32PCE | Si | SAP_SFIN_BC_CR_CREDIT_ACC | FIN-FIO-CCD |
| Credito decision | F5587 | Manage Documented Credit Decisions | Transactional | Credit Controller | S32PCE | Si | SAP_SFIN_BC_CR_CASES | FIN-FIO-CCD-CR |
| Credito limit request | F5602 | Manage Credit Limit Requests | Transactional | Others | S32PCE | Si | SAP_SFIN_BC_CR_CASES | FIN-FIO-CCD-CR |
| Receivables | F0106A | Process Receivables (Version 2) | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_DOC_PROC | FIN-FIO-CCD-COL |
| Customer line items | F0711 | Manage Customer Line Items | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_DOC_PROC | FI-FIO-AR-IS |
| Customer balances | F0703A | Display Customer Balances (Version 2) | Analytical | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_DOC_PROC | FI-FIO-AR-IS |
| Customer list | F2640 | Display Customer List | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_DOC_PROC | FI-FIO-AR-IS |
| AR overview | F3242 | Accounts Receivable Overview | Analytical | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_ANALYTICS | FI-FIO-AR |
| Overdue receivables | F1747 | Overdue Receivables (S/4HANA) | Analytical | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_ANALYTICS | FI-FIO-AR-ANA |
| Total receivables | F1748 | Total Receivables (S/4HANA) | Analytical | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_ANALYTICS | FI-FIO-AR-ANA |
| Future receivables | F1744 | Future Receivables (S/4HANA) | Analytical | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_ANALYTICS | FI-FIO-AR-ANA |
| Pago entrante | F1345 | Post Incoming Payments | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_INC_PAYM | FI-FIO-AR-TRA |
| Clearing | F0773 | Clear Incoming Payments | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_CLEARING | FI-FIO-AR-TRA |
| Clearing | F2626 | Assign Open Items | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_CLEARING | FI-FIO-AR |
| Payment advice | F2550 | Manage Payment Advices | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_PAYM_ADV | FI-FIO-AR |
| Incoming payment files | F1680 | Manage Incoming Payment Files | Transactional | Cash Management Specialist | S32PCE | Si | SAP_SFIN_BC_BA_BANKSTAT | FI-FIO-AR-PAY |
| Lockbox | F1681 | Manage Lockbox Batches | Transactional | Cash Management Specialist | S32PCE | Si | SAP_SFIN_BC_BA_LOCKBOX | FI-FIO-AR-PAY |
| Lockbox reprocess | F3398 | Reprocess Lockbox Items | Transactional | Cash Management Specialist | S32PCE | Si | SAP_SFIN_BC_BA_LOCKBOX | FI-FIO-AR-PAY |
| Bank statement | F1520 | Reprocess Bank Statement Items | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_BA_BANKSTAT | FI-FIO-AR-PAY |
| Bank statement | F1564 | Manage Bank Statements | Transactional | Cash Management Specialist | S32PCE | Si | SAP_SFIN_BC_BA_BANKSTAT | FI-FIO-AR-PAY |
| Disputes | F0702A | Manage Dispute Cases (Version 2) | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_DISPUTE_RES | FIN-FIO-CCD-COL |
| Disputes analytics | F1752 | Open Disputes | Analytical | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_DM_ANALYTIC | FIN-FIO-CCD |
| Disputes analytics | F2521 | Solved Disputes | Analytical | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_DM_ANALYTIC | FIN-FIO-CCD |
| Disputes analytics | F2522 | Processing Days of Open Disputes | Analytical | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_DM_ANALYTIC | FIN-FIO-CCD |
| Disputes analytics | F2523 | New Versus Solved Disputes | Analytical | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_DM_ANALYTIC | FIN-FIO-CCD |
| Disputes aging | F2540 | Overdue Receivables in Dispute | Analytical | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_DM_ANALYTIC | FI-FIO-AR |
| Disputes proposals | F5999 | Manage Assignment Proposals for Dispute Cases | Transactional | Others | S32PCE | Si | SAP_SFIN_BC_AR_DM_REPROC | FIN-FIO-CCD-COL |
| Disputes jobs | F3578 | Schedule Dispute Management Jobs | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_DM_PERIOACT | FIN-FIO-CCD |
| Dunning | F2328 | Display Dunning History | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_DUNNING | FI-FIO-AR |
| Dunning | F2435 | My Dunning Proposals | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_DUNNING | FI-FIO-AR |
| Dunning analytics | F1742 | Dunning Level Distribution (S/4HANA) | Analytical | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_ANALYTICS | FI-FIO-AR-ANA |
| Collections | F0380 | Process Collections Worklist | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_COLWL | FIN-FIO-CCD |
| Collections supervisor | F2375 | Supervise Collections Worklist | Transactional | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_SUP_COLWL | FIN-FIO-CCD |
| Collections strategy | F2946 | Manage Collection Strategies | Transactional | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_COL_SETTING | FIN-FIO-CCD |
| Collections master data | F5400 | Manage Collections Master Data | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_COL_SETTING | FIN-FIO-CCD-COL |
| Collections email | F6120 | Manage Collections Emails | Transactional | Others | S32PCE | Si | SAP_SFIN_BC_AR_COLWL | FIN-FIO-CCD-COL |
| Collections contacts | F4708 | Manage Collection Contact Persons | Transactional | Accounts Receivable Accountant | S32PCE | Si | SAP_SFIN_BC_AR_COLWL | FIN-FIO-CCD-COL |
| Collections analytics | F2925 | Cash Collection Tracker - Accounts Receivable | Analytical | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_ANALYTICS | FI-FIO-AR |
| Collections analytics | F3182 | Cash Collection Tracker - Collections Management | Analytical | Accounts Receivable Manager | S32PCE | Si | SAP_SFIN_BC_AR_COL_ANALY | FIN-FIO-CCD |
| Incoming payment analytics | F1619 | Reprocessing Rate of Incoming Payments | Analytical | Accounts Receivable Manager | S32PCE | No / validar | SAP_SFIN_BC_AR_ANALYTICS | FI-FIO-AR-ANA |
| Incoming payment analytics | F5588 | Analyze Incoming Payments | Transactional | Accounts Payable and Receivable Manager (FI-CA) | S32PCE | Si | SAP_FICA_BC_ANALYTICS | FI-CA-FIO |
| Revenue accounting | F3882 | Revenue Schedule | Transactional | Revenue Accountant | S32PCE | Si | SAP_SFIN_BC_FARR_RA_CONTRT | FI-RA |
| Revenue issue | F4185 | Manage Revenue Recognition Issues - Sales Orders | Transactional | Cost Accountant - Sales | S32PCE | Si | SAP_SFIN_BC_SA_PER_SAO | CO-PC-OBJ-EBR |

## Fallbacks SAP GUI controlados

| Proceso | App ID | App oficial FARL | Tipo | Release anchor | Public Cloud 2602 | Catalogo principal observado | Componente |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Pedido fallback | VA01 | Create Sales Orders, Create Sales Orders - VA01 | SAP GUI | S32PCE | Si | SAP_SD_BC_SO_PROC_OP | SD-SLS |
| Pedido fallback | VA02 | Change Sales Orders, Change Sales Orders - VA02 | SAP GUI | S32PCE | Si | SAP_SD_BC_SO_PROC_OP | SD-SLS |
| Pedido fallback | VA03 | Display Sales Orders, Display Sales Orders - VA03 | SAP GUI | S32PCE | Si | SAP_SD_BC_SO_DISPL | SD-SLS |
| Lista pedidos fallback | VA05 | List Sales Orders, List Sales Orders - VA05 | SAP GUI | S32PCE | Si | SAP_SD_BC_SO_PROC_OP | SD-SLS-GF |
| Entrega fallback | VL01N | Create Outbound Delivery - With Order Reference | SAP GUI | S32PCE | Si | SAP_LE_BC_OD_PROC | LE-SHP-GF |
| Entrega fallback | VL02N | Change Outbound Delivery, Change Returns Delivery | SAP GUI | S32PCE | Si | SAP_LE_BC_OD_PROC | LE-SHP-GF |
| Entrega fallback | VL03N | Display Outbound Delivery, Display Returns Delivery | SAP GUI | S32PCE | Si | SAP_LE_BC_OBDLV_DISPLAY | LE-SHP-GF |
| Facturacion fallback | VF01 | Create Billing Documents, Create Billing Documents - VF01 | SAP GUI | S32PCE | Si | SAP_SD_BC_BIL_DOC | SD-BIL |
| Facturacion fallback | VF02 | Change Billing Documents | SAP GUI | S32PCE | Si | SAP_SD_BC_BIL_DOC | SD-BIL |
| Facturacion fallback | VF03 | Display Billing Documents | SAP GUI | S32PCE | Si | SAP_SD_BC_BIL_DOC_DISPL | SD-BIL |
| Facturacion fallback | VF04 | Create Billing Documents - VF04, Maintain Billing Due List | SAP GUI | S32PCE | Si | SAP_SD_BC_BIL_DOC | SD-BIL |
| Customer line items fallback | FBL5N | Manage Customer Line Items - FBL5N | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | FI-GL-IS |

## Overlay Mexico

Para entidades legales en Mexico, Order-to-Cash requiere validar CFDI, complementos de pago, cancelaciones, Carta Porte cuando aplique transporte de mercancia, evidencia fiscal y trazabilidad de auditoria. La consulta FARL identifico las siguientes apps/transacciones relacionadas con eDocument/DRC; deben validarse contra localizacion, scope, PAC, DRC y tenant:

| Tema | App ID | App oficial FARL | Tipo | Componente |
| --- | --- | --- | --- | --- |
| DRC | F5218 | Manage Document and Reporting Compliance | Transactional | CA-GTF-CSC-DRC-DSH |
| CFDI Mexico | CFDI_MONITOR | Manage Digital Invoices - Mexico | SAP GUI | FI-LOC-SD-MX |
| eDocument Mexico | EDOC_MX_SUMMARY | Create Consolidated eDocuments - Mexico | SAP GUI | CA-GTF-CSC-EDO-MX |
| eDocument Mexico | EDOC_MX_COMP_INV | Assign Complement Types to Customers - Mexico eInvoice | SAP GUI | CA-GTF-CSC-EDO-MX |
| eDocument Mexico | EDOC_MX_PROD_INV | Map Product Hierarchy Nodes to Product Codes of Tax Authorities - Mexico eInvoice | SAP GUI | CA-GTF-CSC-EDO-MX |
| Legal reporting | F1515 | Run Statutory Reports | Transactional, Reuse Component | FI-LOC-SRF-RUN |

Validaciones Mexico obligatorias:

- Determinar que billing documents generan CFDI y como se timbran, cancelan y reemiten.
- Validar complemento de pago desde cobro, clearing y conciliacion de AR.
- Evaluar Carta Porte cuando la entrega implique traslado regulado.
- Confirmar tax codes, uso CFDI, metodo/forma de pago, datos fiscales de cliente y producto.
- Confirmar evidencia de XML, acuses, logs, documentos contables y autorizaciones.

## Matriz fit-to-standard inicial

| Escenario | App estandar recomendada | Decision esperada | Validacion requerida |
| --- | --- | --- | --- |
| Captura de pedido estandar | F3893 | Fit preferente | Document types, pricing, ATP, credit, output y autorizaciones |
| Pedido con excepciones de fulfillment | F0029A, F2577, F2981 | Fit con monitoreo | Causas de bloqueo, incompletos, delivery/billing blocks |
| Entrega desde sales order | F0869A, F0867A | Fit preferente | Shipping point, route, picking, batch/serial, EWM/TM si aplica |
| Facturacion estandar | F0798, F0797 | Fit preferente | Billing due list, copy control, output, impuestos, CFDI |
| Preliminary billing | F2875, F2876, F5043 | Fit condicionado | Confirmar si el cliente requiere aprobacion previa a factura |
| Devoluciones | F4832 | Fit preferente | Motivos, inspeccion, refund, credit memo y evidencia fiscal |
| Credito | F4596, F2541, F5587 | Fit condicionado | Credit segments, risk class, approval matrix y documented decisions |
| Cobro y clearing | F1345, F0773, F2626 | Fit preferente | Bancos, payment advice, reglas de clearing y complemento de pago |
| Disputas y collections | F0702A, F0380, F2375 | Fit condicionado | Estrategia de cobranza, motivos de disputa, aging y owner |
| Mexico e-invoicing | F5218, CFDI_MONITOR | Gap de validacion local | DRC/eDocument, PAC, CFDI 4.0, cancelacion, complemento de pago |

## Riesgos y gaps de validacion

- FARL es fuente de referencia oficial de apps, no prueba de activacion en tenant.
- El indicador `Public Cloud 2602` se deriva del campo `PrimaryPVOfficialNameCombined`; debe validarse con scope items y roles del sistema objetivo.
- Lead, opportunity, CPQ, commerce y subscription billing pueden requerir productos fuera de S/4HANA.
- Pricing, tax, credit, ATP, output management y revenue recognition dependen de configuracion y datos maestros.
- Mexico requiere validacion fiscal especifica de CFDI, complemento de pago, Carta Porte y evidencia SAT/PAC.
- SAP GUI debe tratarse como fallback controlado o necesidad transicional, no como primera opcion si existe app Fiori equivalente.

## Query pattern reutilizable

```powershell
$base = 'https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata'
$id = 'F3893'
$url = "$base/InputFilterParam(InpFilterValue='$id')/Results?`$format=json&`$select=appId,AppName,ApplicationType,RoleName,releaseId,BusinessCatalog,ApplicationComponent,PrimaryPVOfficialNameCombined"
Invoke-RestMethod -Uri $url -UseBasicParsing
```

Ejemplo de deep link FARL:

```text
https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/#/detail/Apps('F3893')/S32PCE
```

## Siguientes acciones

1. Validar el inventario con owners de Lead-to-Cash, Order-to-Cash, Finance AR, Tax y Logistics.
2. Conectar cada app con scope item, business role, test script y control esperado.
3. Completar matriz de fit/gap por variante: venta estandar, exportacion, devolucion, anticipo, credito, cobranza y Mexico CFDI.
4. Confirmar activacion en tenant sandbox, catalogs asignados y launchpad spaces/pages.
5. Preparar el siguiente catalogo E2E usando la plantilla estandar.
