# Inventario SAP Fiori Apps Procure-to-Pay / Source-to-Pay

Fecha de preparacion: 2026-07-13

## Alcance y fuentes

Este entregable consolida una revision de SAP Fiori Apps Reference Library para construir una base de conocimiento reutilizable en implementaciones futuras de SAP S/4HANA, enfocada en Source-to-Pay y Procure-to-Pay. El alcance parte del contexto TS450/TS452 y cubre abastecimiento, compras, recepcion, inventario, servicios, verificacion de factura, GR/IR, controles, analitica y handoff financiero.

Fuentes oficiales consultadas:

- SAP Fiori Apps Reference Library: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/
- Servicio OData publico de referencia de apps: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/
- Metadata OData consultado: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/$metadata
- Lista de releases consultada: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/Releases

La SAP Fiori Apps Reference Library se uso como fuente primaria para app IDs, nombres oficiales, tipo de aplicacion, rol, business catalog, technical catalog, componente y senal de version.

## Release anchor vigente

La consulta de releases al 2026-07-13 devolvio como versiones mas recientes:

| Deployment model | Release ID | Nombre en FARL | Uso en este inventario |
| --- | --- | --- | --- |
| SAP S/4HANA Private Cloud / On-Premise | S32PCE | S/4HANA 2025 FPS01 - PCE | Anchor principal para inventario privado/PCE |
| SAP S/4HANA On-Premise | S32OP | S/4HANA 2025 FPS01 | Referencia on-premise equivalente |
| SAP S/4HANA Public Cloud | S36 | S/4HANA Cloud 2602 | Senal de disponibilidad Public Cloud cuando aparece en ProductVersion |

## Metodo de consulta

Se consulto el entity set `InputFilterParam(InpFilterValue='1NA')/Results` del servicio `SingleApp.xsodata`, filtrando por terminos e IDs relacionados con TS450/TS452 y el ciclo Source-to-Pay / Procure-to-Pay. Los campos usados para la matriz fueron:

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

La columna `Public Cloud 2602` se marco como `Si` cuando el campo `PrimaryPVOfficialNameCombined` incluyo `SAP S/4HANA Cloud Public Edition 2602`. Si el resultado no lo incluyo, se marco como `No / validar`; esto no prueba indisponibilidad absoluta, solo indica que la senal no aparecio en la fila consultada.

## Mapa E2E

| Etapa E2E | Objetivo de negocio | Apps candidatas |
| --- | --- | --- |
| Estrategia y analitica de gasto | Identificar gasto, leakage y oportunidades de abastecimiento | F0683, F0572, F3679, F1990 |
| Sourcing y cotizaciones | Gestionar RFQs, supplier quotations, comparacion y proyectos de sourcing | F2049, F1991, F2324, F4861A, F4862, F4863 |
| Fuentes y contratos | Mantener contratos, source lists, info records, quota y scheduling agreements | F1600A, F3144, F1859, F1982, F1877, F2179, F3143 |
| Solicitud de compra | Crear, revisar, procesar y monitorear purchase requisitions | F1643A, F1639A, F2229, F1048A, F2424, ME51N, ME57 |
| Aprobaciones y workflow | Aprobar PR, PO, contratos, SES y configurar workflows | F0401A, F0402A, F0400A, F2446, F2872, F3043, F3044, F5289, F6194 |
| Pedido y confirmacion | Gestionar purchase orders, supplier confirmations y monitoreo de PO items | F0842A, F2358, F5039, F2359 |
| Recepcion e inventario | Recibir mercancia, transferir stock, consultar stock y ejecutar inventario fisico | F0843, F3244, MIGO, F1061, F1957, F1062, F1076, F0379A |
| Servicios | Gestionar service entry sheets y aprobaciones de servicios | F2027, F2446 |
| Factura y excepciones | Registrar, listar, gestionar y desbloquear supplier invoices | F0859, F1060A, MIRO, MRBR |
| GR/IR, ERS y cierre financiero | Resolver GR/IR, ejecutar ERS y conectar con Record-to-Report | MR11, MRRL, F2257, F0712, F0770 |
| Datos maestros | Mantener supplier, business partner y product master | F1053A, F3163, F1602 |
| Supplier performance | Evaluar proveedores y monitorear confirmaciones | F1662A, F1664A, F1576, F2359 |

## Inventario curado

| Proceso | App ID | App oficial | Tipo | Rol FARL | Release anchor | Public Cloud 2602 | Catalogo principal observado | Componente |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Requisicion autoservicio | F1643A | Create Purchase Requisition - New | Transactional | Employee - Procurement | S32PCE | Si | SAP_PRC_BC_SSPPR_EMPLOYEE | MM-FIO-PUR-REQ-SSP |
| Requisicion autoservicio | F1639A | My Purchase Requisitions - New | Transactional | Employee - Procurement | S32PCE | Si | SAP_PRC_BC_SSPPR_EMPLOYEE | MM-FIO-PUR-REQ-SSP |
| Requisicion profesional | F2229 | Manage Purchase Requisition Professional | Transactional | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PR | MM-FIO-PUR-REQ-PRF |
| Procesamiento de requisiciones | F1048A | Process Purchase Requisitions ( Version 2 ) | Transactional | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PR | MM-FIO-PUR-REQ-SOC |
| Requisicion fallback | ME51N | Create Purchase Requisition - Advanced | SAP GUI | Other | S32PCE | Si | SAP_PRC_BC_PURCHASER_PR | MM-PUR |
| Procesamiento fallback | ME57 | Assign and Process Purchase Requisitions | SAP GUI | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PR | MM-PUR |
| Aprobacion PR | F0401A | My Inbox - Approve Purchase Requisitions | Transactional | Manager - Procurement | S32PCE | Si | SAP_FND_BC_MANAGER_T | MM-FIO-PUR-REQ-SSP |
| Monitoreo PR | F2424 | Monitor Purchase Requisition Items | Analytical | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PR | MM-PUR-GF-MON |
| Pedido de compra | F0842A | Manage Purchase Orders (Version 2) | Transactional | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PO | MM-FIO-PUR-PO |
| Aprobacion PO | F0402A | My Inbox - Approve Purchase Order | Transactional | Purchasing Manager | S32PCE | Si | SAP_PRC_BC_PURCHASING_MNGR | MM-FIO-PUR-PO-WFL |
| Monitoreo PO | F2358 | Monitor Purchase Order Items | Analytical | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PO | MM-PUR-GF-MON |
| Contratos | F1600A | Manage Purchase Contracts (Version 2) | Transactional | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PUC | MM-FIO-PUR-SQ-CON |
| Aprobacion contratos | F0400A | My Inbox - Approve Purchase Contracts | Transactional | Manager - Procurement | S32PCE | No / validar | Without Catalog Assignment | MM-FIO-PUR-SQ-CON |
| Scheduling agreements | F2179 | Manage Scheduling Agreement | Transactional | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PUC | MM-FIO-PUR-SQ-SCH |
| Workflow scheduling agreements | F3044 | Manage Workflows for Scheduling Agreements | Transactional | Configuration Expert - Business Process Configuration | S32PCE | Si | SAP_PRC_BC_CONFIG | MM-FIO-PUR-SQ-SCH |
| Monitoreo scheduling agreements | F3143 | Monitor Scheduling Agreement Items | Transactional | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PUC | MM-FIO-PUR-ANA |
| RFQ | F2049 | Manage RFQs | Transactional | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PIR | MM-FIO-PUR-RFQ |
| Supplier quotations | F1991 | Manage Supplier Quotations | Transactional | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PIR | MM-FIO-PUR-RFQ |
| Comparacion cotizaciones | F2324 | Compare Supplier Quotations | Transactional | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PIR | MM-PUR-RFQ |
| Source list | F1859 | Manage Source Lists | Transactional | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PIR | MM-FIO-PUR-SQ-SL |
| Info records | F1982 | Manage Purchasing Info Records | Transactional | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PIR | MM-FIO-PUR-IR |
| Quota arrangements | F1877 | Manage Quota Arrangements | Transactional | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PIR | MM-PUR-SQ-QTA |
| Central contracts | F3144 | Manage Central Purchase Contracts | Transactional | Purchaser - Central Procurement | S32PCE | Si | SAP_PRC_BC_PURCHASER_CPC | MM-PUR-HUB-CTR |
| Sourcing project | F4861A | Manage Sourcing Projects (Version 2) | Transactional | Sourcing Manager | S32PCE | No / validar | SAP_PRC_BC_PURCHASER_SRC | MM-PUR-SRC-SP |
| Sourcing quotation | F4862 | Manage Supplier Quotations (Sourcing Project) | Transactional | Sourcing Manager | S32PCE | No / validar | SAP_PRC_BC_PURCHASER_SRC | MM-PUR-SRC-SPQ |
| Sourcing comparison | F4863 | Compare Supplier Quotations (Sourcing Project) | Transactional | Sourcing Manager | S32PCE | No / validar | SAP_PRC_BC_PURCHASER_SRC | MM-PUR-SRC-SPQ |
| Workflow sourcing | F5289 | Manage Workflows for Sourcing Projects | Transactional | Configuration Expert - Business Process Configuration | S32PCE | No / validar | SAP_PRC_BC_CONFIG | MM-PUR-SRC-SP |
| Supplier master | F1053A | Manage Supplier Master Data | Transactional | Master Data Specialist - Business Partner Data | S32PCE | Si | SAP_CMD_BC_SUPPLIER_MAINT | LO-MD-FIO-VM |
| Business partner | F3163 | Manage Business Partner Master Data | Transactional | Master Data Specialist - Business Partner Data | S32PCE | Si | SAP_CMD_BC_BP_MAINT | LO-MD-BP |
| Product master | F1602 | Manage Product Master | Transactional | Master Data Specialist - Product Data | S32PCE | Si | SAP_CMD_BC_PR_MAINT | LO-MD-MM |
| Service entry | F2027 | Manage Service Entry Sheets - Lean Services | Transactional | Employee - Procurement | S32PCE | Si | SAP_PRC_BC_PURCHASER_SES | MM-PUR-SVC-SES |
| Aprobacion SES | F2446 | My Inbox - Approve Service Entry Sheets | Transactional | Employee - Procurement | S32PCE | Si | Without Catalog Assignment | MM-FIO-SRV |
| Confirmacion recepcion | F4489 | Confirm Receipt of Goods-New | Transactional | Others | S32PCE | Si | SAP_PRC_BC_EMPLOYEE | MM-PUR-HUB-CNF |
| Goods receipt | F0843 | Post Goods Receipt for Purchasing Document | Transactional | Warehouse Clerk | S32PCE | Si | SAP_MM_BC_IM_GR_PROCESS | MM-FIO-IM-SGM |
| Goods receipt sin referencia | F3244 | Post Goods Receipt without Reference | Transactional | Warehouse Clerk | S32PCE | Si | SAP_MM_BC_IM_GR_PROCESS | MM-FIO-IM-SGM |
| Goods movement fallback | MIGO | Goods Movement, Post Goods Movement | SAP GUI | Other | S32PCE | Si | SAP_MM_BC_IM_PROCESS | MM-IM |
| Transfer stock in plant | F1061 | Transfer Stock - In Plant | Transactional | Warehouse Clerk | S32PCE | Si | SAP_MM_BC_IM_PROCESS | MM-FIO-IM-SGM |
| Transfer stock cross-plant | F1957 | Transfer Stock - Cross-Plant | Transactional | Warehouse Clerk | S32PCE | Si | SAP_MM_BC_IM_PROCESS | MM-FIO-IM-SGM |
| Stock management | F1062 | Manage Stock | Transactional | Inventory Manager | S32PCE | Si | SAP_MM_BC_IM_MANAGE | MM-FIO-IM-SGM |
| Stock analytics | F1076 | Stock - Single Material | Analytical | Inventory Manager | S32PCE | Si | SAP_MM_BC_IM_MANAGE | MM-FIO-IM-SGM |
| Physical inventory | F0379A | Manage Physical Inventory Documents | Transactional, Fact sheet | Inventory Manager | S32PCE | Si | SAP_MM_BC_IM_PI_MANAGE | MM-FIO-IM-PI |
| Supplier invoice | F0859 | Manage Supplier Invoices | Transactional | Accounts Payable Accountant - Procurement | S32PCE | Si | SAP_PRC_BC_INVOICER | MM-FIO-IV |
| Supplier invoice list | F1060A | Supplier Invoices List (Version 2) | Transactional | Accounts Payable Accountant - Procurement | S32PCE | Si | SAP_PRC_BC_INVOICER | MM-FIO-IV |
| Supplier invoice fallback | MIRO | Create Supplier Invoice - Advanced | SAP GUI | Other | S32PCE | Si | SAP_PRC_BC_INVOICER | MM-IV-LIV |
| Blocked invoices | MRBR | Release Blocked Invoices | SAP GUI | Accounts Payable Accountant - Procurement | S32PCE | Si | SAP_PRC_BC_INVOICER | MM-IV-LIV |
| GR/IR clearing | MR11 | Clear GR/IR Accounts, Clear GR/IR Clearing Account | SAP GUI | Other | S32PCE | Si | SAP_SFIN_BC_IA_PER_GRIR | MM-IV-CA |
| ERS | MRRL | Create Evaluated Receipt Settlement | SAP GUI | Other | S32PCE | Si | Without Catalog Assignment | MM-IV-LIV |
| Procurement overview | F1990 | Procurement Overview Page | Transactional, Analytical | Purchaser | S32PCE | Si | SAP_PRC_BC_PRC_OVP | MM-PUR-HBA |
| Spend analytics | F0683 | Purchasing Spend | Analytical | Strategic Buyer | S32PCE | Si | SAP_PRC_BC_PURCH_ANALYTICS | MM-FIO-PUR-ANA |
| Contract leakage | F0572 | Off-Contract Spend | Analytical | Strategic Buyer | S32PCE | Si | SAP_PRC_BC_PURCH_ANALYTICS | MM-FIO-PUR-ANA |
| Global spend analytics | F3679 | Global Purchasing Spend | Analytical | Strategic Buyer | S32PCE | Si | SAP_PRC_BC_PUR_CNTRL_ANA | MM-FIO-PUR-ANA |
| Supplier evaluation | F1662A | Operational Supplier Evaluation (Version 2) | Analytical | Strategic Buyer | S32PCE | Si | SAP_PRC_BC_PURCH_ANALYTICS | MM-FIO-PUR-ANA |
| Supplier delivery performance | F1664A | Supplier Evaluation by Time (Version 2) | Analytical | Strategic Buyer | S32PCE | Si | SAP_PRC_BC_PURCH_ANALYTICS | MM-FIO-PUR-ANA |
| Supplier evaluation response | F1576 | Supplier Evaluation Response | Transactional | Strategic Buyer | S32PCE | Si | SAP_PRC_BC_CATEGORY_MGT | SLC-EVL |
| Supplier confirmations | F5039 | Manage Supplier Confirmations | Transactional | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_CONF | MM-PUR-GF-CON |
| Monitor supplier confirmations | F2359 | Monitor Supplier Confirmations | Analytical | Purchaser | S32PCE | Si | SAP_PRC_BC_PURCHASER_PO | MM-PUR-GF-MON |
| Workflow supplier confirmations | F6194 | Manage Workflows for Supplier Confirmations | Transactional | Configuration Expert - Business Process Configuration | S32PCE | Si | SAP_PRC_BC_CONFIG | MM-PUR-CNF-WFL |

## Observaciones de implementacion

1. Preferir las apps versionadas nuevas cuando FARL muestra una variante reciente: `F1643A`, `F1639A`, `F1048A`, `F0842A`, `F1600A`, `F1060A`, `F1662A` y `F1664A`.
2. Mantener SAP GUI como fallback controlado para escenarios avanzados o tecnicos: `ME51N`, `ME57`, `MIGO`, `MIRO`, `MRBR`, `MR11` y `MRRL`. No asumir uso final sin diseno de roles, auditoria y controles.
3. Source-to-Pay se debe mapear por buying channel: autoservicio, comprador profesional, sourcing project, central procurement, contratos, scheduling agreements y compras por servicios.
4. Procurement workflow requiere validacion especifica por documento: PR, PO, contrato, scheduling agreement, service entry sheet, supplier confirmation y sourcing project.
5. Logistics Invoice Verification debe conectarse con Record-to-Report para GR/IR, impuestos, bloqueos, payment proposal y evidencia de auditoria.
6. La senal Public Cloud `Si` no sustituye scope item, business role ni activacion de tenant.

## Overlay Mexico

Para implementaciones en Mexico, agregar validaciones especificas antes de cerrar fit-to-standard:

- CFDI de proveedor y evidencia XML/PDF vinculada a supplier invoice, pedido, entrada de mercancia/servicio y pago.
- Complementos de pago cuando aplique el ciclo de pago y conciliacion financiera.
- Carta Porte cuando el proceso incluya traslado de bienes y sea relevante para evidencia logistica/fiscal.
- Retenciones, IVA, moneda extranjera, tipo de cambio, diferencias y tratamiento contable/fiscal.
- Segregacion de funciones entre requester, purchaser, receiver, AP accountant, approver, master data y pagos.
- Controles sobre cambios de proveedor, datos bancarios, contratos, source lists, info records y tolerancias de factura.
- Evidencia para auditoria: PR, PO, aprobaciones, GR/SES, factura, bloqueo/desbloqueo, GR/IR, pago y CFDI/complementos.

## Gaps de validacion

- Este inventario no prueba que las apps esten activadas, licenciadas o autorizadas en un tenant especifico.
- FARL puede devolver apps SAP GUI, Web Dynpro, transaccionales, analiticas y remotas; la seleccion final depende de edition, scope, roles y arquitectura.
- Las apps de sourcing project `F4861A`, `F4862`, `F4863` y `F5289` no mostraron senal `SAP S/4HANA Cloud Public Edition 2602` en la fila consultada; validar alcance por deployment model.
- Scheduling agreements, ERS, GR/IR y factura pueden requerir validacion adicional de configuracion, procesos de excepcion y controles contables.
- Validar business roles, catalogs, spaces/pages, OData services, ICF nodes, SAP Notes, product versions, extensibilidad y restricciones por edition directamente en FARL y en el landscape del cliente.

## Query pattern reutilizable

Ejemplo de consulta OData por app ID:

```text
https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/InputFilterParam(InpFilterValue='1NA')/Results?$format=json&$select=appId,AppName,ApplicationType,RoleName,releaseId,releaseGroupText,BusinessCatalog,TechnicalCatalog,ApplicationComponent,PrimaryPVOfficialNameCombined&$filter=appId eq 'F0842A'
```

Ejemplo de deep link FARL:

```text
https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/#/detail/Apps('F0842A')/S32PCE
```

## Siguientes acciones

1. Convertir este inventario en matriz fit-to-standard por subproceso: Sourcing, Contracts, Requisitioning, Purchasing, Receiving, Services, Invoice Verification, GR/IR, Inventory y Analytics.
2. Crear matriz por rol: Employee - Procurement, Purchaser, Strategic Buyer, Sourcing Manager, Purchasing Manager, Warehouse Clerk, Inventory Manager, Accounts Payable Accountant - Procurement y Configuration Expert.
3. En cada proyecto, validar FARL contra tenant: apps visibles, business catalogs, spaces/pages, autorizaciones, workflows, OData/ICF y restricciones por edition.
4. Para Mexico, agregar evidencia CFDI, complementos de pago, Carta Porte, controles de aprobacion y trazabilidad fiscal por escenario de prueba.
