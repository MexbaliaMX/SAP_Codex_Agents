# Inventario SAP Fiori Apps Hire-to-Retire

Fecha de preparacion: 2026-07-14

## Alcance y fuentes

Este entregable inicia el catalogo E2E SAP Fiori para Hire-to-Retire en implementaciones futuras de SAP S/4HANA. El alcance cubre autoservicio de empleado, aprobaciones de manager, leave/overtime/time events, timesheet, travel and expenses, workforce administration, staffing de proyectos, payroll/accounting handoff, personnel settlement y controles financieros relacionados.

Fuentes oficiales consultadas:

- SAP Fiori Apps Reference Library: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/
- Servicio OData publico de referencia de apps: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/
- Metadata OData consultado: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/$metadata
- Lista de releases consultada: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/Releases
- SAP SuccessFactors, SAP Process Navigator, SAP Best Practices, payroll provider y tenant del cliente deben usarse para confirmar core HR, recruiting, onboarding, payroll, benefits, learning, country localization y scope items.

La SAP Fiori Apps Reference Library se uso como fuente primaria para app IDs, nombres oficiales, tipo de aplicacion, rol, business catalog, componente y senal de version.

## Release anchor vigente

La consulta de releases al 2026-07-14 devolvio como versiones mas recientes:

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
| Workforce foundation | Mantener visibilidad operativa de workforce, posiciones y logs administrativos | F6097, F6097A, F6767, F4435 |
| Employee profile y self-service | Consultar datos de empleado, profile/fact sheet y recibos de pago cuando S/4 aplique | F1383A, F1522, F1313A |
| Leave, overtime y time events | Capturar solicitudes y aprobaciones de ausencia, overtime y eventos de tiempo | F1311A, F2584, F4939, F4937A, F1506B, F3099A |
| Timesheet y cumplimiento de tiempo | Capturar, aprobar, monitorear y analizar timesheets, missing times y compliance | F3074A, F1823, F2585A, F3328, F7189, F8342, F2556, F3031 |
| Travel requests y expenses | Gestionar viajes, aprobaciones, gastos y soporte de travel assistant | F0409A, F0409C, F0411A, F6015A, F6190, F0410A, F0584A, F0584B, F6771 |
| Staffing y resource management | Planear recursos para proyectos, staffing, resource requests y analitica | F4725, F2902, /RPM/RES_MNG_DETAILS, /RPM/STAFF_MNG_DETAILS |
| Personnel settlement / commissions | Gestionar settlement documents, workflows, monitoreo y documentos relacionados | F3808A, F4009, F4021, F5084, F7935 |
| Payroll/accounting handoff | Monitorear notificaciones de payroll accounting y reconciliar postings contables | F8241, F0717, F2217, F7697 |
| Costing y controlling handoff | Mantener cost centers, activity types, internal orders y activity allocation | F1443A, F1605A, F1604A, F3697A |

## Inventario curado

| Proceso | App ID | App oficial | Tipo | Rol FARL | Release anchor | Public Cloud 2602 | Catalogo principal observado | Componente |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Leave request | F1311A | My Leave Requests (Version 3/Fiori 2.0) | Transactional | Employee - HR Info | S32PCE | No / validar | SAP_HCMFAB_BC_EMPLOYEE_T | PA-FIO-LEA |
| Leave approval | F2584 | Approve Leave Requests (Version 3/Fiori 2.0) | Transactional | Manager - HR Info | S32PCE | No / validar | SAP_HCMFAB_BC_MANAGER_T | PA-FIO-LEA |
| Overtime request | F4939 | My Overtime Requests | Transactional | Employee - HR Info | S32PCE | No / validar | SAP_HCMFAB_BC_EMPLOYEE_T | PA-FIO-OVT |
| Overtime approval | F4937A | Approve Overtime Requests (S/4HANA) | Transactional | Manager - HR Info | S32PCE | No / validar | SAP_HCM_BC_MANAGER | PA-FIO-OVT |
| Time event | F1506B | My Time Events (S/4HANA / Version 3) | Transactional | Employee - HR Info | S32PCE | No / validar | SAP_HCM_BC_EMPLOYEE | PA-FIO-CIO |
| Time event approval | F3099A | Approve Time Events (S/4HANA / Version 3) | Transactional | Manager - HR Info | S32PCE | No / validar | SAP_HCM_BC_MANAGER | PA-FIO-CIO |
| Timesheet entry | F3074A | My Timesheet (S/4HANA / Version 4) | Transactional | Employee - HR Info | S32PCE | No / validar | SAP_HCM_BC_EMPLOYEE | PA-FIO-TS |
| Timesheet entry | F1823 | Manage My Timesheet | Transactional | Employee - HR Info | S36 | Si | SAP_HCM_BC_EMP_PC | CA-TS-S4 |
| Timesheet approval | F2585A | Approve Timesheets (S/4HANA / Version 4) | Analytical | Manager - HR Info | S32PCE | No / validar | SAP_HCM_BC_MANAGER | PA-FIO-TS |
| Timesheet approval | F3328 | My Inbox - Approve Timesheets | Transactional | Project Manager - Commercial Services | S36 | Si | SAP_HCM_BC_TS_WIAPPROVE_PC | CA-TS-S4 |
| Timesheet analytics | F7189 | Timesheet Analytics - My Activities (S/4HANA) | Analytical | Employee - HR Info | S32PCE | No / validar | SAP_HCM_BC_EMPLOYEE | PA-FIO-TS |
| Timesheet compliance | F8342 | Timesheet Analytics - My Compliance (S/4HANA) | Analytical | Employee - HR Info | S32PCE | No / validar | SAP_HCM_BC_EMPLOYEE | PA-FIO-TS |
| Missing time notification | F2556 | Notify Missing Times | Transactional | Project Manager - Commercial Services | S36 | Si | SAP_HCM_BC_PRJ_TIMESHEET_PC | CA-TS-S4 |
| Missing time monitoring | F3031 | Monitor Missing Time Notifications | Transactional | Project Manager - Commercial Services | S36 | Si | SAP_HCM_BC_PRJ_TIMESHEET_PC | CA-TS-S4 |
| Employee lookup | F1383A | Employee Lookup (Version 2/Fiori 2.0) | Transactional | Employee - HR Info | S32PCE | No / validar | SAP_HCMFAB_BC_EMPLOYEE_T | PA-FIO-LKP |
| Employee fact sheet | F1522 | Employee Fact Sheet | Fact sheet | Employee - HR Info | S23OP | No / validar | SAP_HCM_BC_EMPLOYEE_ESS | CA-HR-S4 |
| Pay statement | F1313A | My Paystubs (Version 3/Fiori 2.0) | Transactional | Employee - HR Info | S32PCE | No / validar | SAP_HCMFAB_BC_EMPLOYEE_T | PA-FIO-PST |
| Workforce admin | F6097 | Manage Workforce | Transactional | Administrator | S36 | Si | SAP_BUM_BC_MNG_WORKFORCE_PC | CA-GTF-BUM |
| Workforce admin | F6097A | Manage Workforce V2 | Transactional | Administrator | S36 | Si | SAP_BUM_BC_MNG_WORKFORCE_PC | CA-GTF-BUM |
| Workforce log | F6767 | Manage Workforce Log | Transactional | Administrator | S36 | Si | SAP_BUM_BC_MNG_WORKFORCE_PC | CA-GTF-BUM |
| Position management | F4435 | Manage Positions | Transactional | Organizational Planner - Personnel | S32PCE | No / validar | SAP_DFS_BC_POSITION | IS-DFS-OF-FE |
| Staff resource request | F4725 | Staff Resource Requests | SAP Fiori - Remote | Resource Manager - Projects | S36 | Si | SAP_PPM_BC_RM_RES_MGMT_PC | PPM-PRO |
| Project staffing analytics | F2902 | Project Staffing Analysis | Analytical | Project Manager - Professional Services | S36 | Si | SAP_PSP_BC_PROJ_STAFF_ANA_PC | CA-CPD-SS |
| Resource overview | /RPM/RES_MNG_DETAILS (/RPM/WDA_RES_MNG_DETAILS_OIF_CFG) | Resource Overview | Web Dynpro | Project Resource Manager | S32PCE | No / validar | SAP_PPM_BC_PROJ_RESMANAGER | PPM-PFM |
| Staffing overview | /RPM/STAFF_MNG_DETAILS (/RPM/WDA_STAFF_MNG_DET_OIF_CFG) | Staffing Overview | Web Dynpro | Project Resource Manager | S32PCE | No / validar | SAP_PPM_BC_PROJ_RESMANAGER | PPM-PFM |
| Travel request | F0409A | My Travel Requests (Version 2) | Transactional | Employee - Travel Info | S30PCE | No / validar | SAP_FI_BC_TRV | FI-FIO-TV-MTR |
| Travel request assistant | F0409C | Travel Requests (Version 4) for Travel Assistant | Transactional | Travel Agent | S32PCE | No / validar | SAP_FI_BC_TRV_ASSISTANT | FI-FIO-TV-MTR |
| Travel request approval | F0411A | My Inbox - Approve Travel Requests | Transactional | Other | S32PCE | No / validar | SAP_FND_BC_MANAGER_T | FI-FIO-TV-ATR |
| Travel request | F6015A | My Travel Requests (Version 4) for Business Traveler | Transactional | Employee - Travel Info | S32PCE | No / validar | SAP_FI_BC_TRV | FI-FIO-TV-MTR |
| Travel expenses | F6190 | My Travel and Expenses for Business Traveler | Transactional | Employee - Travel Info | S32PCE | No / validar | SAP_FI_BC_TRV | FI-FIO-TV-MTE |
| Travel expense approval | F0410A | My Inbox - Approve Travel Expenses | Transactional | Other | S32PCE | No / validar | SAP_FND_BC_MANAGER_T | FI-FIO-TV-ATE |
| Travel expenses | F0584A | My Travel and Expenses (Version 2) | Transactional | Employee - Travel Info | S30PCE | No / validar | SAP_FI_BC_TRV | FI-FIO-TV-MTE |
| Travel expense assistant | F0584B | Travel and Expenses for Travel Assistant | Transactional | Travel Agent | S32PCE | No / validar | SAP_FI_BC_TRV_ASSISTANT | FI-FIO-TV-MTE |
| Travel plans assistant | F6771 | Travel Plans for Travel Assistant | Transactional | Travel Agent | S32PCE | No / validar | Without Catalog Assignment | FI-FIO-TV-PL |
| Personnel settlement | F3808A | Manage Personnel Settlement Documents (Version 2) | Transactional | Settlement Clerk - Commissions | S32PCE | Si | SAP_SD_BC_PSDOC_IC_MNG | LO-AB |
| Personnel settlement monitoring | F4009 | Monitor Personnel Settlement Documents | Transactional | Contract Manager - Settlement Management | S32PCE | Si | SAP_SD_BC_PSDOC_MON | LO-AB |
| Personnel settlement workflow | F4021 | Manage Workflows - Personnel Settlement Documents | Transactional | Contract Manager - Settlement Management | S32PCE | Si | SAP_SM_BC_ABDOC_CONFIGURE | LO-AB |
| Personnel settlement document | F5084 | Personnel Settlement Document | Transactional, Fact sheet | Settlement Clerk | S32PCE | Si | SAP_SD_BC_PSDOC_IC_MNG | LO-AB |
| Personnel settlement items | F7935 | Monitor Personnel Settlement Document Items | Transactional | Settlement Clerk - Commissions | S32PCE | Si | SAP_SD_BC_PSDOC_IC_ITM_MON | LO-AB |
| Payroll accounting | F8241 | Payroll Accounting Notifications | Transactional, Reuse Component | General Ledger Accountant | S36 | Si | Without Catalog Assignment | FI-GL-BTI |
| Direct activity allocation | F3697A | Manage Direct Activity Allocation - New Version | Transactional | Cost Accountant - Overhead | S36 | Si | SAP_FIN_BC_OH_PER_GPA_PC | CO-FIO-CCA-TRA |
| Cost center master | F1443A | Manage Cost Centers (Version 2) | Transactional | Cost Accountant - Overhead | S32PCE | Si | SAP_SFIN_BC_OH_MD_CCA | CO-FIO-CCA-MD |
| Activity type master | F1605A | Manage Activity Types (Version 2) | Transactional | Cost Accountant - Overhead | S32PCE | Si | SAP_SFIN_BC_OH_MD_CCA | CO-FIO-ATY-MD |
| Internal order master | F1604A | Manage Internal Orders (Version 2) | Transactional | Cost Accountant - Overhead | S32PCE | No / validar | SAP_SFIN_BC_OH_MD_OPA | CO-FIO-OPA-MD |
| Payroll/travel posting review | F0717 | Manage Journal Entries | Transactional | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_JE_PROC | FI-FIO-GL-TRA |
| Payroll/travel posting analytics | F2217 | Display Line Items in General Ledger | Analytical | General Ledger Accountant | S32PCE | Si | SAP_SFIN_BC_GL_ANALYTICS | FI-FIO-GL-IS |
| Payroll/travel posting display | F7697 | Display Journal Entries | Transactional | General Ledger Accountant | S36 | Si | SAP_FIN_BC_DSPL_ACDOC_PC | FI-FIO-GL-TRA |

## Fallbacks SAP GUI controlados

| Proceso | App ID | App oficial FARL | Tipo | Release anchor | Public Cloud 2602 | Catalogo principal observado | Componente |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Travel expense fallback | PR05 | Travel Expense Manager | SAP GUI | S32PCE | No / validar | Without Catalog Assignment | FI-TV-COS |
| HR master data fallback | PA20 | Display HR Master Data | SAP GUI | No encontrado en FARL exacto | No / validar | Not found in exact FARL query | PA |
| HR master data fallback | PA30 | Maintain HR Master Data | SAP GUI | No encontrado en FARL exacto | No / validar | Not found in exact FARL query | PA |
| Personnel action fallback | PA40 | Personnel Actions | SAP GUI | No encontrado en FARL exacto | No / validar | Not found in exact FARL query | PA |
| Time sheet fallback | CAT2 | Maintain Timesheet | SAP GUI | No encontrado en FARL exacto | No / validar | Not found in exact FARL query | CA-TS |
| Time sheet display fallback | CAT3 | Display Timesheet | SAP GUI | No encontrado en FARL exacto | No / validar | Not found in exact FARL query | CA-TS |
| Time sheet approval fallback | CAT4 | Approve Timesheet | SAP GUI | No encontrado en FARL exacto | No / validar | Not found in exact FARL query | CA-TS |

## Observaciones de curacion

1. Hire-to-Retire normalmente depende de SAP SuccessFactors para recruiting, onboarding, Employee Central, compensation, learning, performance, benefits y core HR cloud. Este catalogo cubre solo apps FARL visibles desde la perspectiva SAP S/4HANA.
2. Las apps `PA-FIO-*` muestran poca o nula senal Public Cloud 2602 en las filas consultadas; deben validarse por edition, scope item, pais y landscape objetivo.
3. Payroll core y payroll control center no se confirmaron como cobertura S/4HANA Fiori general en esta consulta. `F8241` se conserva como handoff contable, no como motor de payroll.
4. Travel and Expenses puede depender de configuracion FI-TV, localizacion, politica de gastos, aprobaciones y alcance de SAP Concur u otro sistema externo.
5. Project staffing y resource management tienen apps S/4HANA/PPM y Web Dynpro; deben validarse contra alcance de Professional Services, PPM o integracion externa.
6. Fallbacks SAP GUI de PA/CATS se incluyen como control de conversacion para landscapes privados/on-premise, pero varios no devolvieron fila FARL exacta; requieren decision explicita de seguridad, SoD y adopcion antes de usarse.

## Overlay Mexico

| Tema | Pregunta de validacion | Evidencia requerida |
| --- | --- | --- |
| Payroll Mexico | El payroll se ejecuta en SuccessFactors Employee Central Payroll, SAP HCM, proveedor externo o sistema local? | Payroll boundary, timbrado/recibos CFDI de nomina, integracion contable y evidencia SAT/PAC cuando aplique |
| Travel expenses | Los gastos de viaje requieren CFDI, XML/PDF, aprobaciones, anticipos o reembolsos? | Politica de gastos, comprobantes fiscales, workflow, contabilizacion y clearing |
| Time costing | Las horas alimentan proyectos, ordenes internas, costos de produccion o activity allocation? | Timesheet, aprobacion, objeto de costo, allocation, journal entry y reconciliacion |
| Access governance | Que roles pueden ver datos sensibles de empleado, paystubs o HR master data? | Role assignment, SoD, privacy approval, audit log y evidencia de minimo privilegio |
| Offboarding | El retiro/offboarding dispara baja de accesos, cierre de anticipos, pagos o documentos pendientes? | Checklist de salida, IAM, finance clearing, travel settlement y evidencia de aprobacion |

## Gaps de validacion

- Confirmar si SAP SuccessFactors esta dentro del alcance y que modulos cubren recruiting, onboarding, core HR, time, payroll, learning, performance, compensation y benefits.
- Confirmar pais, legal entity, payroll provider, CFDI nomina, recibos, PAC/SAT y retencion documental para Mexico.
- Confirmar scope items, edition, business roles, catalogs, launchpad spaces/pages y activacion real en tenant.
- Confirmar integracion con finance, controlling, projects, IAM, SAP Concur, payroll provider y herramientas de ticketing/access governance.
- Confirmar privacidad, datos sensibles, SoD y retencion de evidencia antes de workshops cliente.

## Query pattern reusable

```powershell
$base = 'https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata'
$id = '<APP_ID>'
$url = "$base/InputFilterParam(InpFilterValue='$id')/Results?`$format=json&`$select=appId,AppName,ApplicationType,RoleName,releaseId,BusinessCatalog,TechnicalCatalog,ApplicationComponent,PrimaryPVOfficialNameCombined"
Invoke-WebRequest -Uri $url -UseBasicParsing
```

## Siguientes acciones

1. Validar el catalogo con HR, Payroll, Finance, Travel, Projects, Security y Integration owners.
2. Decidir si SuccessFactors, SAP Concur, payroll provider o SAP HCM privado forman parte del alcance.
3. Separar apps obligatorias, opcionales, cross-process y fallback.
4. Completar scope item mapping contra SAP Process Navigator y tenant del cliente.
5. Refrescar indice maestro y matrices derivadas despues de cerrar el alcance H2R inicial.
