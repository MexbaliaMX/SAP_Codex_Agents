# Inventario SAP Fiori Apps Plan-to-Produce

Fecha de preparacion: 2026-07-13

## Alcance y fuentes

Este entregable consolida una revision de SAP Fiori Apps Reference Library para construir una base de conocimiento reutilizable en implementaciones futuras de SAP S/4HANA, enfocada en Plan-to-Produce. El alcance cubre demanda, PIR, MRP, planned orders, produccion discreta, process manufacturing, work centers, routings, production versions, capacity, staging, inventario, calidad, confirmaciones, lean/Kanban, costing y handoff a Record-to-Report.

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

## Mapa E2E

| Etapa E2E | Objetivo de negocio | Apps candidatas |
| --- | --- | --- |
| Datos maestros de producto | Mantener producto, batches y datos base de planificacion | F1602, F2462 |
| Demanda y PIR | Mantener PIRs, copiar forecast y reorganizar demanda | F3445, F2579, F2580, MD61, MD62, MD63 |
| MRP y excepciones | Ejecutar MRP, revisar cobertura, problemas de datos maestros y situaciones MRP | F1339, F0247A, F0251A, F2101A, F1425A, F1426, F3853 |
| Requerimientos y handoff a compras | Gestionar requerimientos internos/externos y purchase requisitions resultantes | F0250, F0270, F4795, F5416, F5417, F5418, F5725 |
| Planned orders | Gestionar, convertir y programar planned orders | F4170, F4171, F1718 |
| Ordenes de produccion | Gestionar, monitorear, liberar y completar production orders | F2336, F2335, F0273, F0266A, F1719, F3841, F7044, CO01, CO02, CO03 |
| Process orders | Gestionar process orders y operaciones de proceso | F4587, F5323, F2263 |
| Confirmacion de produccion | Confirmar operaciones y revisar confirmation object pages | F2265, F2266, CO11N |
| Work centers y capacidad | Gestionar work centers, grupos, capacidad y areas de responsabilidad | F2262, F4044, F3289, F5381, F5266, F6716 |
| Routings y production versions | Gestionar routings y versiones de produccion | F5425, F2568, F6400 |
| Staging, reservas e inventario | Gestionar GR de produccion/proceso, stock, reservas y documentos de material | F3110, F6352, F1062, F1076, F1595, F1077, F4839, F5601, MIGO |
| Calidad | Gestionar inspection lots, resultados, usage decisions, defects y analitica QM | F2343, F1685A, F3365, F2345, F3239, F3273, F2929, QA32, QE51N, QA11 |
| Lean/Kanban y supply to production | Ejecutar Kanban, supply areas y replenishment a produccion | F3717, F4630, F5723, F6935, F4535 |
| Costing y cierre financiero | Analizar costos, WIP, event-based postings, actual costing y accounting line items | F1780, F3331, F3498, F4059, F4254, F6248, F7288, F5132, F5133, F3683, F6073, F4095 |

## Inventario curado

| Proceso | App ID | App oficial | Tipo | Rol FARL | Release anchor | Public Cloud 2602 | Catalogo principal observado | Componente |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Product master | F1602 | Manage Product Master | Transactional | Master Data Specialist - Product Data | S32PCE | Si | SAP_CMD_BC_PR_MAINT | LO-MD-MM |
| Batch management | F2462 | Manage Batches | Transactional | Inventory Manager | S32PCE | Si | SAP_SCM_BC_BATCH_MGMT | LO-BM-FIO |
| PIR | F3445 | Maintain PIRs | Transactional | Material Planner - External Procurement | S32PCE | Si | SAP_SCM_BC_FCDM_MAINTAIN | PP-FIO-MRP |
| Forecast to PIR | F2579 | Schedule Copy Total Forecast Runs | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_FCDM_MAINTAIN | PP-MP-DEM |
| PIR reorganization | F2580 | Schedule PIR Reorganizing Runs | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_FCDM_MAINTAIN | PP-MP-DEM |
| MRP run | F1339 | Schedule MRP Runs | Transactional | Material Planner - External Procurement | S32PCE | Si | SAP_SCM_BC_MRPRUN | PP-FIO-MRP |
| MRP master data | F1425A | Display MRP Master Data Issues | Transactional | Material Planner - External Procurement | S32PCE | Si | SAP_SCM_BC_MRPCOCKPIT | PP-FIO-MRP |
| MRP analytics | F1426 | Display MRP Key Figures | Transactional | Material Planner - External Procurement | S32PCE | Si | SAP_SCM_BC_MRPCOCKPIT | PP-FIO-MRP |
| Material coverage | F0247A | Monitor Material Coverage (Version 2) | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_MRPCOCKPIT | PP-FIO-MRP |
| Material coverage | F0251A | Manage Material Coverage (Version 2) | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_MRPCOCKPIT | PP-FIO-MRP |
| Material coverage segments | F2101A | Monitor Material Coverage - Net and Individual Segments (Version 2) | Transactional | Production Planner | S32PCE | No / validar | SAP_SCM_BC_MRPCOCKPIT | PP-FIO-MRP |
| External requirements | F0250 | Manage External Requirements | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_MRPCOCKPIT | PP-FIO-MRP |
| Internal requirements | F0270 | Manage Internal Requirements | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_MRPCOCKPIT | PP-FIO-MRP |
| MRP situations | F3853 | Detect MRP Situations | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_MRPCOCKPIT | PP-FIO-MRP |
| MRP to procurement | F4795 | Hand Over Purchase Requisitions | Transactional | Material Planner - External Procurement | S32PCE | Si | SAP_SCM_BC_MRPCOCKPIT | PP-FIO-MRP |
| MRP responsibility | F4796 | My Area of Responsibility - MRP Controller | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_MRPCOCKPIT | PP-FIO-MRP |
| MRP change request | F5416 | Create MRP Change Requests | Transactional | Material Planner - External Procurement | S32PCE | Si | SAP_SCM_BC_PLNG_EXT_PROCMT | PP-FIO-MRP |
| MRP rescheduling | F5417 | Schedule MRP Rescheduling Checks | Transactional | Material Planner - External Procurement | S32PCE | Si | SAP_SCM_BC_PLNG_EXT_PROCMT | PP-FIO-MRP |
| MRP change request send | F5418 | Schedule Sending of MRP Change Requests | Transactional | Material Planner - External Procurement | S32PCE | Si | SAP_SCM_BC_PLNG_EXT_PROCMT | PP-FIO-MRP |
| MRP change request processing | F5725 | Schedule Processing of MRP Change Requests | Transactional | Material Planner - External Procurement | S32PCE | Si | SAP_SCM_BC_PLNG_EXT_PROCMT | PP-FIO-MRP |
| Planned orders | F4170 | Manage Planned Orders | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_PLND_ORD_MGMT | PP-FIO-PLO |
| Planned order conversion | F4171 | Convert Planned Orders | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_PLND_ORD_MGMT | PP-FIO-PLO |
| Planned order conversion jobs | F1718 | Schedule Order Conversion Runs | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_PLND_ORD_MGMT | PP-FIO-MRP |
| Production orders | F2336 | Manage Production Orders | Transactional | Production Supervisor - Discrete Manufacturing | S32PCE | Si | SAP_SCM_BC_PRODN_ORD_MNTR | PP-FIO-SFC |
| Production operations | F2335 | Manage Production Operations | Transactional | Production Supervisor - Discrete Manufacturing | S32PCE | Si | SAP_SCM_BC_PRODN_ORD_MNTR | PP-FIO-SFC |
| Production/process orders | F0273 | Manage Production Orders or Process Orders | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_PLNG_INH_PRODN | PP-FIO-MRP |
| Production/process monitoring | F0266A | Monitor Production Orders or Process Orders (Version 2) | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_PLNG_INH_PRODN | PP-FIO-MRP |
| Order release jobs | F1719 | Schedule Order Release Run | Transactional | Production Supervisor - Discrete Manufacturing | S32PCE | Si | SAP_SCM_BC_PRODN_ORD_MGMT | PP-FIO-SFC |
| Technical completion jobs | F3841 | Schedule Order Technical Completion Run | Transactional | Others | S32PCE | Si | SAP_SCM_BC_PRODN_ORD_MGMT | PP-SFC |
| Supervisor responsibility | F7044 | My Area of Responsibility - Production Supervisor | Transactional | Production Supervisor - Process Manufacturing | S32PCE | Si | SAP_SCM_BC_PRODN_ORD_MNTR | PP-FIO-SFC |
| Production order fact sheet | F2261 | Production Order Object Page | Fact sheet | Production Planner | S32PCE | Si | SAP_SCM_BC_MFG_ORD_OBJ_PGS | PP-FIO-SFC |
| Process order fact sheet | F2263 | Process Order Object Page | Fact sheet | Production Planner | S32PCE | Si | SAP_SCM_BC_MFG_ORD_OBJ_PGS | PP-FIO-PI |
| Process orders | F4587 | Manage Process Orders | Transactional | Production Supervisor - Process Manufacturing | S32PCE | Si | SAP_SCM_BC_PROC_ORD_MGMT | PP-FIO-PI |
| Process order operations | F5323 | Manage Process Order Operations | Transactional | Production Supervisor - Process Manufacturing | S32PCE | Si | SAP_SCM_BC_PROC_ORD_MGMT | PP-FIO-PI |
| ATP production/planned orders | F3456 | Schedule ATP Run for Production/Planned Orders | Transactional | Others | S32PCE | Si | SAP_SCM_BC_PRODN_ORD_MGMT | PP-SFC |
| Production confirmation fact sheet | F2265 | Production Order Confirmation Object Page | Fact sheet | Production Supervisor - Discrete Manufacturing | S32PCE | Si | SAP_SCM_BC_MFG_CNF_OBJ_PGS | PP-FIO-SFC |
| Process confirmation fact sheet | F2266 | Process Order Confirmation Object Page | Fact sheet | Production Supervisor - Process Manufacturing | S32PCE | Si | SAP_SCM_BC_MFG_CNF_OBJ_PGS | PP-FIO-PI |
| Production versions | F2568 | Manage Production Versions | Transactional | Production Engineer - Discrete Manufacturing | S32PCE | No / validar | SAP_SCM_BC_PROC_ENG | PP-PEO |
| Production versions | F6400 | Process Production Versions | Transactional | Others | S32PCE | Si | SAP_SCM_BC_PROC_ENG | PP-PI-MD-PRV |
| Routings | F5425 | Manage Routings | Transactional | Production Engineer - Discrete Manufacturing | S32PCE | Si | SAP_SCM_BC_PROC_ENG | PP-BD-RTG |
| Work center fact sheet | F2262 | Work Center Object Page | Fact sheet | Production Planner | S32PCE | Si | SAP_SCM_BC_MFG_MD_OBJ_PGS | PP-FIO-BD |
| Work center groups | F4044 | Manage Work Center Groups | Transactional | Production Engineer - Discrete Manufacturing (Manufacturing Engineering) | S32PCE | Si | SAP_SCM_BC_PROC_ENG | PP-BD-WKC |
| Work center capacity | F3289 | Manage Work Center Capacity | Transactional, Analytical | Production Planner | S32PCE | Si | SAP_SCM_BC_CFS | PP-CFS-CE |
| Work center capacities | F5381 | Mass Maintenance Of Work Center Capacities | Transactional | Production Planner | S32PCE | Si | SAP_SCM_BC_CFS | PP-BD-WKC |
| Work center responsibility | F5266 | My Area of Responsibility - Work Center Groups | Transactional | Others | S32PCE | Si | SAP_SCM_BC_CFS | PP-FIO-MRP |
| Work center person responsible | F6716 | My Area of Responsibility - Work Center Person Responsible | Transactional | Others | S32PCE | Si | SAP_SCM_BC_CFS | PP-BD-WKC |
| GR production order | F3110 | Post Goods Receipt for Production Order | Transactional | Warehouse Clerk | S32PCE | Si | SAP_MM_BC_IM_GR_PROCESS | MM-FIO-IM-SGM |
| GR process order | F6352 | Post Goods Receipt for Process Order | Transactional | Warehouse Clerk | S32PCE | Si | SAP_MM_BC_IM_GR_PROCESS | MM-FIO-IM-SGM |
| Stock management | F1062 | Manage Stock | Transactional | Inventory Manager | S32PCE | Si | SAP_MM_BC_IM_MANAGE | MM-FIO-IM-SGM |
| Stock single material | F1076 | Stock - Single Material | Analytical | Inventory Manager | S32PCE | Si | SAP_MM_BC_IM_MANAGE | MM-FIO-IM-SGM |
| Stock multiple materials | F1595 | Stock - Multiple Materials | Analytical | Inventory Manager | S32PCE | Si | SAP_MM_BC_IM_MONITORING | MM-FIO-IM-SGM |
| Material documents | F1077 | Material Documents Overview | Analytical | Warehouse Clerk | S32PCE | Si | SAP_MM_BC_IM_PROCESS_OVP | MM-FIO-IM-SGM |
| Reservations | F4839 | Manage Manual Reservations | Transactional | Warehouse Clerk | S32PCE | Si | SAP_MM_BC_IM_RESV_PROCESS | MM-FIO-IM-RSV |
| Reservation items | F5601 | Manage Reservation Items | Transactional | Warehouse Clerk | S32PCE | Si | SAP_MM_BC_IM_RESV_PROCESS | MM-FIO-IM-RSV |
| Inspection lots | F2343 | Manage Inspection Lots | Transactional | Quality Technician | S32PCE | Si | SAP_QM_BC_INSPECTION_LOT | QM-FIO-IM |
| Inspection results | F1685A | Record Inspection Results (Version 2) | Transactional | Quality Technician | S32PCE | Si | SAP_QM_BC_RESULT_RECG | QM-FIO |
| Inspection results table | F3365 | Record Inspection Results in Table Form | Transactional | Quality Technician | S32PCE | Si | SAP_QM_BC_RESULT_RECG | QM-IM-RR |
| Usage decisions | F2345 | Manage Usage Decisions | Transactional | Quality Engineer | S32PCE | Si | SAP_QM_BC_USAGE_DECISION | QM-FIO-IM |
| Inspection lot analytics | F3239 | Inspection Lot Analytics | Transactional, Analytical | Quality Manager | S32PCE | Si | SAP_QM_BC_ANALYTICS | QM-QC-IS |
| Inspection lot detailed analytics | F3273 | Inspection Lot Detailed Analytics | Transactional, Analytical | Quality Manager | S32PCE | Si | SAP_QM_BC_ANALYTICS | QM-QC-IS |
| Defects | F2929 | Record Defects | Transactional | Quality Technician | S32PCE | Si | SAP_QM_BC_DEFECT | QM-QN-DEF |
| Production cost analysis | F1780 | Production Cost Analysis | Analytical | Cost Accountant - Production | S32PCE | Si | SAP_SFIN_BC_PRD_PB_REP | CO-FIO-OBJ-IS |
| Costs by work center | F3331 | Analyze Costs by Work Center/Operation | Analytical | Cost Accountant - Production | S32PCE | Si | SAP_SFIN_BC_PRD_PB_REP | CO-FIO-OBJ-IS |
| WIP event-based | F3498 | Work in Process - Event-Based | Analytical | Cost Accountant - Production | S32PCE | Si | SAP_SFIN_BC_PRD_EB_REP | CO-FIO-OBJ-IS |
| Production costs event-based | F4059 | Analyze Production Costs - Event-Based | Analytical | Cost Accountant - Production | S32PCE | Si | SAP_SFIN_BC_PRD_EB_REP | CO-FIO-OBJ-IS |
| Order cost details | F4254 | Order Costs Details - Event-Based | Analytical | Cost Accountant - Production | S32PCE | Si | SAP_SFIN_BC_PRD_EB_REP | CO-FIO-OBJ-IS |
| Production cost overview | F6248 | Production Cost Overview - Event-Based | Analytical | Cost Accountant - Production | S32PCE | Si | SAP_SFIN_BC_PRD_EB_REP | CO-FIO-OBJ-IS |
| Production accounting line items | F7288 | Display Line Items - Production Accounting | Analytical | Cost Accountant - Production | S32PCE | Si | SAP_SFIN_BC_PRD_PB_REP | CO-FIO-OBJ-IS |
| Product costing errors | F5132 | Manage Event-Based Posting Errors - Product Costing | Transactional | Cost Accountant - Production | S32PCE | Si | SAP_SFIN_BC_PRD_EB_PED | CO-FIO-OBJ-CL |
| Product costing monitor | F5133 | Event-Based Solution Monitor - Product Costing | Transactional | Cost Accountant - Production | S32PCE | Si | SAP_SFIN_BC_PRD_EB_PED | CO-FIO-OBJ-CL |
| Product costing jobs | F3683 | Schedule Product Costing Jobs | Transactional | Cost Accountant - Production | S32PCE | Si | SAP_SFIN_BC_PRD_EB_PED | CO-FIO-OBJ-CL |
| Actual costing | F6073 | Display Actual Costing Result | Analytical | Cost Accountant - Inventory | S32PCE | Si | SAP_SFIN_BC_IA_AC_REP | CO-FIO-ACT |
| Material value chain | F4095 | Display Material Value Chain | Analytical | Cost Accountant - Inventory | S32PCE | Si | SAP_SFIN_BC_IA_AC_REP | CO-FIO-ACT |
| Kanban status | F3717 | Set Kanban Container Status | Transactional | Production Operator - Lean Manufacturing | S32PCE | Si | SAP_SCM_BC_KNBN_CNTNR_PROC | PP-KAB-FIO |
| Kanban board | F4630 | Kanban Board | Transactional | Production Planner - Lean Manufacturing | S32PCE | Si | SAP_SCM_BC_KNBN_MNTRG | PP-KAB-FIO |
| Kanban monitoring | F5723 | Monitor Kanban Containers | Transactional | Production Supervisor - Lean Manufacturing | S32PCE | Si | SAP_SCM_BC_KNBN_MNTRG | PP-KAB-FIO |
| Production supply areas | F6935 | Manage Production Supply Areas | Transactional | Production Planner - Lean Manufacturing | S32PCE | Si | SAP_SCM_BC_KNBN_CTRLC_MGMT | PP-KAB-FIO |
| Supply to production | F4535 | Plan Supply to Production | Transactional | Production Supervisor - Lean Manufacturing | S32PCE | No / validar | SAP_LE_BC_PRODN_REPLN_PLNG | LE-JIT |

## Fallbacks SAP GUI controlados

| Proceso | App ID | App oficial FARL | Tipo | Release anchor | Public Cloud 2602 | Catalogo principal observado | Componente |
| --- | --- | --- | --- | --- | --- | --- | --- |
| PIR fallback | MD61 | Create PIRs | SAP GUI | S32PCE | Si | SAP_SCM_BC_FCDM_MAINTAIN | PP-MRP |
| PIR fallback | MD62 | Change PIRs | SAP GUI | S32PCE | Si | SAP_SCM_BC_FCDM_MAINTAIN | PP-MRP |
| PIR fallback | MD63 | Display PIRs | SAP GUI | S32PCE | Si | SAP_SCM_BC_FCDM_MAINTAIN | PP-MRP |
| Production order fallback | CO01 | Create Production Order | SAP GUI | S32PCE | Si | SAP_SCM_BC_PRODN_ORD_MGMT | PP-SFC |
| Production order fallback | CO02 | Change Production Order | SAP GUI | S32PCE | Si | SAP_SCM_BC_PRODN_ORD_MGMT | PP-SFC |
| Production order fallback | CO03 | Display Production Order | SAP GUI | S32PCE | Si | SAP_SCM_BC_PRODN_ORD_MGMT | PP-SFC |
| Production confirmation fallback | CO11N | Confirm Production Order Operation | SAP GUI | S32PCE | Si | SAP_SCM_BC_PRODN_ORD_EXEC | PP-SFC-EXE-CON |
| Goods movement fallback | MIGO | Goods Movement, Post Goods Movement | SAP GUI | S32PCE | Si | SAP_MM_BC_IM_PROCESS | MM-IM |
| Inspection lots fallback | QA32 | Process Inspection Lots - Worklist | SAP GUI | S32PCE | Si | SAP_QM_BC_INSP_LOT_MNTRG | QM-PT-BD |
| Inspection results fallback | QE51N | Record Inspection Results - Hierarchical Worklist | SAP GUI | S32PCE | Si | SAP_QM_BC_RESULT_RECG | QM-IM-RR |
| Usage decision fallback | QA11 | Record Usage Decision | SAP GUI | S32PCE | Si | SAP_QM_BC_USAGE_DECISION | QM-IM-UD |

## Observaciones de implementacion

1. Preferir apps versionadas nuevas cuando FARL muestra variantes recientes, por ejemplo `F0247A`, `F0251A`, `F0266A` y `F1685A`.
2. Mantener SAP GUI como fallback controlado para escenarios avanzados o transicionales: `MD61`, `MD62`, `MD63`, `CO01`, `CO02`, `CO03`, `CO11N`, `MIGO`, `QA32`, `QE51N` y `QA11`.
3. Plan-to-Produce se debe validar por variante: make-to-stock, make-to-order, process manufacturing, repetitive/lean, engineer-to-order, batch/serial y quality-managed production.
4. El handoff con Procure-to-Pay ocurre en purchase requisitions, components, external procurement y staging. El handoff con Record-to-Report ocurre en goods movements, WIP, variances, event-based postings, actual costing y settlement.
5. La senal Public Cloud `Si` no sustituye scope item, business role ni activacion de tenant.

## Overlay Mexico

Para implementaciones en Mexico, agregar validaciones especificas antes de cerrar fit-to-standard:

- Carta Porte cuando el flujo incluya traslado de insumos, producto terminado, transferencias o salida de planta con transporte regulado.
- Trazabilidad entre orden, consumo, goods receipt, batch/serial, documentos de material y asiento contable.
- CFDI solo si el escenario se conecta con venta, salida fiscal, maquila, traslado, devolucion o documento fiscal asociado.
- Evidencia de inventario, costo, scrap, calidad, rework y variaciones para auditoria.
- Segregacion de funciones entre planner, production supervisor, operator, warehouse, quality, cost accountant y master data.

## Gaps de validacion

- Este inventario no prueba que las apps esten activadas, licenciadas o autorizadas en un tenant especifico.
- Las apps `F2101A`, `F2568` y `F4535` no mostraron senal `SAP S/4HANA Cloud Public Edition 2602` en la fila consultada; validar alcance por deployment model.
- Validar si SAP Digital Manufacturing, PP/DS, EWM, TM, MES, quality management avanzado o engineer-to-order estan en scope antes de ampliar el catalogo.
- Validar business roles, catalogs, spaces/pages, OData services, ICF nodes, SAP Notes, product versions, extensibilidad y restricciones por edition directamente en FARL y en el landscape del cliente.

## Query pattern reutilizable

```powershell
$base = 'https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata'
$id = 'F2336'
$url = "$base/InputFilterParam(InpFilterValue='$id')/Results?`$format=json&`$select=appId,AppName,ApplicationType,RoleName,releaseId,BusinessCatalog,ApplicationComponent,PrimaryPVOfficialNameCombined"
Invoke-RestMethod -Uri $url -UseBasicParsing
```

Ejemplo de deep link FARL:

```text
https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/#/detail/Apps('F2336')/S32PCE
```

## Siguientes acciones

1. Validar el inventario con owners de Planning, Manufacturing, Quality, Warehouse, Costing y Finance.
2. Conectar cada app con scope item, business role, test script y control esperado.
3. Completar matriz de fit/gap por variante: make-to-stock, make-to-order, process orders, lean/Kanban, quality-managed production y costing.
4. Confirmar activacion en tenant sandbox, catalogs asignados y launchpad spaces/pages.
5. Regenerar indice maestro y matrices derivadas con esta nueva cobertura.
