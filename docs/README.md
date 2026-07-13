# SAP Fiori E2E Knowledge Base

Fecha de preparacion: 2026-07-13

## Proposito

Esta pagina es la entrada principal a la base de conocimiento SAP Fiori E2E para implementaciones futuras de SAP S/4HANA. Organiza los catalogos por proceso, matrices de trabajo, controles de acceso, validacion Mexico y plantilla reutilizable.

La base esta disenada para discovery, fit-to-standard, diseno de roles, preparacion de pruebas, validacion fiscal y planeacion de siguientes procesos. No sustituye validacion en SAP Fiori Apps Reference Library, SAP Help Portal, SAP Best Practices, tenant del cliente, licenciamiento, configuracion ni aprobacion productiva.

## Cobertura actual

| Proceso / artefacto | Estado | Archivo |
| --- | --- | --- |
| Record-to-Report / FI | Catalogo inicial completo | [s4hana-fiori-fi-r2r-app-inventory.md](deliverables/s4hana-fiori-fi-r2r-app-inventory.md) |
| Source-to-Pay / Procure-to-Pay | Catalogo inicial completo | [s4hana-fiori-p2p-s2p-app-inventory.md](deliverables/s4hana-fiori-p2p-s2p-app-inventory.md) |
| Lead-to-Cash / Order-to-Cash | Catalogo inicial completo | [s4hana-fiori-o2c-l2c-app-inventory.md](deliverables/s4hana-fiori-o2c-l2c-app-inventory.md) |
| Plan-to-Produce | Catalogo inicial completo | [s4hana-fiori-plan-to-produce-app-inventory.md](deliverables/s4hana-fiori-plan-to-produce-app-inventory.md) |
| Indice maestro E2E | Consolidado searchable | [s4hana-fiori-e2e-master-app-index.md](deliverables/s4hana-fiori-e2e-master-app-index.md) / [CSV](deliverables/s4hana-fiori-e2e-master-app-index.csv) |
| Fit-to-Standard | Matriz de workshop | [s4hana-fiori-fit-to-standard-workshop-matrix.md](deliverables/s4hana-fiori-fit-to-standard-workshop-matrix.md) / [CSV](deliverables/s4hana-fiori-fit-to-standard-workshop-matrix.csv) |
| Roles y business catalogs | Matriz de seguridad y accesos | [s4hana-fiori-role-business-catalog-matrix.md](deliverables/s4hana-fiori-role-business-catalog-matrix.md) / [CSV](deliverables/s4hana-fiori-role-business-catalog-matrix.csv) |
| Mexico compliance | Tracker fiscal y auditoria | [s4hana-mexico-compliance-tracker.md](deliverables/s4hana-mexico-compliance-tracker.md) / [CSV](deliverables/s4hana-mexico-compliance-tracker.csv) |
| Artifact status register | Gobierno, refresh y gaps | [s4hana-fiori-artifact-status-register.md](validation/s4hana-fiori-artifact-status-register.md) / [CSV](validation/s4hana-fiori-artifact-status-register.csv) |
| Plantilla reutilizable | Base para nuevos catalogos | [s4hana-e2e-fiori-catalog-template.md](templates/s4hana-e2e-fiori-catalog-template.md) |

## Como usar la base

| Necesidad | Usar primero | Resultado esperado |
| --- | --- | --- |
| Preparar discovery ejecutivo | Catalogo del proceso + indice maestro | Alcance inicial, apps candidatas, gaps de validacion |
| Preparar fit-to-standard | Fit-to-Standard Workshop Matrix | Agenda, owners, decisiones Fit/Gap y evidencia requerida |
| Preparar seguridad | Role & Business Catalog Matrix | Roles, catalogs, SoD, launchpad validation y fallbacks |
| Preparar rollout Mexico | Mexico Compliance Tracker | CFDI, complemento de pago, Carta Porte, DRC/eDocument y evidencia fiscal |
| Agregar nuevo proceso | Plantilla reutilizable | Catalogo consistente con los artefactos existentes |
| Comparar apps entre procesos | Indice maestro CSV | Busqueda por App ID, rol, catalogo, componente o proceso |
| Confirmar vigencia de artefactos | Artifact Status Register | Owner, refresh requerido, gaps y siguiente accion |

## Flujo recomendado por fase

| Fase SAP Activate | Uso recomendado |
| --- | --- |
| Discover | Usar catalogos por proceso para dimensionar alcance y demos candidatas |
| Prepare | Confirmar owners, governance, sistemas, tenant objetivo y criterios de evidencia |
| Explore | Usar la matriz Fit-to-Standard para decisiones, preguntas abiertas y backlog |
| Realize | Usar matrices de roles, catalogs, pruebas, configuracion y evidencia tenant |
| Deploy | Revisar fallbacks SAP GUI, SoD, Mexico compliance, UAT y readiness |
| Run | Mantener catalogos y trackers como base de mejora continua y auditoria |

## Reglas de evidencia

- SAP Fiori Apps Reference Library es fuente oficial de referencia para apps, nombres, roles, catalogs, componentes y releases, pero no prueba activacion en tenant.
- `PublicCloud2602 = Si` significa que la senal aparecio en la fuente consultada; no confirma scope item, licenciamiento, business role ni app visible.
- `No / validar` no prueba indisponibilidad absoluta; requiere revision FARL, scope item, edition y tenant.
- SAP GUI debe tratarse como fallback controlado y requiere aprobacion de proceso, seguridad, SoD y adopcion.
- Mexico requiere evidencia especifica: CFDI, complementos de pago, Carta Porte cuando aplique, DRC/eDocument, PAC/SAT, XML/PDF, acuses, cancelacion/reemision y trazabilidad contable.

## Refresh FARL

Antes de usar estos artefactos en proposal, discovery formal, fit-to-standard o diseno final:

1. Consultar releases vigentes en SAP Fiori Apps Reference Library.
2. Confirmar anchor de Private Cloud / On-Premise y Public Cloud.
3. Reconsultar apps core por `AppId` en `SingleApp.xsodata`.
4. Actualizar catalogos por proceso.
5. Regenerar indice maestro.
6. Regenerar matrices derivadas: fit-to-standard, roles/catalogs y Mexico compliance.
7. Registrar fecha, fuente, gaps y supuestos.

## Roadmap recomendado

| Prioridad | Proceso / artefacto | Motivo |
| --- | --- | --- |
| 1 | Design-to-Operate | Extiende asset/product lifecycle, mantenimiento, calidad y operaciones |
| 2 | Hire-to-Retire | Completa cobertura cross-process con roles, HR touchpoints y finance integration |
| 3 | Scope item mapping | Conectar apps con SAP Best Practices y scripts de prueba |
| 4 | Workshop packs | Crear vistas listas para sesiones por proceso y seguridad |
| 5 | Periodic FARL refresh | Revalidar release anchors y cambios de apps |

## Validaciones abiertas

- Validar cada app contra tenant real: business roles, catalogs, spaces/pages, autorizaciones, OData/ICF y configuracion.
- Confirmar scope items y restricciones por deployment model.
- Completar owners reales, decisiones Fit/Gap, test scripts y evidencia Cloud ALM o herramienta equivalente.
- Revisar licenciamiento, localizacion, integraciones, extensibilidad y controles antes de cualquier compromiso productivo.

## Siguiente paso sugerido

Crear el catalogo E2E de **Design-to-Operate** usando la plantilla reutilizable y despues refrescar el indice maestro y las matrices derivadas.
