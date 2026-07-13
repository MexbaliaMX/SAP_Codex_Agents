# Plantilla estandar de catalogo E2E SAP Fiori

Fecha de preparacion: YYYY-MM-DD

## Proposito

Esta plantilla estandariza la construccion de catalogos E2E de SAP Fiori Apps para implementaciones futuras de SAP S/4HANA. Debe usarse como base de conocimiento y como insumo para fit-to-standard, no como prueba de activacion en un tenant.

## Alcance

| Campo | Definicion |
| --- | --- |
| Proceso E2E | Record-to-Report, Source-to-Pay, Procure-to-Pay, Lead-to-Cash, Order-to-Cash, Plan-to-Produce, Design-to-Operate, Hire-to-Retire |
| Subprocesos incluidos | Lista de etapas cubiertas de inicio a cierre |
| Deployment model objetivo | Public Cloud, Private Cloud Edition, On-Premise o mixto |
| Release anchor | Release FARL usado como referencia principal |
| Localizacion | Pais o region que requiere overlay fiscal, legal o auditabilidad |
| Exclusiones | Capacidades fuera del alcance, productos satelite, industrias o extensiones no verificadas |

## Fuentes oficiales

Registrar las fuentes consultadas y la fecha de consulta.

- SAP Fiori Apps Reference Library: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/
- Servicio OData publico de referencia de apps: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/
- Metadata OData: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/$metadata
- Lista de releases: https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata/Releases
- SAP Help Portal o SAP Best Practices cuando se requiera confirmar comportamiento, alcance de scope item o dependencia funcional.

## Release anchor vigente

| Deployment model | Release ID | Nombre FARL | Uso en el catalogo |
| --- | --- | --- | --- |
| SAP S/4HANA Private Cloud / On-Premise | TBD | TBD | Anchor principal |
| SAP S/4HANA On-Premise | TBD | TBD | Referencia on-premise equivalente |
| SAP S/4HANA Public Cloud | TBD | TBD | Senal de disponibilidad Public Cloud cuando FARL la expone |

## Metodo de consulta

Usar el entity set:

```text
InputFilterParam(InpFilterValue='<termino-o-app-id>')/Results
```

Campos minimos recomendados:

- `appId`
- `AppName`
- `ApplicationType`
- `RoleName`
- `releaseId`
- `releaseGroupText`
- `BusinessCatalog`
- `TechnicalCatalog`
- `ApplicationComponent`
- `PrimaryPVOfficialNameCombined`

Regla de disponibilidad Public Cloud:

- Marcar `Si` cuando `PrimaryPVOfficialNameCombined` incluya explicitamente el release Public Cloud objetivo.
- Marcar `No / validar` cuando no aparezca la senal en la fila consultada.
- No interpretar `No / validar` como indisponibilidad absoluta sin revisar la app, scope item y tenant.

## Resumen ejecutivo

Redactar en lenguaje de negocio:

- Resultado principal del mapeo.
- Flujo E2E cubierto.
- Apps estandar prioritarias.
- Fallbacks SAP GUI o apps legacy controladas.
- Gaps de validacion antes de implementacion.

## Mapa E2E

| Etapa E2E | Objetivo de negocio | Apps candidatas | Handoff / dependencia |
| --- | --- | --- | --- |
| TBD | TBD | TBD | TBD |

## Inventario curado

| Proceso | App ID | App oficial | Tipo | Rol FARL | Release anchor | Public Cloud objetivo | Catalogo principal observado | Componente | Uso recomendado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| TBD | TBD | TBD | TBD | TBD | TBD | TBD | TBD | TBD | TBD |

## Matriz fit-to-standard

| Escenario | App estandar recomendada | Decision esperada | Validacion requerida | Riesgo si no se valida |
| --- | --- | --- | --- | --- |
| TBD | TBD | Fit / Gap / Extension / Integracion / Fallback | TBD | TBD |

## Controles y auditabilidad

| Control | Punto del proceso | Evidencia esperada | App / fuente | Owner |
| --- | --- | --- | --- | --- |
| Aprobaciones | TBD | Workflow, log o My Inbox | TBD | TBD |
| Segregacion de funciones | TBD | Rol, business catalog, autorizaciones | TBD | TBD |
| Documento fiscal | TBD | Folio, XML, acuse, cancelacion o reporte legal | TBD | TBD |
| Cierre financiero | TBD | Clearing, aging, conciliacion, contabilizacion | TBD | TBD |

## Overlay Mexico

Aplicar solo cuando el proceso, entidad legal o rollout incluya Mexico.

| Tema | Pregunta de validacion | Evidencia requerida |
| --- | --- | --- |
| CFDI | Que documentos del proceso generan CFDI o requieren timbrado/cancelacion? | Configuracion local, DRC/eDocument, proveedor PAC, pruebas SAT |
| Complementos de pago | El cobro requiere complemento de pago y conciliacion contra AR? | Flujo de pago, clearing, XML, acuse |
| Carta Porte | Hay traslado de mercancia que requiera Carta Porte? | Escenario logistico, transporte, datos de ubicacion y evidencia fiscal |
| Auditoria | Que logs y documentos soportan aprobacion, cambio, emision y cancelacion? | Workflow, cambios de documento, DRC, documentos contables |

## Gaps de validacion

- Confirmar activacion real en tenant y launchpad.
- Confirmar scope items y business roles del cliente.
- Confirmar restricciones por edition, pais, industria o licencia.
- Confirmar configuracion de workflow, output management, integraciones y extensiones.
- Confirmar localizacion fiscal y evidencia legal aplicable.

## Query pattern reusable

```powershell
$base = 'https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/services/SingleApp.xsodata'
$id = '<APP_ID>'
$url = "$base/InputFilterParam(InpFilterValue='$id')/Results?`$format=json&`$select=appId,AppName,ApplicationType,RoleName,releaseId,BusinessCatalog,TechnicalCatalog,ApplicationComponent,PrimaryPVOfficialNameCombined"
Invoke-RestMethod -Uri $url -UseBasicParsing
```

## Siguientes acciones

1. Validar el catalogo con el proceso owner.
2. Marcar apps obligatorias, opcionales y fallback.
3. Conectar cada app con scope item, rol, test script y control.
4. Confirmar disponibilidad en tenant sandbox.
5. Preparar backlog fit/gap y decisiones de arquitectura.
