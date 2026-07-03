# Order-to-Cash Mexico Fit-to-Standard Delta Log

Playbook: `.agents/playbooks/fit-to-standard-workshop.md`  
Output profile: `.agents/output-profiles/executive-spanish.md`

## Hechos confirmados

| Campo | Valor |
|---|---|
| Proceso | Order-to-Cash |
| Taller | Facturacion, cobranza y entrega Mexico |
| Alcance | Sociedad mexicana, canal mayorista, entregas nacionales |
| Fase SAP Activate | Explore / Fit-to-Standard |
| Evidencia revisada | Minuta de taller, matriz de escenarios O2C, ejemplos anonimizados de factura y entrega |
| Evidencia no revisada | Configuracion productiva, XML CFDI real, autorizacion fiscal/legal, pruebas en tenant productivo |

## Supuestos

- El alcance considera venta nacional con entrega fisica de mercancia.
- La emision CFDI, complementos de pago y Carta Porte son relevantes, pero requieren validacion fiscal/legal del cliente.
- La solucion objetivo debe priorizar comportamiento estandar y configuracion antes de extension.

## Registro de deltas

| ID | Paso de proceso | Comportamiento estandar revisado | Necesidad de negocio / delta | Categoria | Disposicion propuesta | Responsable | Evidencia requerida | Fecha objetivo | Estado |
|---|---|---|---|---|---|---|---|---|---|
| O2C-001 | Creacion de factura | La facturacion se genera desde entrega/pedido segun flujo definido | Confirmar campos fiscales obligatorios para CFDI 4.0 por tipo de venta | Localizacion / Control | Validar | Lider fiscal | XML de prueba, matriz fiscal, evidencia tenant QA | 2026-07-15 | Abierto |
| O2C-002 | Aplicacion de cobranza | El pago se registra y compensa contra cuenta por cobrar | Definir corte operativo y responsable del complemento de pago | Proceso / Localizacion | Configurar proceso y RACI | Cuentas por cobrar | Politica de cobro, muestra de pago, flujo aprobado | 2026-07-16 | Abierto |
| O2C-003 | Entrega nacional | La entrega soporta salida de mercancia y evidencia logistica | Confirmar escenarios que detonan Carta Porte y datos fuente | Localizacion / Integracion | Validar | Logistica | Matriz de transporte, datos transportista, revision fiscal/legal | 2026-07-18 | Abierto |
| O2C-004 | Excepciones de facturacion | Bloqueos y rechazos pueden controlarse por estatus operativo | Se requiere tablero de excepciones para facturas rechazadas o pendientes | Reporte / Adopcion | Usar reporte estandar primero | Lider O2C | Lista de excepciones, usuarios, frecuencia | 2026-07-19 | Abierto |

## Riesgos y controles

| Riesgo | Impacto | Control recomendado | Aprobacion requerida |
|---|---|---|---|
| Emitir CFDI sin evidencia de validacion fiscal | Riesgo fiscal y retrabajo operativo | Paquete de evidencia CFDI firmado por responsable fiscal | Fiscal/legal del cliente |
| No definir responsable del complemento de pago | Retraso en cumplimiento y conciliacion | RACI AR-fiscal con tiempos de corte | Owner O2C y fiscal |
| Carta Porte no validada por escenario | Riesgo operativo y fiscal en entregas | Matriz de aplicabilidad por ruta/tipo de movimiento | Fiscal/legal y logistica |

## Validaciones pendientes

| Validacion | Responsable | Evidencia esperada | Fecha objetivo |
|---|---|---|---|
| Ejecutar factura de prueba y revisar XML/PDF | Lider fiscal | XML, PDF, estatus SAT, captura QA | 2026-07-15 |
| Confirmar proceso de complemento de pago | Cuentas por cobrar | Flujo aprobado y muestra de conciliacion | 2026-07-16 |
| Validar Carta Porte por escenario logistico | Logistica / fiscal | Matriz firmada y evidencia de datos maestros | 2026-07-18 |

## Recomendacion

Avanzar de forma condicionada con el diseno estandar de Order-to-Cash, sujeto a cerrar las validaciones fiscales de CFDI, complemento de pago y Carta Porte antes de aprobar configuracion productiva, extensiones o transporte.

## Responsables y siguientes acciones

| Accion | Responsable | Fecha |
|---|---|---|
| Preparar paquete de evidencia fiscal QA | Lider fiscal | 2026-07-15 |
| Confirmar RACI de cobranza y complemento | Owner O2C | 2026-07-16 |
| Revisar matriz Carta Porte con logistica | Logistica | 2026-07-18 |
| Actualizar backlog y decision log | PMO | 2026-07-19 |
