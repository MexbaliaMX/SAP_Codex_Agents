# Indice maestro E2E SAP Fiori Apps

Fecha de preparacion: 2026-07-13

## Proposito

Este indice maestro consolida los catalogos E2E actuales de SAP Fiori Apps para que la base de conocimiento sea searchable y comparable por proceso, subproceso, App ID, rol, catalogo, componente, release anchor, senal Public Cloud y tipo de uso.

## Fuentes consolidadas

- P2P/S2P: `docs/deliverables/s4hana-fiori-p2p-s2p-app-inventory.md`
- O2C/L2C: `docs/deliverables/s4hana-fiori-o2c-l2c-app-inventory.md`
- R2R/FI: `docs/deliverables/s4hana-fiori-fi-r2r-app-inventory.md`

Fuentes oficiales originales: SAP Fiori Apps Reference Library y servicio OData publico `SingleApp.xsodata`. Este indice es una consolidacion derivada de los catalogos locales; no reemplaza la validacion en FARL ni en tenant.

## Resumen ejecutivo

| Metrica | Valor |
| --- | --- |
| Apps / entradas consolidadas | 204 |
| Lead-to-Cash / Order-to-Cash | 111 |
| Record-to-Report | 36 |
| Source-to-Pay / Procure-to-Pay | 57 |
| Entradas SAP GUI / fallback | 30 |
| Entradas con validacion Public Cloud pendiente | 17 |
| Entradas con relevancia Mexico marcada | 56 |

## Uso recomendado

- Buscar por `AppId` cuando se quiera localizar rapidamente una app en todos los procesos.
- Filtrar por `ProcessFamily` y `Subprocess` para preparar workshops fit-to-standard.
- Filtrar por `Catalog` y `Role` para iniciar el diseno de autorizaciones, siempre con validacion en tenant.
- Filtrar `UsageType = Controlled fallback` para revisar dependencias SAP GUI antes de salida a produccion.
- Filtrar `MexicoRelevant = Yes` o `Review` para identificar escenarios con CFDI, complemento de pago, Carta Porte, DRC o evidencia fiscal.

## Archivo tabular

El archivo CSV normalizado para busqueda, filtros y comparacion esta en:

- `docs/deliverables/s4hana-fiori-e2e-master-app-index.csv`

Columnas del CSV:

| Columna | Uso |
| --- | --- |
| ProcessFamily | Proceso E2E consolidado |
| Source | Catalogo origen resumido |
| Subprocess | Subproceso o tema funcional |
| AppId | App ID FARL o transaccion SAP GUI |
| AppName | Nombre oficial observado en el catalogo fuente |
| AppType | Transactional, Analytical, Fact sheet, Web Dynpro o SAP GUI |
| Role | Rol FARL observado o owner sugerido para overlay |
| ReleaseAnchor | Release usado como anchor |
| PublicCloud2602 | Senal Public Cloud 2602 derivada de FARL/catalogo fuente |
| Catalog | Business catalog principal observado |
| Component | Componente SAP observado |
| UsageType | Standard / curated, Controlled fallback o Mexico overlay |
| MexicoRelevant | Marca inicial para revision fiscal Mexico |
| ValidationStatus | Estado de evidencia y validacion pendiente |
| SourceFile | Archivo local de donde proviene la fila |

## Vista rapida por proceso

| Proceso E2E | Entradas | Ejemplos de apps clave |
| --- | --- | --- |
| Lead-to-Cash / Order-to-Cash | 111 | F3893, F0867A, F0797, F1345, F0702A, F5218 |
| Record-to-Report | 36 | F0717A, F0718, F2547A, F0770, F1366A, F4406 |
| Source-to-Pay / Procure-to-Pay | 57 | F1643A, F0842A, F0859, F2027, F0683, F1053A |

## Validacion pendiente transversal

- Confirmar disponibilidad real en tenant, launchpad spaces/pages, business catalogs y roles asignados.
- Confirmar scope items, edition, pais, industria, restricciones de licencia y dependencias de configuracion.
- Refrescar FARL antes de discovery formal, fit-to-standard, proposal o diseno final.
- Para Mexico, validar CFDI, complementos de pago, Carta Porte, eDocument/DRC, PAC, XML, acuses y evidencia auditada por escenario.

## Siguientes acciones

1. Usar el CSV como fuente de filtros para workshops por proceso.
2. Agregar columnas de owner, prioridad, fit/gap, scope item, test script y tenant evidence cuando exista informacion de proyecto.
3. Crear un indice equivalente por roles y business catalogs para preparar seguridad y adopcion.
4. Generar el siguiente catalogo E2E y volver a ejecutar esta consolidacion.
