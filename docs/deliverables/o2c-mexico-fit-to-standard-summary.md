# Order-to-Cash Mexico Fit-to-Standard Summary

Playbook usado: `plugins/sap-codex-deliverables/skills/sap-deliverable-templates/assets/operating-layer/playbooks/fit-to-standard-workshop.md`  
Perfil de salida usado: `plugins/sap-codex-deliverables/skills/sap-deliverable-templates/assets/operating-layer/output-profiles/executive-spanish.md`  
Plantilla base: `plugins/sap-codex-deliverables/skills/sap-deliverable-templates/assets/templates/fit-to-standard-delta-log.md`

## Hechos confirmados

| Campo | Valor |
|---|---|
| Solicitud | Preparar un resumen Fit-to-Standard para Order-to-Cash Mexico usando `sap-deliverable-templates` y los playbooks del operating layer. |
| Proceso | Order-to-Cash: pedido, entrega, facturacion, e-invoice, cuentas por cobrar, pago, compensacion y disputas. |
| Pais / localizacion | Mexico. CFDI, complementos de pago, Carta Porte, evidencia fiscal y trazabilidad de auditoria se tratan como temas de validacion, no como hechos confirmados. |
| Fase sugerida | SAP Activate Explore / Fit-to-Standard. |
| Evidencia revisada | Instrucciones de proyecto, skill `sap-deliverable-templates`, playbook Fit-to-Standard, perfil ejecutivo en espanol, skill Order-to-Cash y referencias internas de Mexico. |
| Evidencia no revisada | Minutas reales de taller, documentacion de proceso del cliente, tenant SAP, configuracion, XML/PDF CFDI, integraciones, matriz fiscal/legal, aprobaciones formales o pruebas en QA/PRD. |

## Supuestos

- El alcance corresponde a una entidad legal mexicana con operaciones de venta nacional y flujo Order-to-Cash en SAP S/4HANA.
- El taller busca confirmar adopcion de proceso estandar antes de decidir configuracion, extension, integracion o desarrollo.
- La emision de CFDI, complementos de pago y Carta Porte pueden ser relevantes, pero su aplicabilidad depende de escenarios reales de venta, cobranza, transporte y obligaciones fiscales del cliente.
- No se cuenta todavia con evidencia de tenant, por lo que toda declaracion de comportamiento SAP, cumplimiento fiscal, integracion, licenciamiento o disponibilidad de funcionalidad queda pendiente de validacion.
- Los responsables nombrados son roles sugeridos; deben reemplazarse por owners reales del cliente.

## Resumen ejecutivo

El proceso Order-to-Cash Mexico puede avanzar en Fit-to-Standard si el equipo mantiene una posicion standard-first: documentar el flujo base de pedido a cobranza, aceptar el estandar cuando cubra el resultado de negocio y convertir cada excepcion en delta con owner, evidencia y fecha de decision.

La decision principal no es aprobar aun una solucion productiva, sino cerrar evidencia para los puntos fiscales y operativos criticos: CFDI, complementos de pago, Carta Porte, reconciliacion de cuentas por cobrar, manejo de rechazos/cancelaciones y trazabilidad de auditoria. Sin esa evidencia, cualquier recomendacion de configuracion productiva, extension, transporte o declaracion de cumplimiento debe considerarse condicionada.

## Registro de fit/gap y deltas

| ID | Paso de proceso | Enfoque estandar a revisar | Necesidad / delta candidato | Categoria | Disposicion propuesta | Responsable sugerido | Evidencia requerida | Estado |
|---|---|---|---|---|---|---|---|---|
| O2C-MX-001 | Captura de pedido | Crear pedido con datos de cliente, condiciones comerciales, impuestos, bloqueos y salida posterior hacia entrega/facturacion. | Confirmar campos fiscales, uso CFDI, metodo/forma de pago y reglas por tipo de cliente/venta. | Localizacion / Datos / Control | Validar antes de configurar productivo. | Owner O2C / Fiscal | Matriz fiscal, datos maestros de cliente, muestra de pedido, evidencia QA. | Abierto |
| O2C-MX-002 | Entrega y salida de mercancia | Ejecutar entrega, picking, salida de mercancia y evidencia logistica segun proceso estandar. | Determinar si Carta Porte aplica por escenario, ruta, transportista, modalidad y tipo de movimiento. | Localizacion / Integracion / Control | Validar aplicabilidad y datos fuente. | Logistica / Fiscal | Matriz de transporte, datos de transportista, escenarios de entrega, revision fiscal/legal. | Abierto |
| O2C-MX-003 | Facturacion y e-invoice | Generar documento de facturacion desde pedido/entrega segun flujo y emitir salida fiscal conforme a diseno validado. | Confirmar estructura CFDI, UUID, XML/PDF, estatus SAT, cancelacion, refacturacion y almacenamiento de evidencia. | Localizacion / Control / Auditoria | Validar con prueba end-to-end en QA. | Fiscal / Facturacion | XML/PDF de prueba, estatus SAT, captura QA, politica de resguardo. | Abierto |
| O2C-MX-004 | Cobranza y compensacion | Registrar pagos, compensar cuentas por cobrar y mantener trazabilidad entre factura y pago. | Definir corte operativo y owner para complementos de pago, conciliacion y excepciones de referencia. | Proceso / Localizacion / Control | Configurar proceso y RACI despues de validacion. | Cuentas por cobrar / Fiscal | Politica AR, muestra de pago, flujo aprobado, evidencia de conciliacion. | Abierto |
| O2C-MX-005 | Disputas, rechazos y cancelaciones | Gestionar bloqueos, rechazos, ajustes y seguimiento operativo con responsabilidad definida. | Alinear reglas de cancelacion/reemision CFDI, notas de credito, disputas comerciales y evidencia para auditoria. | Proceso / Control / Reporte | Documentar decision y backlog. | Owner O2C / Fiscal / Finanzas | Politica de excepciones, escenarios reales, bitacora de aprobaciones. | Abierto |
| O2C-MX-006 | Monitoreo y reporte | Usar reportes y monitoreo estandar primero para visibilidad de documentos, errores y partidas abiertas. | Confirmar si reportes estandar cubren excepciones CFDI, Carta Porte, complementos y aging AR; evitar custom sin prueba del gap. | Reporte / Adopcion | Evaluar reporte estandar antes de extension. | O2C / Finanzas / TI | Lista de reportes requeridos, muestra de errores, frecuencia, usuarios. | Abierto |

## Riesgos y controles

| Riesgo | Impacto | Control recomendado | Aprobacion requerida |
|---|---|---|---|
| Asumir cumplimiento CFDI sin evidencia fiscal y tecnica. | Riesgo fiscal, retrabajo, bloqueo de facturacion y debilidad de auditoria. | Paquete de evidencia con XML/PDF, UUID, estatus SAT, reglas de cancelacion/reemision y aprobacion fiscal. | Fiscal/legal del cliente. |
| No definir responsabilidad del complemento de pago. | Retraso en cobranza, conciliacion incompleta y evidencia fiscal dispersa. | RACI entre cuentas por cobrar, fiscal, tesoreria y soporte; tiempos de corte y excepciones. | Owner O2C, finanzas y fiscal. |
| Carta Porte tratada como generica sin matriz de aplicabilidad. | Riesgo operativo y fiscal en entregas con transporte. | Matriz por escenario logistico, ruta, transportista, modalidad y datos fuente. | Fiscal/legal y logistica. |
| Aprobar extension sin comprobar alternativa estandar. | Mayor costo, complejidad de soporte y riesgo de upgrade. | Decision log standard-first: alternativa estandar, brecha demostrada, beneficio, costo, owner y aprobacion. | Comite de diseno / arquitectura. |
| Falta de trazabilidad de auditoria de pedido a pago. | Dificultad para soportar conciliacion, auditoria y disputas. | Evidencia end-to-end desde pedido, entrega, factura, CFDI, pago, complemento, compensacion y reporte. | Finanzas, fiscal y auditoria interna. |

## Validaciones pendientes

| Validacion | Responsable sugerido | Evidencia esperada | Resultado esperado |
|---|---|---|---|
| Ejecutar escenario de pedido a factura en QA. | Owner O2C / TI funcional | Pedido, entrega, factura, contabilizacion, evidencias de salida y capturas. | Confirmar fit estandar o registrar delta especifico. |
| Validar CFDI con responsable fiscal. | Fiscal | XML/PDF, UUID, estatus SAT, campos obligatorios, reglas de cancelacion/reemision. | Aprobacion fiscal condicionada o lista de brechas. |
| Confirmar proceso de complementos de pago. | Cuentas por cobrar / Fiscal | Muestra de pago, compensacion, politica de corte, RACI y evidencia de complemento. | Decision de proceso, owner y controles. |
| Determinar aplicabilidad de Carta Porte. | Logistica / Fiscal / Legal | Matriz de escenarios, transportistas, datos maestros y criterios fiscales. | Decision por escenario logistico. |
| Revisar reportes y monitoreo estandar. | O2C / Finanzas / TI | Lista de excepciones, reportes estandar evaluados, usuarios y frecuencia. | Confirmar adopcion estandar o backlog de reporte. |
| Confirmar integraciones y responsabilidades de soporte. | TI / Arquitectura / AMS | Inventario de interfaces, errores esperados, monitoreo, SLAs y owners. | Modelo de soporte y plan de pruebas. |

## Recomendacion

Avanzar de forma condicionada con el diseno estandar de Order-to-Cash Mexico durante Explore, sin aprobar configuracion productiva, extensiones ni transportes hasta cerrar las validaciones fiscales, logisticas, de cobranza y auditoria. Cada delta debe quedar en el registro Fit-to-Standard con owner, evidencia requerida, disposicion, fecha de decision y foro de aprobacion.

## Responsables y siguientes acciones

| Accion | Responsable sugerido | Foro / evidencia | Prioridad |
|---|---|---|---|
| Confirmar alcance del taller, entidad legal, canales, tipos de venta y sistema de registro. | PMO / Owner O2C | Agenda y acta de taller. | Alta |
| Preparar paquete de evidencia fiscal QA para CFDI. | Fiscal / TI funcional | XML/PDF, UUID, estatus, capturas y decision fiscal. | Alta |
| Construir matriz de Carta Porte por escenario logistico. | Logistica / Fiscal | Matriz revisada y aprobacion fiscal/legal. | Alta |
| Definir RACI de cobranza, complementos de pago y conciliacion. | Cuentas por cobrar / Finanzas | RACI aprobado y politica operativa. | Alta |
| Evaluar reportes estandar antes de abrir backlog de extension. | O2C / Finanzas / TI | Evidencia de reporte estandar, brecha demostrada y decision log. | Media |
| Actualizar delta log, RAID y backlog con owners reales. | PMO / Scrum master | Backlog en herramienta oficial del proyecto. | Media |

## Nota de uso

Este documento es un borrador ejecutivo basado en plantillas y playbooks internos. No constituye validacion legal, fiscal, de seguridad, licenciamiento, tenant behavior, readiness productiva ni aprobacion de transporte. Debe completarse con evidencia del cliente y aprobacion explicita de los responsables antes de usarse para decisiones productivas.
