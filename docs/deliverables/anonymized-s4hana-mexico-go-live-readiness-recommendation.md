# Recomendación de preparación para salida a productivo - S/4HANA México

Playbook: `sap-deliverable-templates/assets/operating-layer/playbooks/go-live-readiness.md`  
Perfil de salida: `evidence-bound-audit`  
Fase SAP Activate: Deploy  
Fecha del borrador: 2026-07-04

## Alcance y evidencia revisada

| Campo | Valor |
|---|---|
| Programa / release | Release anonimizado de SAP S/4HANA para México |
| Fecha planeada de salida | Pendiente de confirmación |
| Foro de decisión | Comité de salida a productivo / steering committee, pendiente de confirmar |
| Procesos considerados | Record-to-Report, Procure-to-Pay, Order-to-Cash y procesos logísticos/fiscales relacionados, sujeto a confirmación de alcance |
| Evidencia revisada | Solicitud del usuario, plantilla de go-live readiness, playbook de go-live readiness y perfil evidence-bound audit |
| Evidencia no recibida | Evidencia de tenant, defect log vigente, plan de cutover, conciliaciones de migración, pruebas E2E, aprobaciones fiscales/legales, evidencias de seguridad, aprobación de transporte productivo y plan de hypercare |

Este documento es un borrador de recomendación ejecutiva. No constituye aprobación fiscal, legal, de seguridad, de arquitectura, de transporte a productivo ni de salida a productivo.

## Hechos confirmados

- La solicitud se refiere a un release anonimizado de SAP S/4HANA para México.
- No se proporcionó evidencia directa del tenant, bitácoras de pruebas, documentos de aprobación, reportes de defectos, resultados de conciliación, configuración productiva, integraciones activas ni autorizaciones formales.
- La recomendación debe marcar explícitamente pendientes de tenant, fiscal/legal, seguridad y aprobación productiva.
- El marco de salida solicitado es evidence-bound audit, por lo que toda conclusión no respaldada debe quedar como pendiente de validación.

## Supuestos

| Supuesto | Impacto si no se confirma | Validación requerida |
|---|---|---|
| El release cubre entidades legales mexicanas | Puede cambiar los requisitos de CFDI, complementos, Carta Porte, impuestos, evidencias y controles | Confirmación de alcance legal, fiscal y operativo |
| Order-to-Cash y Record-to-Report están dentro del alcance | Puede afectar facturación, cuentas por cobrar, contabilización, cierre y evidencia de auditoría | Scope aprobado por dueños de proceso |
| Existen integraciones y jobs críticos para operación diaria | Puede generar riesgo operativo si no hay monitoreo, soporte y recuperación | Inventario de interfaces, jobs, monitores y responsables |
| El comité de decisión aceptará riesgos residuales documentados | Sin aceptación formal, los riesgos no deben tratarse como aprobados | Minuta o acta de comité con aprobaciones y condiciones |

## Resumen de preparación por frente

| Frente | Criterio de salida | Evidencia requerida | Dueño sugerido | Estado | ¿Bloqueador? |
|---|---|---|---|---|---|
| Cutover | Runbook aprobado, ventanas, puntos de control, rollback y comunicaciones | Runbook final, ensayo de cutover, lista de issues y aprobación PMO | PMO / cutover lead | Pendiente | Sí |
| Migración de datos | Cargas reconciliadas y aprobadas por negocio | Reporte de carga, conciliación, excepciones y signoff por proceso | Data lead / process owners | Pendiente | Sí |
| Pruebas | Sin defectos Sev1 abiertos; Sev2 aceptados con workaround aprobado | Defect log vigente, evidencia E2E, UAT signoff y matriz de workarounds | Test lead | Pendiente | Sí |
| Integraciones | Flujos críticos probados, monitoreados y con dueño de soporte | Evidencia E2E, pruebas de error/reintento, monitoreo y runbook de soporte | Integration lead | Pendiente | Sí |
| Seguridad | Roles validados, SoD revisado, accesos productivos y excepciones aceptadas | Matriz de roles, evidencias de prueba, SoD, logs y aprobación de seguridad | Security lead | Pendiente | Sí |
| Operaciones | Hypercare, AMS, monitoreo, jobs, respaldos y escalamiento listos | Plan de soporte, rota, SLAs, monitoreo, jobs críticos y contactos | Operations lead | Pendiente | Sí |
| Fiscal/legal México | CFDI, complementos de pago, Carta Porte, cancelación/reemisión, almacenamiento XML/PDF y trazabilidad auditados | Paquete fiscal/legal firmado por dueño fiscal/legal, evidencia SAT y conciliación | Fiscal/legal owner | Pendiente | Sí |
| Negocio y capacitación | Usuarios críticos preparados y continuidad operativa aprobada | Asistencia, evaluación de preparación, plan de soporte y comunicación | Change lead / process owners | Pendiente | Condicional |

## Bloqueadores No-Go

| ID | Bloqueador | Impacto | Dueño | Evidencia requerida | Fecha objetivo |
|---|---|---|---|---|---|
| GL-001 | No hay evidencia de validación en tenant productivo o preproductivo equivalente | La recomendación no puede confirmar comportamiento real, datos, roles, jobs, interfaces ni monitoreo | Solution architect / tenant owner | Evidencia de pruebas, configuración relevante, transportes, logs y reconciliaciones del entorno objetivo | Pendiente |
| GL-002 | Aprobación fiscal/legal México no recibida | Riesgo de incumplimiento en facturación, pagos, transporte, evidencia fiscal o auditoría | Fiscal/legal owner | Signoff de CFDI, complementos de pago, Carta Porte cuando aplique, SAT identifiers, XML/PDF, cancelación/reemisión y conciliación | Pendiente |
| GL-003 | Seguridad y accesos no aprobados | Riesgo de accesos indebidos, usuarios bloqueados, SoD no aceptado o falta de trazabilidad | Security lead | Matriz de roles, SoD, excepciones aprobadas, logs, provisioning y soporte | Pendiente |
| GL-004 | Aprobación de producción no recibida | El equipo no debe ejecutar transportes, cutover ni activaciones productivas sin autorización formal | Program sponsor / steering committee | Acta de go/no-go, aceptación de riesgos, plan de rollback y autorización de ejecución | Pendiente |

## Aprobaciones condicionales requeridas

| Condición | Requerida antes de | Dueño | Evidencia | Dueño de decisión | Estado |
|---|---|---|---|---|---|
| Cierre de defectos críticos y aceptación de Sev2 con workaround | Go/no-go final | Test lead | Defect log firmado, workaround probado y aceptación de negocio | Steering committee | Abierto |
| Ensayo final de cutover completado | Go/no-go final | Cutover lead | Minuta de rehearsal, issues cerrados, tiempos reales y rollback validado | PMO / sponsor | Abierto |
| Conciliación final de datos maestros y saldos | Go/no-go final | Data lead | Reporte de conciliación y signoff por Record-to-Report, Procure-to-Pay y Order-to-Cash | Process owners | Abierto |
| Evidencia de monitoreo y soporte Day 0 | Day -3 | Operations lead | Rota hypercare, matriz de escalamiento, jobs, alertas y runbooks | Operations owner | Abierto |
| Validación fiscal/legal México | Go/no-go final | Fiscal/legal owner | Paquete de evidencia fiscal y legal firmado | Legal/tax approver | Abierto |

## Riesgos y controles

| Riesgo | Control esperado | Responsable | Foro de aceptación | Estado |
|---|---|---|---|---|
| Emisión, cancelación o conciliación fiscal incompleta | Validación integral con dueño fiscal/legal y evidencia trazable de punta a punta | Fiscal/legal owner | Comité de salida / legal-tax | Pendiente |
| Integraciones críticas sin prueba de error y recuperación | Pruebas de mensajes fallidos, reintentos, monitoreo y runbook operativo | Integration lead | Comité técnico / operaciones | Pendiente |
| Accesos productivos no alineados a funciones reales | Prueba de roles por proceso, SoD, excepciones y soporte de altas/cambios | Security lead | Comité de seguridad | Pendiente |
| Migración sin conciliación firmada | Conciliación por objeto, proceso y cuenta relevante, con dueños de negocio | Data lead | Process owners | Pendiente |
| Hypercare insuficiente para estabilización | Rota, canales, severidades, SLAs, war room y criterios de salida | Operations lead | PMO / sponsor | Pendiente |

## Elementos abiertos de validación

| Categoría | Validación pendiente | Dueño sugerido | Acción requerida | Fecha |
|---|---|---|---|---|
| Tenant | Evidencia del entorno objetivo, transportes, configuración relevante, jobs, logs, roles e integraciones | Tenant owner / solution architect | Compilar paquete de evidencias técnicas y de negocio | Pendiente |
| Fiscal/legal | CFDI, complementos de pago, Carta Porte cuando aplique, impuestos, SAT identifiers, almacenamiento XML/PDF, cancelación/reemisión y auditoría | Fiscal/legal owner | Emitir validación formal y limitaciones de alcance | Pendiente |
| Seguridad | Roles, SoD, provisioning, logs, usuarios críticos, soporte y excepciones | Security lead | Completar revisión y obtener signoff | Pendiente |
| Producción | Cutover, rollback, transportes, comunicaciones, plan de soporte y autorización final | Program sponsor / PMO | Convocar go/no-go con acta de decisión | Pendiente |

## Recomendación

La recomendación en este punto es **No-Go para una aprobación incondicional de salida a productivo**.

El release puede avanzar a **Go con condiciones** únicamente si, antes del foro final de go/no-go, se obtiene evidencia suficiente y aprobación formal sobre los cuatro frentes obligatorios:

1. Validación de tenant y evidencia operativa del entorno objetivo.
2. Aprobación fiscal/legal México, incluyendo CFDI, complementos de pago, Carta Porte cuando aplique, trazabilidad SAT, almacenamiento XML/PDF, cancelación/reemisión, conciliación y auditabilidad.
3. Signoff de seguridad, roles, SoD, provisioning, logs y soporte.
4. Aprobación formal de producción, cutover, rollback, transportes, activaciones, hypercare y aceptación de riesgos residuales.

La decisión final debe quedar documentada por el comité autorizado, con dueños, fechas, evidencias adjuntas, condiciones abiertas, riesgos residuales aceptados y criterios de reversa. Sin esa evidencia, no debe comunicarse preparación productiva ni ejecutar actividades con impacto en producción.
