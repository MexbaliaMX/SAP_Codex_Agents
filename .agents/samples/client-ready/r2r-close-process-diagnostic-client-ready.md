# Record-to-Report Monthly Close Diagnostic

Playbook: `.agents/playbooks/process-diagnostic.md`  
Output profile: `.agents/output-profiles/executive-spanish.md`

## Hechos confirmados

| Campo | Valor |
|---|---|
| Proceso | Record-to-Report |
| Alcance | Cierre mensual de sociedad Mexico y reporte corporativo |
| Dolor principal | Retraso en cierre y evidencia de conciliacion incompleta |
| Evidencia revisada | Calendario de cierre, lista de tareas, bitacora de incidencias, muestra anonimizada de conciliacion |
| Evidencia pendiente | Logs productivos, aprobaciones reales, evidencia de auditoria, configuracion de cierre |

## Supuestos

- El objetivo de negocio es cumplir cierre en dia habil 5 con evidencia de control trazable.
- Los retrasos se concentran en conciliacion intercompania, accruals manuales y aprobaciones tardias.
- La recomendacion no implica cambio productivo hasta validar configuracion, controles y responsables.

## Diagnostico ejecutivo

El cierre mensual presenta friccion por dependencia de archivos manuales, evidencia distribuida y falta de escalamiento temprano. La prioridad debe ser reforzar gobierno del cierre, estandarizar evidencia por tarea critica y validar capacidades estandar antes de considerar reportes o automatizaciones adicionales.

## Hallazgos

| ID | Hallazgo | Categoria | Impacto | Evidencia revisada | Riesgo |
|---|---|---|---|---|---|
| R2R-001 | Conciliaciones intercompania llegan tarde y sin responsable alterno | Proceso / Gobierno | Retrasa revision del controlador | Bitacora de cierre | Alto |
| R2R-002 | Accruals se soportan con archivos fuera del flujo formal | Control / Datos | Debilita trazabilidad de auditoria | Muestra anonimizada | Alto |
| R2R-003 | Estatus de tareas criticas no se consolida diariamente | Reporte / Adopcion | Direccion detecta bloqueos tarde | Calendario y lista de tareas | Medio |

## Recomendacion

| Prioridad | Recomendacion | Capacidad estandar primero | Beneficio esperado | Validacion requerida |
|---|---|---|---|---|
| Alta | Definir calendario de cierre con responsables, suplentes y criterio de escalamiento | Gestion estandar de tareas de cierre / checklist gobernado | Menos retrasos por dependencia individual | Piloto de un ciclo |
| Alta | Estandarizar paquete de evidencia para accruals y conciliaciones | Adjuntos/aprobaciones y disciplina documental | Mejor trazabilidad y soporte de auditoria | Revision de auditor interno |
| Media | Crear vista ejecutiva diaria de bloqueos | Reporte/export estandar antes de desarrollo | Escalamiento oportuno | Validar campos y frecuencia |

## Riesgos y controles

| Riesgo | Control | Owner | Estado |
|---|---|---|---|
| Evidencia incompleta para auditoria | Checklist por tarea critica y repositorio controlado | Controller | Pendiente |
| Dependencia de aprobadores unicos | Responsable suplente y reglas de escalamiento | PMO / Finanzas | Pendiente |
| Automatizar sin corregir gobierno | Decision gate antes de custom build | Steering financiero | Pendiente |

## Validaciones pendientes

- Confirmar si la herramienta de cierre estandar esta dentro del alcance contratado y habilitado.
- Revisar tres paquetes reales de conciliacion con auditoria interna.
- Confirmar matriz RACI de intercompania.
- Validar que los reportes requeridos existen o pueden cubrirse con capacidades estandar.

## Responsables y siguientes acciones

| Accion | Responsable | Fecha objetivo |
|---|---|---|
| Preparar RACI de cierre y escalamiento | Controller | 2026-07-12 |
| Definir paquete minimo de evidencia | Auditoria interna / Finanzas | 2026-07-15 |
| Ejecutar piloto de cierre simulado | PMO | 2026-07-22 |
| Actualizar backlog de mejoras R2R | Product owner R2R | 2026-07-24 |
