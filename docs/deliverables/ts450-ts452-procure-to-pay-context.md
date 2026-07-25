# Contexto TS450/TS452 - Sourcing and Procurement en SAP S/4HANA

Fecha de preparacion: 2026-07-13

## Alcance revisado

Este contexto se genero a partir de los indices, metadatos y paginas de overview de cuatro manuales SAP instructor-led training:

| Archivo | Curso | Version | Paginas | Audiencia indicada |
| --- | --- | --- | ---: | --- |
| TS450_1_EN_Col23_Inst_Ltr.pdf | TS450 Sourcing and Procurement in SAP S/4HANA - Academy Part I 1/2 | 23 | 532 | Application Consultant |
| TS450_2_EN_Col23_Inst_Ltr.pdf | TS450 Sourcing and Procurement in SAP S/4HANA - Academy Part I 2/2 | 23 | 586 | Application Consultant, Project Manager, End User |
| TS452_1_EN_Col23_Inst_Ltr.pdf | TS452 Sourcing and Procurement in SAP S/4HANA - Academy Part II 1/2 | 23 | 554 | Application Consultant, Project Stakeholder, Super/Key/Power User |
| TS452_2_EN_Col23_Inst_Ltr.pdf | TS452 Sourcing and Procurement in SAP S/4HANA - Academy Part II 2/2 | 23 | 589 | Business Process Architect, Business Process Owner/Team Lead/Power User, Industry Specialist, Solution Architect |

## Lectura ejecutiva

Los materiales forman una ruta de academia para Source-to-Pay y Procure-to-Pay en SAP S/4HANA. TS450 construye la base de compras, abastecimiento, datos maestros, determinacion de fuentes, liberaciones, autoservicio, analitica y configuracion de documentos de compra. TS452 profundiza la ejecucion operativa y financiera del ciclo: gestion de inventario, entradas y salidas de mercancia, procesos especiales, inventario fisico, verificacion logistica de facturas, bloqueos, diferencias, ERS, GR/IR, valuacion de materiales y determinacion automatica de cuentas.

Visto como proceso end-to-end, el arco principal es:

Solicitud de compra -> determinacion de fuente -> aprobacion -> pedido/contrato/scheduling agreement -> entrada de mercancia o servicio -> verificacion de factura -> manejo de diferencias/bloqueos -> compensacion GR/IR y contabilizacion -> analitica y control.

## Contexto por curso

### TS450 parte I

Enfocado en fundamentos de Procure-to-Pay y consumo:

- Navegacion en SAP S/4HANA: SAP Fiori launchpad y SAP GUI.
- Proceso basico de compras: pedido, entrada de mercancia y factura.
- Unidades organizativas: estructura de compras, planta, area de valoracion y relacion con contabilidad.
- Datos maestros: Business Partner proveedor, material, registro info de compras, condiciones y valuacion.
- Stock vs consumo: solicitud de pedido, imputacion, pedidos con referencia, entradas valoradas y no valoradas.
- Transacciones avanzadas: contratos, lista de fuentes, ME51N, ME21N, MIGO y verificacion de factura.
- Planificacion basada en consumo: MRP, parametros de planificacion, lot sizing, scheduling, MRP clasico, MRP Live y conversion/evaluacion de resultados.

### TS450 parte II

Enfocado en abastecimiento, optimizacion de compras y configuracion:

- Datos maestros de compras: extension de materiales y datos de compras en Business Partner.
- Fuentes de suministro: info records, contratos centrales, contratos por grupo de material y scheduling agreements con/sin release documentation.
- Determinacion de fuente: source lists, quota arrangements, ejecucion con MRP, stock transfer y bloqueo de fuentes.
- Compras optimizadas: asignacion/procesamiento de solicitudes, creacion automatica de pedidos, monitoreo y Situation Handling.
- Parametros de usuario y autorizaciones funcionales de compradores.
- Procedimientos de liberacion y flexible workflow para solicitudes y pedidos.
- Self-service requisitioning y confirmacion de recepcion.
- Procesos especificos: invoicing plans y blanket purchase orders.
- Reporting y analitica: KPIs de contratos, actividades de grupos de compra y Procurement Overview.
- Customizing de compras: tipos de documento, screen layout, categorias de imputacion, message/output determination y SAP S/4HANA Output Management.

### TS452 parte I

Enfocado en Inventory Management y procesos fisicos/logisticos:

- Fundamentos de gestion de inventario e inventario fisico.
- Entradas de mercancia sin referencia, con referencia, para orden de produccion, con generacion automatica de pedido, cancelaciones, devoluciones y returns.
- Controles de entrada: unidad de precio de pedido, tolerancias, delivery completed indicator, fecha y vida util minima.
- Transfer postings y stock transfers entre almacenes y plantas.
- Reservas manuales y evaluacion/gestion de reservas.
- Salidas de mercancia planificadas y no planificadas, con referencia y determinacion de stock.
- Procesos especiales: consignment de proveedor y subcontracting.
- Inventario fisico con recount, posting block y procesos simplificados.
- Apps analiticas y listas clasicas de stock/documentos.
- Customizing de Inventory Management: documentos, movement types, MIGO y settings relacionados.
- Customizing de proveedor via Business Partner.

### TS452 parte II

Enfocado en verificacion de factura, diferencias, GR/IR, valuacion y determinacion contable:

- Logistics Invoice Verification: registro de facturas, tipos de verificacion, parking, workflow flexible, impuestos, descuentos, moneda extranjera e imputacion.
- Diferencias y bloqueo: variances, razones de bloqueo, reduccion de factura, reduccion automatica y liberacion de facturas bloqueadas.
- Debitos/creditos posteriores, costos planeados/no planeados de entrega, facturas sin referencia a pedido, notas de credito y reversas.
- Evaluated Receipt Settlement (ERS).
- Mantenimiento de GR/IR y reconciliacion mediante apps Fiori.
- Customizing de material: tipos de material, planta, field selection y field references.
- Valuacion e imputacion: determinacion automatica de cuentas, company code, valuation area, valuation class, account category reference, transaction keys y account grouping code.
- Casos especiales de valuacion: materiales no valuados, NLAG/UNBW y split valuation.
- Case study integrador: compra de brochures, componentes de produccion con value contract y articulos de oficina.

## Temas de proceso y controles

### Procure-to-Pay

- Solicitudes de compra, pedidos, contratos, scheduling agreements y blanket purchase orders.
- Entradas de mercancia, devoluciones, transferencias y salidas.
- Verificacion de factura, tolerancias, bloqueos, reducciones, ERS, credit memos y GR/IR.
- Imputacion, valuacion, determinacion de cuentas y evidencia contable.

### Source-to-Pay

- Info records, source lists, quota arrangements, contratos y scheduling agreements.
- Determinacion automatica de fuentes, bloqueo de proveedores/fuentes y monitoreo de compras.
- Analitica de contratos, procurement overview y seguimiento de grupos de compra.

### Plan-to-Produce / Design-to-Operate relacionados

- MRP, MRP Live, consumo basado en planificacion, stock transfers, reservas, produccion y subcontracting.
- Inventario fisico, exactitud de inventario, movement types y control operativo de almacen.

### Record-to-Report relacionado

- Valuacion de materiales, price control, GR/IR, determinacion automatica de cuentas, impuestos, moneda extranjera, descuentos y documentos contables derivados.

## Implicaciones para Mexico

Los PDF revisados son material generico SAP y no prueban localizacion fiscal mexicana. Para clientes en Mexico, superponer validaciones de:

- CFDI de egreso/ingreso, complementos de pago y relacion con cuentas por pagar.
- Carta Porte cuando la logistica de traslado de bienes sea relevante.
- Evidencia fiscal y audit trail entre pedido, entrada de mercancia, factura, pago y XML/PDF fiscal.
- Retenciones, impuestos, monedas, tipo de cambio y aprobaciones con segregacion de funciones.
- Reglas de archivo, conciliacion y evidencia para auditoria.

## Usos recomendados de este contexto

- Preparar talleres fit-to-standard de Procure-to-Pay, Source-to-Pay, Inventory Management y Logistics Invoice Verification.
- Construir mapas de proceso y listas de decision para compras, inventarios, facturas y valuacion.
- Identificar datos maestros criticos: Business Partner proveedor, material, info record, source list, contract, valuation class y account determination.
- Disenar escenarios de prueba integrales desde solicitud hasta factura, incluyendo diferencias y bloqueos.
- Separar temas funcionales, configuracion, controles, analitica y handoffs con Record-to-Report.

## Caveats de validacion

- Este contexto no sustituye la documentacion oficial SAP vigente ni evidencia de tenant.
- La version de curso revisada es 23; se debe validar disponibilidad actual de apps, workflows, APIs, configuracion y licenciamiento con SAP y el landscape del cliente.
- Los nombres de apps, transacciones y opciones se mantienen como contexto de entrenamiento; no deben asumirse como habilitados en un sistema especifico.
- No se recomienda tomar decisiones productivas de configuracion, seguridad, integracion o arquitectura sin aprobacion explicita y evidencia del ambiente.

## Siguientes acciones sugeridas

- Definir si el objetivo es formacion, discovery, fit-to-standard, diseno de pruebas, diagnostico o preparacion de consultores.
- Seleccionar el proceso foco: Source-to-Pay, Procure-to-Pay, Inventory Management, Invoice Verification o Valuation/Account Determination.
- Crear una matriz de escenarios de negocio con roles, datos maestros, documentos, controles, variantes Mexico y evidencia esperada.
- Validar contra el tenant del cliente las apps Fiori, roles, workflows, customizing y procesos activados.
