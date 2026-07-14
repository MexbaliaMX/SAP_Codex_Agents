# Inventario SAP Fiori Apps Design-to-Operate

Fecha de preparacion: 2026-07-13

## Alcance y fuentes

Este entregable consolida una revision de SAP Fiori Apps Reference Library para construir una base de conocimiento reutilizable en implementaciones futuras de SAP S/4HANA, enfocada en Design-to-Operate. El alcance cubre ciclo de vida de producto y activo, engineering change, estructuras de producto, BOM, objetos tecnicos, solicitudes de mantenimiento, notificaciones, planes, ordenes, backlog, resource scheduling, permit-to-work, ejecucion de mantenimiento, calidad, defectos, inspeccion y cumplimiento EHS/product compliance.

Fuentes oficiales consultadas:

- SAP Fiori Apps Reference Library: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/
- Servicio OData publico de referencia de apps: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/
- Metadata OData consultado: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/$metadata
- Lista de releases consultada: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/Releases
- SAP Process Navigator / SAP Best Practices debe usarse en una segunda validacion para confirmar scope items, test scripts y restricciones por edition.

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
| Product lifecycle y engineering change | Gobernar cambios de ingenieria, change records, change masters, especificaciones y handoff EBOM/MBOM | F2097, F2212, F6726, /PLMU/WDA_ECR_APP_OIF, /PLMU/WDA_ECN_OIF, /PLMU/WDA_SPC_OIF |
| Estructuras de producto y BOM | Mantener, visualizar, transferir y masificar estructuras de producto y bill of material | F2045, F1813A, F2214, F6578, F6862, F6863, F6764, F7802, F8118 |
| Objetos tecnicos y serializacion | Mantener equipment, functional locations, measuring points, estructuras tecnicas, reference equipment y serial numbers | F0226, F0227, F0384, F2072, F8304, F8311, F8669, F7018, F8961, F6879, F7617, F7368, F7551 |
| Solicitudes y notificaciones de mantenimiento | Capturar malfunciones, solicitudes, notificaciones y trazabilidad de eventos | F1511, F1511A, F4513, F2023, F0228, F2071, F4604, F8707 |
| Planes, backlog y ordenes de mantenimiento | Planear mantenimiento correctivo/preventivo, backlog, ordenes, operaciones, confirmaciones y overdue work | F0229, F0231, F2173, F2174, F2175, F8723, F8724, F8725, F2227, F4073, F5105, F6966, F8663, F8519, F8758 |
| Permit-to-work y aislamiento | Controlar permisos, safety certificates, isolation certificates y objetos de work clearance | F7304, F6579, F6678, F6772, F8504, F8505, F9005 |
| Ejecucion de campo | Soportar ejecucion de planned/unplanned jobs, job card y captura de datos de campo | EAMS_WDA_JOBPC_OIF, EAMS_WDA_JOBUC_OIF, EAMS_WDA_JOB_PREVIEW_OIF, EAMS_WDA_JOB_OIF, F1041 |
| Calidad y defectos | Gestionar quality issues, inspection lots, resultados, usage decisions, defectos y analitica QM | F0316, F0312, F0313, F0314, F0315, F2343, F1685A, F2345, F3365, F8046, F8794, F8795, F6607, F2256A, F2219, F3273, F2929 |
| EHS y product compliance | Revisar riesgos quimicos, aprobaciones, dangerous goods, marketability y safety data sheets | F2161, F2243, F2244, F2251, F7712, F8002, F8003, F8171 |

## Inventario curado

| Proceso | App ID | App oficial | Tipo | Rol FARL | Release anchor | Public Cloud 2602 | Catalogo principal observado | Componente |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Product master | F1602 | Manage Product Master | Transactional | Master Data Specialist - Product Data | S32PCE | Si | SAP_CMD_BC_PR_MAINT | LO-MD-MM |
| Product structures | F2045 | Manage Product Structures | Transactional | BOM Engineer | S32PCE | Si | SAP_PLM_BC_PSM | PLM-FIO-PSM |
| Engineering change | F2097 | Manage Change Records | Transactional | Development Manager - Discrete Industries | S32PCE | No / validar | SAP_PLM_BC_CR | PLM-CR |
| Engineering change | F2212 | Manage Change Masters | Transactional | Development Manager - Discrete Industries | S32PCE | Si | SAP_PLM_BC_CM | PLM-WUI-OBJ-ECN |
| Bill of material | F1813A | Maintain Bill Of Material (Version 2) | Transactional | BOM Engineer | S36 | Si | SAP_PLM_BC_MBOM_PC | PLM-FIO-BOM |
| Bill of material | F2214 | Material Where Used List for BOMs | Transactional | BOM Engineer | S32PCE | Si | SAP_PLM_BC_MBOM | PLM-FIO-BOM |
| Engineering BOM handoff | F6726 | Hand Over Engineering Bills of Material (EBOM) | SAP Fiori - Remote | Production Engineer - Discrete Manufacturing | S36 | Si | SAP_PLM_BC_PLMINTG_PC | PLM-INT-EPD |
| BOM mass maintenance | F6578 | Mass maintenance of bill of material items | Transactional | Others | S32PCE | Si | SAP_PLM_BC_MBOM | PLM-FIO-BOM |
| BOM mass maintenance | F6862 | Mass addition of bill of material items | Transactional | Others | S32PCE | Si | SAP_PLM_BC_MBOM | PLM-FIO-BOM |
| BOM mass maintenance | F6863 | Mass maintenance of bill of material headers | Transactional | Others | S32PCE | Si | SAP_PLM_BC_MBOM | PLM-FIO-BOM |
| BOM mass maintenance | F6764 | Monitor jobs for mass maintenance of bills of material | Transactional | Others | S32PCE | Si | SAP_PLM_BC_MBOM | PLM-FIO-BOM |
| BOM visualization | F7802 | Visualize Bill of Material | Transactional | BOM Engineer | S32PCE | No / validar | SAP_PLM_BC_MBOM | CA-DMS-CNV |
| BOM transfer log | F8118 | Display Transfer Logs for Bills of Material | Transactional | Administrator (Global Trade Services) | W52 | No / validar | SAP_LLS_BC_ADM_SYC_LOG_PRE | FT-LEG-MDT |
| Engineering change request | /PLMU/WDA_ECR_APP_OIF (/PLMU/WDA_ECR_APP_OIF_CFG) | Change Engineering Record, Create Engineering Record, Display Engineering Record | Web Dynpro | BOM Engineer | S32PCE | No / validar | SAP_PLM_BC_ER | PLM-WUI-OBJ-ECR |
| Change master fallback UI | /PLMU/WDA_ECN_OIF (/PLMU/WDA_ECN_OIF_CFG) | Change Change Master, Create Change Master, Display Change Master | Web Dynpro | Other | S32PCE | No / validar | Without Catalog Assignment | PLM-WUI-OBJ-ECN |
| Product structure fallback UI | /PLMU/WDA_PPE_OIF (/PLMU/WDA_PPE_CMP_OIF_CFG) | Change Product Structure, Create Product Structure, Display Product Stucture | Web Dynpro | BOM Engineer | S32PCE | No / validar | SAP_PLM_BC_PSM | PLM-WUI-OBJ-PSM |
| Product structure overview | /PLMU/WDA_PPE_OVP (/PLMU/WDA_PPE_CMP_OVP_CONFG) | Change Product Structure, Create Product Structure, Display Product Structure | Web Dynpro | Other | S32PCE | No / validar | SAP_PLM_BC_PSM_OVP | PLM-WUI-OBJ-PSM |
| Specification management | /PLMU/WDA_SPC_OIF (/PLMU/WDA_SPC_OIF_CFG) | Change Specification, Create Specification, Display Specification | Web Dynpro | Other | S32PCE | No / validar | SAP_PLM_BC_SPC_MAINT | PLM-WUI-RCP-SPE |
| Equipment fact sheet | F0226 | Equipment | Fact sheet | Maintenance Technician | W13 | No / validar | Without Catalog Assignment | PM-FIO |
| Functional location fact sheet | F0227 | Functional Location | Fact sheet | Maintenance Technician | W13 | No / validar | Without Catalog Assignment | PM-FIO |
| Measuring point fact sheet | F0384 | Measuring Point | Fact sheet | Maintenance Technician | W13 | No / validar | Without Catalog Assignment | PM-FIO |
| Technical object search | F2072 | Find Technical Object | Transactional | Maintenance Planner | S32PCE | Si | SAP_EAM_BC_TO | PM-FIO |
| Reference equipment | F8304 | Manage Reference Equipment | Transactional | Master Data Specialist - Maintenance Management | S32PCE | No / validar | SAP_ASM_BC_REFTO_MNG | PM-FIO-EQM |
| Reference structures | F8311 | Manage Reference Structures | Transactional | Master Data Specialist - Maintenance Management | S32PCE | No / validar | SAP_ASM_BC_REFTO_MNG | PM-FIO-EQM-RS |
| Technical object structures | F8669 | Manage Technical Object Structures | Transactional | Master Data Specialist - Maintenance Management | S32PCE | No / validar | SAP_ASM_BC_REFTO_MNG | PM-FIO-EQM-RS |
| Linear asset data | F7018 | View Dynamic Segments of Linear Data | Transactional | Maintenance Planner | S32PCE | No / validar | SAP_EAM_BC_NWGRAPH_DSP | PM-EQ |
| Asset overview | F8961 | Asset Overview | Transactional | Maintenance Planner | S36 | Si | SAP_EAM_BC_AOVW_MNG_PC | PM-EQM |
| Serial number management | F6879 | Manage Material Serial Numbers | Transactional | Maintenance Planner | S36 | Si | SAP_EAM_BC_TO_MNG_PC | PM-FIO-EQM |
| Serial number management | F7617 | Manage Material Serial Number | Transactional | Inventory Manager | S32PCE | No / validar | SAP_EAM_BC_TO_MNG | PM-FIO-EQM |
| Serial number history | F7368 | Serial Number History | Transactional | Inventory Manager | S36 | Si | SAP_LO_BC_SN_MANAGE_PC | LO-MD-FIO-SN |
| Serialized stock | F7551 | Display Serialized Stock Quantities | Transactional | Inventory Manager | S36 | Si | SAP_LO_BC_SN_MANAGE_PC | LO-MD-FIO-SN |
| Maintenance request | F1511 | Request Maintenance | Transactional | Employee - Maintenance Info | S32PCE | Si | SAP_EAM_BC_MREQ | PM-FIO-WOC-MN |
| Maintenance request | F1511A | Create Maintenance Request | Transactional | Maintenance Technician | S32PCE | Si | SAP_EAM_BC_MREQ_MNG | PM-FIO-WOC-MN |
| Maintenance request | F4513 | My Maintenance Requests | Transactional | Maintenance Technician | S32PCE | Si | SAP_EAM_BC_MREQ_MNG | PM-FIO-WOC-MN |
| Malfunction reporting | F2023 | Report and Repair Malfunction | Transactional | Maintenance Technician | S32PCE | Si | SAP_EAM_BC_CORRMAINT_MW | PM-FIO-WOC-JC |
| Maintenance notification | F0228 | Maintenance Notification | Fact sheet | Maintenance Technician | W13 | No / validar | Without Catalog Assignment | PM-FIO |
| Maintenance notification | F2071 | Find Maintenance Notification | Transactional | Maintenance Technician | S32PCE | Si | SAP_EAM_BC_NTF | PM-FIO-WOC-MN |
| Maintenance work management | F4604 | Manage Maintenance Notifications and Orders | Transactional | Maintenance Planner | S32PCE | Si | SAP_EAM_BC_MNTWRK_MNG | PM-FIO |
| Maintenance app logs | F8707 | Application Logs - Manage Maintenance Notifications and Orders | Transactional | Maintenance Planner | S36 | Si | SAP_EAM_BC_MNTWRK_MNG_PC | PM-FIO-WOC-MO |
| Maintenance plan | F0229 | Maintenance Plan | Fact sheet | Maintenance Technician | W13 | No / validar | Without Catalog Assignment | PM-FIO |
| Maintenance order | F0231 | Maintenance Order | Fact sheet | Maintenance Technician | W13 | No / validar | Without Catalog Assignment | PM-FIO |
| Maintenance order | F2173 | Find Maintenance Order and Operation | Transactional | Maintenance Technician | S32PCE | Si | SAP_EAM_BC_ORD | PM-FIO |
| Maintenance confirmation | F2174 | Find Maintenance Order Confirmation | Transactional | Maintenance Technician | S32PCE | Si | SAP_EAM_BC_ORD | PM-FIO-WOC-JC |
| Maintenance order | F2175 | Find Maintenance Order | Transactional | Maintenance Technician | S32PCE | Si | SAP_EAM_BC_ORD | PM-FIO |
| Maintenance planning | F8723 | Find Maintenance Orders for Planning | Transactional | Maintenance Planner | S36 | Si | SAP_EAM_BC_ORD_MNG_PC | PM-FIO |
| Maintenance completion | F8724 | Find Maintenance Orders for Completion | Transactional | Maintenance Planner | S36 | Si | SAP_EAM_BC_ORD_MNG_PC | PM-FIO |
| Overdue maintenance | F8725 | Find Overdue Maintenance Orders and Operations | Transactional | Maintenance Planner | S36 | Si | SAP_EAM_BC_ORD_MC | PM-FIO |
| Resource scheduling | F2227 | Resource Scheduling for Maintenance Planners | Analytical | Maintenance Planner - Resource Scheduling | S32PCE | Si | SAP_RSH_BC_MPLAN_OV | CA-RSH-EAM |
| Maintenance backlog | F4073 | Manage Maintenance Backlog | Transactional | Maintenance Planner | S32PCE | Si | SAP_EAM_BC_PLNBKTS_MNG | PM-FIO |
| Maintenance backlog | F5105 | Maintenance Backlog Overview | Analytical | Maintenance Planner | S32PCE | Si | SAP_EAM_BC_PLNBKTS_MNG | PM-FIO |
| Recurring schedules | F6966 | Generate Recurring Schedules | Transactional | Maintenance Planner - Resource Scheduling | S32PCE | Si | SAP_RSH_BC_MPLAN_OV | CA-RSH-EAM |
| Maintenance plan logs | F8663 | Application Log for Manage Maintenance Plans | Transactional | Maintenance Planner | S36 | Si | SAP_EAM_BC_MPLAN_MC | PM-PRM-MP |
| Maintenance item mass change | F8519 | Schedule mass changes for maintenance items | Transactional | Maintenance Planner | S36 | Si | SAP_EAM_BC_MPLANIT_MC | PM-PRM-MP |
| Maintenance order mass change | F8758 | Mass Schedule Order Change | Transactional | Maintenance Planner | S36 | Si | SAP_EAM_BC_MNTWRK_MNG_PC | PM-FIO-WOC-MO |
| Maintenance job package log | F8771 | Application Log for Maintenance Job Package | Transactional | Maintenance Planner | S36 | Si | SAP_EAM_BC_WRKPCK_MNG_PC | PM-FIO |
| Permit to work analytics | F7304 | Permit to Work Overview | Analytical | Plant Manager - EHS Info | S32PCE | No / validar | SAP_WCM_BC_PTW | PM-FIO-WCM |
| Work permits | F6579 | Manage Work Permits | Transactional | Maintenance Planner | S32PCE | Si | SAP_WCM_BC_PTW | PM-FIO-WCM |
| Safety certificates | F6678 | Manage Safety Certificates | Transactional | Maintenance Planner | S32PCE | No / validar | SAP_WCM_BC_PTW | PM-FIO-WCM |
| Safety certificate templates | F6772 | Manage Safety Certificate Templates | Transactional | Maintenance Planner | S32PCE | No / validar | SAP_WCM_BC_PTW | PM-FIO-WCM |
| Isolation certificates | F8504 | Manage Isolation Certificate | Transactional | Maintenance Planner | S32PCE | No / validar | SAP_WCM_BC_PTW | PM-FIO-WCM |
| Isolation certificate templates | F8505 | Manage Isolation Certificate Templates | Transactional | Industrial Hygienist | S32PCE | No / validar | SAP_WCM_BC_PTW | PM-FIO-WCM |
| Permit object generation | F9005 | Generate Permit to Work Objects | Transactional | Maintenance Planner | S32PCE | No / validar | SAP_WCM_BC_PTW | PM-FIO-WCM |
| Planned job confirmation | EAMS_WDA_JOBPC_OIF (EAMS_WDA_JOBPC_OIF_CFG_V2) | Confirm Planned Job | Web Dynpro | Other | S32PCE | No / validar | Without Catalog Assignment | PM |
| Unplanned job confirmation | EAMS_WDA_JOBUC_OIF (EAMS_WDA_JOBUC_OIF_CFG_V2) | Confirm Unplanned Job | Web Dynpro | Maintenance Planner | S32PCE | No / validar | SAP_EAM_BC_TO | PM |
| Job card | EAMS_WDA_JOB_PREVIEW_OIF (EAMS_WDA_JOB_PREVIEW_OIF_CFG) | Job Card | Web Dynpro | Other | S32PCE | No / validar | Without Catalog Assignment | PM |
| Job reference document | EAMS_WDA_JOB_OIF (EAMS_WDA_JOB_OIF_CFG_V2) | Display Reference Document for Job | Web Dynpro | Other | S32PCE | No / validar | Without Catalog Assignment | PM |
| Field data capture | F1041 | Capture Field Data | Transactional | Field Operator (Oil & Gas) | S32PCE | No / validar | SAP_OILUPS_BC_FDOPERATOR | IS-OIL-UOM-FDC |
| Quality issue | F0316 | Report Quality Issue | Transactional | Quality Engineer | W13 | No / validar | SAP_QM_BC_QUALITYENGINEER | QM-FIO |
| Quality notification | F0312 | Quality Notification | Fact sheet | Quality Engineer | W13 | No / validar | SAP_QM_BC_QUALITYENGINEER | QM-FIO |
| Quality notification item | F0313 | Quality Notification Item | Fact sheet | Quality Engineer | W13 | No / validar | SAP_QM_BC_QUALITYENGINEER | QM-FIO |
| Quality notification task | F0314 | Quality Notification Task | Fact sheet | Quality Engineer | W13 | No / validar | SAP_QM_BC_QUALITYENGINEER | QM-FIO |
| Quality notification activity | F0315 | Quality Notification Activity | Fact sheet | Quality Engineer | W13 | No / validar | SAP_QM_BC_QUALITYENGINEER | QM-FIO |
| Inspection lot | F2343 | Manage Inspection Lots | Transactional | Quality Technician | S32PCE | Si | SAP_QM_BC_INSPECTION_LOT | QM-FIO-IM |
| Inspection results | F1685A | Record Inspection Results (Version 2) | Transactional | Quality Technician | S32PCE | Si | SAP_QM_BC_RESULT_RECG | QM-FIO |
| Usage decision | F2345 | Manage Usage Decisions | Transactional | Quality Engineer | S32PCE | Si | SAP_QM_BC_USAGE_DECISION | QM-FIO-IM |
| Inspection results | F3365 | Record Inspection Results in Table Form | Transactional | Quality Technician | S32PCE | Si | SAP_QM_BC_RESULT_RECG | QM-IM-RR |
| Defect processing | F8046 | Process Defects | Transactional | Quality Technician | S36 | Si | SAP_QM_BC_DEFECTS_PC | QM-QN-DEF |
| Quality analytics | F8794 | Inspection Lot Analytics - Mean Quality Score | Analytical | Quality Engineer | S36 | Si | SAP_QM_BC_ANALYTICS_PC | QM-QC-IS |
| Quality analytics | F8795 | Inspection Lot Analytics - Frequencies | Analytical | Quality Engineer | S36 | Si | SAP_QM_BC_ANALYTICS_PC | QM-QC-IS |
| Inspection checklist | F6607 | Manage Inspection Checklists | Transactional | Maintenance Planner | S32PCE | No / validar | SAP_EAM_BC_INSPCHKLST | PM-FIO-WOC-CHL |
| Quality info records | F2256A | Manage Quality Info Records | Transactional | Quality Engineer | S32PCE | Si | SAP_QM_BC_QM_PROCUREMENT | QM-PT-RP-PRC |
| Inspection characteristic | F2219 | Display Master Inspection Characteristic | Transactional | Quality Technician | S32PCE | Si | SAP_QM_BC_MSTR_INSP_CHARC | QM-FIO-PT |
| Inspection analytics | F3273 | Inspection Lot Detailed Analytics | Transactional, Analytical | Quality Manager | S32PCE | Si | SAP_QM_BC_ANALYTICS | QM-QC-IS |
| Defect recording | F2929 | Record Defects | Transactional | Quality Technician | S32PCE | Si | SAP_QM_BC_DEFECT | QM-QN-DEF |
| Chemical risk | F2161 | Chemical Risks - Detailed Analysis | Analytical | Hazardous Materials Manager | S32PCE | No / validar | SAP_EHS_BC_HS_HAZMAT_MGMT | EHS-SUS-HS |
| Chemical approvals | F2243 | Monitor Approved Chemicals | Transactional | Hazardous Materials Manager | S32PCE | No / validar | SAP_EHS_BC_HS_RSK_MGMT | EHS-SUS-HS |
| Chemical approvals | F2244 | My Chemical Approvals | Transactional | Hazardous Materials Manager | S32PCE | No / validar | SAP_EHS_BC_HS_RSK_MGMT | EHS-SUS-HS |
| Approved chemicals | F2251 | Approved Chemicals | Analytical | Hazardous Materials Manager | S32PCE | No / validar | SAP_EHS_BC_HS_HAZMAT_MGMT | EHS-SUS-HS |
| Dangerous goods compliance | F7712 | Configure Compliance Requirements - Dangerous Goods Regulations | Transactional | Dangerous Goods Specialist - Product Compliance | S36 | Si | SAP_PSS_BC_PC_DG_CNFG_PC | EHS-SUS-DG |
| Product marketability | F8002 | Activate Compliance Requirements - Product Marketability | Transactional | Product Stewardship Specialist - Product Compliance | S36 | Si | SAP_PSS_BC_PC_CRV_ACTV_PC | EHS-SUS-CI |
| Safety data sheets | F8003 | Activate Compliance Requirements - Safety Data Sheets | Transactional | Product Stewardship Specialist - Product Compliance | S36 | Si | SAP_EHS_BC_HS_CRV_SDS_ACTV_PC | EHS-SUS-CI |
| Safety data sheets | F8171 | Configure Compliance Requirements - Safety Data Sheets | Transactional | Product Stewardship Specialist - Product Compliance | S32PCE | Si | SAP_PSS_BC_CNFG_CMPL_MGMT | EHS-SUS-SDS |

## Fallbacks SAP GUI controlados

| Proceso | App ID | App oficial FARL | Tipo | Release anchor | Public Cloud 2602 | Catalogo principal observado | Componente |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Engineering change fallback | CC01 | Create Change Master | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PLM-WUI-OBJ-ECN |
| Engineering change fallback | CC02 | Change Change Master | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PLM-WUI-OBJ-ECN |
| Engineering change fallback | CC03 | Display Change Master | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PLM-WUI-OBJ-ECN |
| BOM fallback | CS01 | Create Material BOM | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | LO-MD-BOM |
| BOM fallback | CS02 | Change Material BOM | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | LO-MD-BOM |
| BOM fallback | CS03 | Display Material BOM | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | LO-MD-BOM |
| Equipment fallback | IE01 | Create Equipment | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PM-EQM |
| Equipment fallback | IE02 | Change Equipment | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PM-EQM |
| Functional location fallback | IL01 | Create Functional Location | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PM-EQM-FL |
| Functional location fallback | IL02 | Change Functional Location | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PM-EQM-FL |
| Maintenance notification fallback | IW21 | Create PM Notification | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PM-WOC-MN |
| Maintenance notification fallback | IW22 | Change PM Notification | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PM-WOC-MN |
| Maintenance order fallback | IW31 | Create Maintenance Order | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PM-WOC-MO |
| Maintenance order fallback | IW32 | Change Maintenance Order | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PM-WOC-MO |
| Maintenance plan fallback | IP01 | Create Maintenance Plan | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PM-PRM-MP |
| Maintenance plan fallback | IP02 | Change Maintenance Plan | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PM-PRM-MP |
| Measuring point fallback | IK01 | Create Measuring Point | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PM-EQM-SF-MPC |
| Measuring document fallback | IK11 | Create Measurement Document | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PM-EQM-SF-MPC |
| Task list fallback | IA05 | Create General Task List | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | PM-PRM-TL |
| Quality notification fallback | QM01 | Create Quality Notification | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | QM-QN |
| Inspection processing fallback | QA32 | Change Data for Inspection Lot | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | QM-IM |
| Inspection results fallback | QE51N | Results Recording Worklist | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | QM-IM-RR |
| Usage decision fallback | QA11 | Record Usage Decision | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | QM-IM-UD |

## Observaciones de curacion

1. El proceso Design-to-Operate cruza PLM, Enterprise Asset Management, Quality Management, EHS/Product Compliance, inventory, procurement y finance. Este inventario es una vista E2E, no una afirmacion de que todas las capacidades pertenecen al mismo scope item.
2. Varias apps de engineering change, product structure y work clearance aparecen como Web Dynpro o con `No / validar` para Public Cloud 2602. Deben tratarse como dependientes de edition, scope item, business role y configuracion.
3. Los fact sheets historicos con release `W13` se conservan como objetos de navegacion o referencia; deben validarse contra el launchpad real antes de disenar espacios/paginas.
4. Apps de EHS/Product Compliance pueden requerir scope, licencia, datos regulatorios e integracion especifica. No se deben prometer sin validacion de SAP Process Navigator y tenant.
5. Quality Management se cruza con Plan-to-Produce; las apps repetidas se mantienen para trazabilidad E2E y deben resolverse por owner en la matriz de roles.
6. SAP GUI se conserva solo como fallback controlado para escenarios donde Fiori no cubra mantenimiento, BOM, objetos tecnicos o calidad en el landscape objetivo.

## Overlay Mexico

| Tema | Pregunta de validacion | Evidencia requerida |
| --- | --- | --- |
| Carta Porte | Las operaciones de mantenimiento, spare parts o traslado de activos/equipment generan movimientos fisicos que requieran Carta Porte? | Escenario logistico, ubicaciones, transporte, XML/acuse si aplica y trazabilidad con material document |
| Activos y mantenimiento | El costo de mantenimiento de activos requiere trazabilidad contable, aprobaciones o evidencia para auditoria? | Maintenance order, confirmation, goods issue, settlement, accounting document y aprobacion |
| EHS/product compliance | Los materiales o productos regulados requieren SDS, dangerous goods o marketability checks para Mexico? | Requisitos regulatorios aplicables, datos maestros, outputs, aprobaciones y evidencia documental |
| Calidad | Las inspecciones, defectos o usage decisions soportan liberacion de inventario o reclamos con impacto fiscal/logistico? | Inspection lot, resultados, usage decision, defect log, stock status y documento material |
| Auditoria | Que logs y cambios soportan change master, BOM, technical object, mantenimiento, permisos y calidad? | Change documents, workflow, app logs, business role assignment y evidencias de ejecucion |

## Gaps de validacion

- Confirmar scope items y test scripts en SAP Process Navigator / SAP Best Practices.
- Confirmar activacion real en tenant, business roles, catalogs, spaces/pages y autorizaciones.
- Confirmar edition, pais, industria, licenciamiento y restricciones de apps Web Dynpro, EHS/Product Compliance y work clearance.
- Validar integracion con SAP Digital Manufacturing, SAP EAM mobile, SAP Asset Performance Management, SAP EPD, SAP PLM, EWM, Ariba, DRC/eDocument o sistemas MES/IoT si estan en alcance.
- Confirmar estrategia de fallback SAP GUI, SoD, aprobaciones y evidencia de auditoria.

## Query pattern reusable

```powershell
$base = 'https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata'
$id = '<APP_ID>'
$url = "$base/InputFilterParam(InpFilterValue='$id')/Results?`$format=json&`$select=appId,AppName,ApplicationType,RoleName,releaseId,BusinessCatalog,TechnicalCatalog,ApplicationComponent,PrimaryPVOfficialNameCombined"
Invoke-WebRequest -Uri $url -UseBasicParsing
```

## Siguientes acciones

1. Validar el catalogo con Operations, Maintenance, Quality, Engineering y EHS owners.
2. Completar scope item mapping contra SAP Process Navigator y tenant del cliente.
3. Separar apps obligatorias, opcionales, cross-process y fallback.
4. Definir role design por Maintenance Planner, Technician, BOM Engineer, Quality Engineer, EHS/Product Compliance y Security.
5. Preparar workshop Fit-to-Standard por technical objects, maintenance execution, quality, engineering change y compliance.
