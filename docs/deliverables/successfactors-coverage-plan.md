# SuccessFactors Coverage Plan

Fecha de preparacion: 2026-08-03

## Proposito

Este plan establece la base de cobertura para SAP SuccessFactors dentro del proceso Hire-to-Retire. Complementa el inventario S/4HANA H2R existente y evita confundir apps Fiori de S/4HANA con cobertura funcional completa de SuccessFactors.

El documento usa el registro de fuentes `docs/references/successfactors-source-register.csv` como evidencia inicial. No prueba alcance contratado, modulos activados, licenciamiento, configuracion, seguridad, integraciones, localizacion, payroll, CFDI nomina, roles, datos ni comportamiento real en tenant.

## Fuentes Base

| Capa | Fuente principal | Uso |
| --- | --- | --- |
| Suite y release | SAP SuccessFactors HCM; What's New Viewer | Confirmar modulos, documentacion vigente, version, lifecycle, cambios y deprecaciones |
| Modulos funcionales | Platform/RBP, Employee Central, Recruiting, Onboarding, Time, ECP, Learning, Performance and Goals, Compensation, Succession, Workforce Analytics, Work Zone | Guiar alcance funcional, Fit-to-Standard y preguntas de validacion |
| Integracion y API | OData V2 API Reference; SAP Business Accelerator Hub; Cloud ALM | Guiar interfaces, APIs, monitoreo, pruebas y evidencia tecnica |
| Procesos y arquitectura | SuccessFactors Process Library, IDPs, Architecture Leading Practices | Guiar workshops, diseno, estrategia de despliegue y decisiones cross-module |
| Tenant y cliente | Cloud ALM, tenant SuccessFactors, exports RBP, configuracion, logs, owners | Convertir cobertura source-guided en cobertura validada |

## Estado Actual

| Area | Estado |
| --- | --- |
| Registro de fuentes | Creado y parseado con 29 filas fuente |
| Cobertura H2R SuccessFactors | Mapeada en `docs/deliverables/successfactors-h2r-coverage-matrix.csv` |
| Cobertura S/4HANA H2R | Existente en `docs/deliverables/s4hana-fiori-hire-to-retire-app-inventory.md` |
| Fit-to-Standard H2R | Existente en `docs/deliverables/s4hana-fiori-hire-to-retire-workshop-pack.md` |
| Skill SuccessFactors HCM | Scaffold creado en `.agents/skills/sap-successfactors-hcm/SKILL.md` |
| Smoke prompts SuccessFactors HCM | Creados en `docs/validation/successfactors-hcm-smoke-prompts.md` |
| Forward-test SuccessFactors HCM | Completado en `docs/validation/successfactors-hcm-forward-test-report.md` con 9 pass, 3 warn, 0 fail |
| Tenant proof | Pendiente |
| Licenciamiento / suscripcion | Pendiente |
| Mexico payroll / CFDI nomina | Pendiente |

## Confirmado

| Confirmacion | Evidencia |
| --- | --- |
| Existe una base de fuentes oficiales para SuccessFactors | `docs/references/successfactors-source-register.csv` |
| El alcance SuccessFactors debe tratarse separado del inventario S/4HANA Fiori | El inventario H2R S/4HANA declara que Recruiting, Onboarding, Employee Central, Learning, Performance, Compensation y Benefits requieren fuentes SuccessFactors y tenant |
| H2R requiere validacion cross-system | El workshop pack H2R solicita delimitar SuccessFactors, payroll provider, SAP Concur/travel, IAM y Finance |
| Payroll core no esta probado por el inventario S/4HANA Fiori | `F8241` se conserva como handoff contable, no como motor de payroll |

## Source-Guided

Estas areas ya tienen fuentes iniciales y pueden usarse para preparar workshops, preguntas, matrices y backlogs, pero no para afirmar que un cliente las tiene activadas:

| Area | Cobertura inicial |
| --- | --- |
| Platform / RBP | Admin Center, RBP, privacidad, seguridad, Integration Center, IAS/IPS, eventos y extensibilidad |
| Employee Central | Core HR, foundation objects, employee/job data, position management, workflows, imports, HRIS sync y pais/legal entity prompts |
| Benefits | Employee Central Global Benefits, benefit types, enrollment, confirmation statements, Best Practices candidates, payroll integration modes and deduction/compensation handoff |
| Recruiting | Requisitions, candidate profiles, applications, offers, career sites, CRM, job distribution e integraciones con vendors |
| Onboarding | Onboarding actual, Onboarding 1.0 boundary, tasks, document flow, offboarding, crossboarding y Best Practices candidate |
| Time Management / Time Tracking | Time Off, Time Sheet, attendance, valuation, approvals, Time Tracking prerequisites y subscription boundary |
| Employee Central Payroll | ECP, point-to-point replication, Payroll Control Center, country specifics y payroll integration prompts |
| Learning | Learning assignments, curricula, libraries, content, compliance learning, Learning-only users e IAS/IPS |
| Performance and Goals | Goal Management, Performance Management, 360 Reviews, Calibration y Continuous Performance |
| Compensation | Compensation planning, variable pay, statements, eligibility, budgets y EC/performance dependencies |
| Succession and Development | Succession planning, career development, mentoring y talent pipeline |
| Workforce Analytics | Workforce metrics, measures, analytics workspace y data-source choices |
| Work Zone / UX | HR cards, quick actions, guided experiences, templates y SuccessFactors UX guidelines |
| Integration / API | OData V2, API discovery, sandbox patterns, Cloud ALM monitoring y integration governance |

## Open Validation Items

| Item | Validation needed |
| --- | --- |
| Licensed SuccessFactors modules | Contract/subscription evidence or authorized project scope |
| Tenant activation | Admin Center, Provisioning or module-specific setup evidence where accessible |
| Release applicability | What's New Viewer filtered by product/module, lifecycle and revision date |
| RBP and privacy | Role/group exports, target populations, permission reports, audit logs and privacy approval |
| Process scope | SAP Signavio Process Navigator, SAP Process Library, SAP Best Practices, Cloud ALM scope and owner decision |
| Integrations | API users, destinations, certificates/OAuth, Integration Center jobs, Integration Suite flows, logs and monitoring |
| Payroll boundary | ECP, SAP HCM, external provider or local system decision, payroll calendar, posting design and owner signoff |
| Mexico payroll | CFDI nomina, XML/PDF, UUID, PAC/SAT, cancellation/reissue, retention and accounting evidence |
| Benefits | Tenant/module decision, country availability, benefit types, payroll deduction handoff and provider boundary |
| Work Zone | Subscription, BTP trust/roles, content package, cards, quick actions and guided-experience evidence |

## H2R Coverage Matrix Summary

| H2R stage | Primary SuccessFactors sources | Current status |
| --- | --- | --- |
| Workforce strategy and planning | Employee Central; Workforce Analytics | Source-guided |
| Recruit | Recruiting | Source-guided |
| Hire | Employee Central; Recruiting; Onboarding | Source-guided |
| Onboard | Onboarding | Source-guided |
| Manage employee data and job changes | Employee Central | Source-guided |
| Time off, attendance and timesheet | Time Management; Time Tracking | Source-guided; subscription validation pending |
| Payroll preparation and execution | Employee Central Payroll | Source-guided; tenant and legal validation pending |
| Payroll accounting and finance handoff | Employee Central Payroll; S/4HANA H2R inventory | Partially source-guided; tenant validation pending |
| Benefits | Benefits; Employee Central | Source-guided; tenant and payroll validation pending |
| Learning | Learning | Source-guided |
| Performance and goals | Performance and Goals | Source-guided |
| Compensation | Compensation | Source-guided |
| Succession and career development | Succession and Development | Source-guided |
| Offboarding and retire | Onboarding; Employee Central | Source-guided |
| Access, privacy and controls | Platform / RBP | Source-guided |
| Analytics and reporting | Workforce Analytics | Source-guided |
| Integration and extensions | Integration / API | Source-guided |
| Employee experience and workspace | Work Zone; UX / Design | Source-guided |

La matriz operativa completa esta en `docs/deliverables/successfactors-h2r-coverage-matrix.csv`.

## Mexico Overlay

| Tema | Regla de cobertura |
| --- | --- |
| CFDI nomina | No marcar como confirmado sin evidencia del payroll provider o solucion SAP, XML/PDF, UUID, PAC/SAT y retencion documental |
| Payroll posting | Requiere diseno de contabilizacion, GL/cost center/internal order mapping, documentos contables y reconciliacion |
| Datos personales | Requiere RBP, privacidad, minimo privilegio, audit log y aprobacion del owner |
| Time costing | Requiere timesheet aprobado, objeto de costo, valuation/allocation y evidencia de posting |
| Offboarding | Requiere cierre de accesos, payroll final, beneficios, learning/licencias, travel/AP clearing y checklist de salida |

## Decision Log Starter

| Decision | Default | Owner | Evidence required |
| --- | --- | --- | --- |
| H2R system of record | TBD - SuccessFactors / S/4HANA / external | HR Operations Owner | Landscape, data ownership matrix, integration diagram |
| SuccessFactors module scope | TBD by module | PMO / HR Transformation Owner | Contract or project scope, tenant activation, owner signoff |
| Payroll boundary | TBD - ECP / SAP HCM / provider externo / local | Payroll Owner | Payroll calendar, posting design, Mexico CFDI requirement where applicable |
| Benefits boundary | TBD - SuccessFactors / payroll provider / external | Benefits Owner | Benefits scope, eligibility rules, enrollment/deduction evidence |
| Time boundary | TBD - EC Time / Time Tracking / S/4 / external | HR Time Owner | Time type/rules, approvals, payroll/costing handoff evidence |
| Security model | Default - least privilege | Security/IAM Owner | RBP exports, permission reports, privacy approval |
| Integration approach | Standard first | Integration Owner | API/destination/flow inventory, monitoring and error-handling evidence |

## Next Actions

1. Review the H2R coverage matrix with HR Operations, Payroll, Security/IAM, Integration, Finance, Talent, Benefits and Mexico Tax/Legal owners.
2. Mark each matrix row as in scope, out of scope or deferred for the target project.
3. Attach tenant evidence for any row promoted from source-guided to validated.
4. Collect tenant and owner evidence for rows in `docs/deliverables/successfactors-h2r-coverage-matrix.csv` before promoting coverage from source-guided to validated.
