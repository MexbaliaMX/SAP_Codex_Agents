# Contexto TS4F01 - Financial Accounting en SAP S/4HANA

Fecha de preparacion: 2026-07-13

## Alcance revisado

Este contexto se genero a partir de indices, metadatos, paginas de overview y objetivos por unidad de dos manuales SAP instructor-led training:

| Archivo | Curso | Version | Paginas | Audiencia indicada |
| --- | --- | --- | ---: | --- |
| TS4F01_1_EN_Col20_Inst_Ltr.pdf | TS4F01 Financial Accounting in SAP S/4HANA Academy Part I 1/2 | 20 | 543 | Business Analyst |
| TS4F01_2_EN_Col20_Inst_Ltr.pdf | TS4F01 Financial Accounting in SAP S/4HANA Academy Part I 2/2 | 20 | 599 | Application Consultant, Business Analyst, Business Process Architect, Business Process Owner/Team Lead/Power User, Super/Key/Power User |

## Lectura ejecutiva

Los materiales forman una ruta de academia para Record-to-Report en SAP S/4HANA con foco en Contabilidad Financiera. La parte 1 construye la base funcional y de configuracion: SAP S/4HANA y SAP Fiori, unidades organizativas, settings base de contabilidad general, datos maestros, control documental, reglas de contabilizacion, impuestos, transacciones entre sociedades y compensacion de partidas abiertas.

La parte 2 profundiza procesos operativos y de control: pagos automaticos, bancos propios, SEPA, programa de reclamaciones, correspondencia, operaciones de mayor especial, anticipos, integracion con compras y ventas, parking y workflow de documentos, validaciones, sustituciones y archivo de datos financieros.

Visto como proceso end-to-end, el arco principal es:

Evento de negocio o cierre contable -> datos maestros y estructura organizativa -> documento financiero -> validaciones, impuestos y controles de autorizacion -> compensacion, pagos, reclamaciones o ajustes -> reporting financiero, evidencia de auditoria y archivo.

## Contexto por archivo

### TS4F01 parte I

Enfocado en fundamentos de Record-to-Report y configuracion base:

- Vision general de SAP S/4HANA y SAP Fiori Launchpad.
- Unidades organizativas de contabilidad: company code, company ID, controlling area y relacion con settings basicos.
- Principio de variantes: fiscal year variant, currency keys, exchange rate types y currency types.
- Practicas comunes de implementacion SAP S/4HANA.
- Datos maestros: chart of accounts, cuentas de mayor, account groups, field status, reconciliation accounts, collective processing, profit centers, cost centers, segments y Business Partner para clientes/proveedores.
- Control documental: estructura del documento financiero, number ranges, document types, posting keys, field status groups, posting periods, authorizations, tolerance groups y documentos simples.
- Control de contabilizacion: document splitting, default values, change control, reversals, payment terms, cash discounts, tax codes y cross-company code transactions.
- Compensacion financiera: open item clearing, posting with clearing, payment differences, tolerance groups y exchange rate differences.

### TS4F01 parte II

Enfocado en ejecucion financiera, controles operativos y gobierno de datos:

- Pagos automaticos: payment run, bancos, house banks, house bank accounts, bank selection, payment proposal, payment run, payment media, automatizacion y digital payments.
- Dunning: master data y documentos relevantes para reclamaciones, configuracion de procedimiento, parametros, proposal list, ejecucion y emision de notices.
- Correspondencia: tipos de correspondencia, print programs, transacciones, reason codes y generacion de correspondencia.
- Special General Ledger: guarantees, down payment requests, received down payments, customer invoice clearing, individual value adjustments, configuracion de special G/L y handoffs con compras y ventas.
- Parking documents: document holding, parking, processing, workflow basics y Journal Entry Verification.
- Validaciones y sustituciones: reglas, sets, validaciones y sustituciones a nivel de line item.
- Archivo de datos en contabilidad financiera: objetos de archivo, documentos financieros, transaction figures, compression run y master data.

## Temas de proceso y controles

### Record-to-Report

- Estructura financiera: company code, ledger, chart of accounts, fiscal calendar, currencies, profit centers y segments.
- Registro contable: document types, number ranges, posting keys, field status, posting periods, authorizations y tolerance groups.
- Calidad y gobierno del dato: cuentas de mayor, reconciliation accounts, Business Partner, sensitive fields, default values y change control.
- Cierre y conciliacion: open item clearing, payment differences, exchange rate differences, document splitting, reversals y cross-company code postings.
- Evidencia: documentos financieros, workflow, correspondence, dunning, archiving y trazabilidad de cambios.

### Procure-to-Pay relacionado

- Integracion con compras para anticipos, special G/L, proveedores, automatic payments y bank data.
- Impacto en pagos, descuentos, tolerancias, compensaciones, impuestos y evidencia de cuentas por pagar.

### Order-to-Cash / Lead-to-Cash relacionado

- Clientes, reclamaciones, correspondencia, customer invoices, down payments, clearing, tax codes y cuentas por cobrar.
- Handoff financiero desde ventas hacia contabilizacion, compensacion, cobro y seguimiento de deuda.

### Source-to-Pay y Treasury relacionados

- Relacion bancaria, house banks, payment methods, bank selection y payment media.
- Necesidad de validar alcance real de cash management y digital payments contra licenciamiento y tenant.

## Implicaciones para Mexico

Los PDF revisados son material generico SAP y no prueban localizacion fiscal mexicana. Para clientes en Mexico, superponer validaciones de:

- CFDI de ingreso, egreso y complementos de pago para cuentas por cobrar, cuentas por pagar, anticipos y compensaciones.
- Evidencia entre documento financiero, XML/PDF fiscal, pago bancario, complemento de pago y polizas contables.
- Tratamiento de impuestos, retenciones, tipo de cambio, moneda extranjera y diferencias cambiarias conforme al escenario fiscal.
- Reglas de aprobacion, segregation of duties, sensitive fields, workflow y bitacora de cambios para auditoria.
- Archivo y conservacion de evidencia fiscal/contable, incluyendo impacto de data archiving sobre disponibilidad de soporte documental.
- Carta Porte solo cuando el proceso financiero se conecte con traslado de bienes o evidencia logistica fiscal.

## Usos recomendados de este contexto

- Preparar talleres fit-to-standard de Record-to-Report con foco en contabilidad general, datos maestros, documentos, pagos, reclamaciones y controles.
- Construir mapas de proceso para contabilizacion, compensacion, pagos automaticos, reclamaciones, anticipos, parking/workflow y archivo.
- Identificar datos maestros criticos: company code, chart of accounts, G/L account, reconciliation account, Business Partner, bank master, house bank, profit center, cost center y segment.
- Disenar escenarios de prueba integrales desde documento financiero hasta compensacion, pago, reclamacion, ajuste, reporte y evidencia.
- Separar temas funcionales, configuracion, controles, analitica, integraciones con Procure-to-Pay / Order-to-Cash y validaciones Mexico.

## Caveats de validacion

- Este contexto no sustituye la documentacion oficial SAP vigente ni evidencia de tenant.
- La version de curso revisada es 20; se debe validar disponibilidad actual de apps, workflows, APIs, configuracion y licenciamiento con SAP y el landscape del cliente.
- Los nombres de apps, transacciones y opciones se mantienen como contexto de entrenamiento; no deben asumirse como habilitados en un sistema especifico.
- El material contiene disclaimers de SAP sobre cambios, traduccion, disponibilidad y no compromiso de roadmap; por lo tanto, cualquier claim de producto, API, licenciamiento o tenant debe validarse antes de usarlo en una decision.
- No se recomienda tomar decisiones productivas de configuracion, seguridad, integracion o arquitectura sin aprobacion explicita y evidencia del ambiente.

## Siguientes acciones sugeridas

- Definir si el objetivo es formacion, discovery, fit-to-standard, diseno de pruebas, diagnostico o preparacion de consultores.
- Seleccionar el proceso foco: Record-to-Report base, pagos, cuentas por cobrar, cuentas por pagar, cierre/conciliacion, special G/L, workflow o archivo.
- Crear una matriz de escenarios con roles, datos maestros, documentos, controles, variantes Mexico y evidencia esperada.
- Validar contra el tenant del cliente las apps Fiori, roles, workflows, customizing, localizacion fiscal y procesos activados.
