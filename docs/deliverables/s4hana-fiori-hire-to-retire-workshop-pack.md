# Hire-to-Retire Fit-to-Standard Workshop Pack

Fecha de preparacion: 2026-07-14

## Proposito

Este paquete convierte el catalogo SAP Fiori Hire-to-Retire y las matrices E2E en una guia de workshop Fit-to-Standard para SAP Activate Explore. Su objetivo es validar el proceso estandar, delimitar responsabilidades entre SAP S/4HANA, SAP SuccessFactors, travel/expense, payroll provider, IAM y Finance, y capturar decisiones Fit/Gap con evidencia.

Este documento no prueba alcance activado, licenciamiento, pais, payroll, CFDI nomina, business roles ni visibilidad real en tenant. Las decisiones deben cerrarse con evidencia de SAP Process Navigator, SAP Best Practices, tenant y owners del proyecto.

## Fuentes

- Catalogo H2R: `docs/deliverables/s4hana-fiori-hire-to-retire-app-inventory.md`
- Backlog CSV del workshop: `docs/deliverables/s4hana-fiori-hire-to-retire-workshop-pack.csv`
- Fit-to-Standard Matrix: `docs/deliverables/s4hana-fiori-fit-to-standard-workshop-matrix.csv`
- Scope Item Mapping: `docs/deliverables/s4hana-fiori-scope-item-mapping.csv`
- Scope Validation Report: `docs/deliverables/s4hana-fiori-scope-item-validation-report.csv`
- Role & Business Catalog Matrix: `docs/deliverables/s4hana-fiori-role-business-catalog-matrix.csv`
- Mexico Compliance Tracker: `docs/deliverables/s4hana-mexico-compliance-tracker.csv`

## Resumen Ejecutivo

| Indicador | Resultado |
| --- | ---: |
| Apps / filas H2R revisadas | 54 |
| Sesiones propuestas | 7 |
| Scope candidates H2R | 7 |
| Public Cloud 2602 = Si | 21 |
| Public Cloud 2602 = No / validar | 33 |
| Business control | 45 |
| Restricted fallback | 7 |
| Standard role design | 2 |

## Alcance de Workshop

| Incluido | Validacion esperada |
| --- | --- |
| Workforce foundation y employee self-service | Confirmar owner de datos de empleado, posicion, cost center, legal entity y acceso a datos sensibles |
| Time, leave, overtime y attendance | Confirmar captura, aprobacion, reglas de valuacion, objeto de costo y excepciones |
| Travel, expenses y reimbursement | Confirmar politica de gastos, aprobaciones, CFDI/XML Mexico cuando aplique, contabilizacion y clearing |
| Project staffing y resource management | Confirmar si PPM/Professional Services esta en alcance y como se integra con staffing y costos |
| Personnel settlement y commissions | Confirmar si aplica para el modelo comercial y como se controla workflow y contabilizacion |
| Payroll, costing y finance handoff | Confirmar payroll boundary, posting, reconciliacion contable, cost allocation y evidencia |
| Access, controls y closeout | Confirmar SoD, privacidad, fallback SAP GUI, offboarding e IAM |

## Fuera de Alcance Hasta Validacion

| Tema | Motivo |
| --- | --- |
| SuccessFactors Recruiting, Onboarding, Employee Central, Learning, Performance, Compensation y Benefits | No se validan desde FARL S/4HANA; requieren fuentes SuccessFactors y tenant |
| Payroll core / payroll control center | FARL consultado solo confirma handoff contable limitado; no prueba motor de payroll |
| CFDI nomina Mexico | Requiere payroll provider, PAC/SAT, localizacion y evidencia legal |
| SAP Concur u otro travel provider | Requiere landscape e integracion del cliente |
| Produccion de roles | Requiere tenant, business roles, catalogs, spaces/pages y aprobacion de seguridad |

## Agenda Recomendada

| Sesion | Duracion sugerida | Objetivo | Filas |
| --- | ---: | --- | ---: |
| 1. Workforce foundation and employee self-service | 60 min | Confirmar foundation data, employee lookup, paystub visibility, workforce admin y posiciones | 7 |
| 2. Time, leave and attendance | 90 min | Validar leave, overtime, time events, timesheet, approvals, missing time y compliance | 17 |
| 3. Travel, expenses and reimbursement | 90 min | Validar travel request, expense report, approvals, assistant role, posting y Mexico evidence | 13 |
| 4. Project staffing and resource management | 45 min | Confirmar staffing, resource requests, analytics y PPM/Professional Services boundary | 4 |
| 5. Personnel settlement and commissions | 45 min | Confirmar si aplica, owner, workflow, settlement documents y accounting handoff | 5 |
| 6. Payroll, costing and finance handoff | 75 min | Confirmar payroll boundary, cost centers, activity types, internal orders, allocations y postings | 5 |
| 7. Access, controls and closeout | 60 min | Resolver SAP GUI fallback, privacy, SoD, IAM, offboarding y evidencia final | 3 |

## Entry Criteria

1. Confirmar landscape objetivo: SAP S/4HANA Public Cloud, Private Cloud, On-Premise, SuccessFactors, SAP Concur, payroll provider, IAM y herramientas de delivery.
2. Confirmar paises y legal entities, especialmente Mexico si aplica payroll, travel, expense o tax evidence.
3. Confirmar owners: HR Operations, Payroll, Finance, Travel/AP, Project/Resource Management, Security/IAM, Integration y Mexico Tax/Legal.
4. Tener acceso a SAP Process Navigator, SAP Best Practices, tenant sandbox y herramienta de evidencia (Cloud ALM, Jira, Azure DevOps o equivalente).
5. Revisar el CSV del workshop antes de la sesion y preasignar owners por fila prioritaria.

## Decision Log Starter

| Decision | Default | Owner | Evidencia minima |
| --- | --- | --- | --- |
| H2R system of record | TBD - SuccessFactors / S/4 / externo | HR Operations Owner | Landscape, data ownership, integration diagram |
| Payroll boundary | TBD - ECP / HCM / provider externo | Payroll Owner | Payroll calendar, posting design, Mexico CFDI requirement |
| Travel and expense boundary | TBD - S/4 FI-TV / Concur / externo | Travel / AP Owner | Policy, approval flow, receipt evidence, posting and clearing |
| Time valuation and costing | TBD - standard first | HR Time / Finance Owner | Time schema/rules, cost object, approval, allocation evidence |
| Employee data access model | TBD - least privilege | Security / IAM Owner | Role catalog, SoD review, privacy approval, audit log |
| SAP GUI fallback policy | Default: restricted | Process + Security Owner | Approved exception, launchpad target mapping, SoD control |

## Fit-to-Standard Questions

| Area | Preguntas clave |
| --- | --- |
| Workforce foundation | Quien es owner del dato maestro de empleado, posicion, cost center, legal entity y manager? Que sistema inicia cambios? |
| Time and attendance | Que tipos de tiempo se capturan? Que aprobaciones aplican? Que excepciones requieren workflow o backlog? |
| Leave and overtime | Las reglas vienen de SuccessFactors Time, S/4, payroll provider o sistema externo? Que evidencia de aprobacion se conserva? |
| Travel and expense | Hay anticipos, reembolsos, corporate card, CFDI/XML Mexico, politica de comprobantes o integracion con Concur? |
| Project staffing | El staffing alimenta proyectos, resource requests, professional services o costos internos? |
| Personnel settlement | El cliente usa settlement/commissions en S/4? Como se aprueba, contabiliza y audita? |
| Payroll finance handoff | Como se contabiliza payroll? Hay reconciliacion por cost center, internal order, GL, clearing y legal entity? |
| Access and privacy | Quien puede ver paystubs, employee factsheets, HR master data, time events y travel details? |
| Offboarding | Que pasos cierran accesos, anticipos, viajes, gastos, roles, payroll y documentos pendientes? |

## Mexico Validation Prompts

| Tema | Pregunta | Evidencia requerida |
| --- | --- | --- |
| CFDI nomina | El payroll Mexico genera CFDI nomina desde el payroll provider o solucion SAP? | XML/PDF, UUID, PAC/SAT, acuse, cancelacion/reemision si aplica |
| Travel expenses | Los gastos de viaje requieren CFDI, XML/PDF, aprobacion fiscal y conciliacion contable? | Comprobante fiscal, workflow, expense report, accounting document y clearing |
| Time costing | Las horas impactan proyectos, produccion, internal orders o cost centers? | Timesheet aprobado, objeto de costo, allocation, journal entry |
| Privacy | Que datos sensibles de empleado son visibles en S/4 y quien los aprueba? | Role assignment, SoD, privacy approval, audit log |
| Offboarding | Que controles garantizan baja de accesos y cierre de saldos pendientes? | IAM evidence, travel/AP clearing, payroll close, checklist de salida |

## Risk Register Starter

| Riesgo | Severidad | Mitigacion |
| --- | --- | --- |
| Confundir apps S/4 H2R con cobertura SuccessFactors completa | Alta | Documentar boundary por modulo y validar con HR landscape |
| Usar `ScopeItemCandidate` como alcance oficial | Alta | Completar `ScopeItemId` y test script en SAP Process Navigator / tenant |
| Payroll Mexico sin evidencia CFDI nomina | Alta | Validar payroll provider, PAC/SAT, XML/PDF y reconciliacion contable |
| Fallback SAP GUI PA/CATS sin aprobacion | Alta | Requerir excepcion de seguridad, SoD y estrategia de adopcion |
| Datos sensibles visibles por roles amplios | Alta | Aplicar minimo privilegio, privacy review y evidencia de role assignment |
| Travel expenses sin comprobante fiscal o clearing | Media | Validar politica, CFDI/XML, workflow, posting y clearing |

## Workshop Outputs

| Output | Formato esperado |
| --- | --- |
| Decision log | Una fila por decision con owner, fecha, evidencia y estado |
| Fit/Gap log | Fit, Gap, Extension, Integration, Fallback o Deferred por fila prioritaria |
| Scope validation backlog | `ScopeItemId`, process flow y test script por candidate |
| Role/security backlog | Business catalog, role, SoD, privacy, launchpad visibility y fallback approval |
| Mexico evidence backlog | CFDI nomina, travel CFDI/XML, accounting reconciliation y approvals |
| Integration backlog | SuccessFactors, payroll provider, Concur/travel, IAM, Finance, Projects |

## CSV de Trabajo

Usar `docs/deliverables/s4hana-fiori-hire-to-retire-workshop-pack.csv` como backlog operativo. Columnas clave:

- `Session`
- `Workshop`
- `Priority`
- `BusinessOwner`
- `AppId`
- `AppName`
- `ScopeItemCandidate`
- `ScopeItemId`
- `TestScriptReference`
- `SecurityFocus`
- `SoDReview`
- `MexicoComplianceTopic`
- `EvidenceRequired`

## Siguientes Acciones

1. Enviar este pack a HR, Payroll, Finance, Travel/AP, Projects, Security/IAM, Integration y Mexico Tax/Legal para prelectura.
2. Completar `ScopeItemId` y `TestScriptReference` para las 7 agrupaciones H2R.
3. Confirmar boundaries de SuccessFactors, payroll provider, SAP Concur/travel, IAM y Finance antes del workshop.
4. Ejecutar las 7 sesiones y actualizar decision log, Fit/Gap log y evidencia tenant.
5. Convertir gaps aprobados en backlog de Explore/Realize.
