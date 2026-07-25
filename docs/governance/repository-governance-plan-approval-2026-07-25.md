# Aprobacion condicionada del plan de gobierno de repositorio

Fecha: 2026-07-25

## Resultado ejecutivo

El plan "SAP Repository Governance Release Plan" queda aprobado para ejecucion condicionada hacia v0.2.0, con los ajustes obligatorios descritos en este documento.

La aprobacion aplica solamente a trabajo de gobierno de repositorio, documentacion, validacion local, preparacion de pull requests y recomendaciones administrativas. No autoriza uso productivo, conexion a tenants SAP, habilitacion de MCP servers, habilitacion de Codex hooks, credenciales, cambios de roles, transportes, configuracion productiva, publicacion marketplace, distribucion a clientes ni empaquetado propietario.

## Hechos confirmados antes de la aprobacion

- La rama remota por defecto observada es `origin/codex/sap-agents-framework-rc-roadmap`.
- La rama remota `origin/chore/release-hygiene-advisory-rc` contiene commits posteriores al default remoto.
- La etiqueta `sap-codex-deliverables-v0.2.0-rc1` existe y apunta al release candidate aceptado para uso interno advisory.
- La rama `origin/codex/gpl-provenance-review` esta contenida en historia posterior frente al default remoto.
- El working tree local revisado estaba limpio al momento de registrar esta decision.
- No se ejecutaron mutaciones remotas ni cambios de configuracion de GitHub para emitir esta aprobacion.

## Ajustes obligatorios al plan antes de ejecutar cambios

1. Corregir los bloques de comandos del PDF o de su version fuente para que sean copiables y PowerShell-compatible. Los comandos extraidos del PDF aparecen sin espacios, por ejemplo `gitstatus`, `gitremote-v` y `gitfetch--all--prune--tags`.
2. Incluir tratamiento explicito de la rama local `master` dentro del modelo objetivo: retener, archivar, convertir en `main`, o retirar despues de aprobacion.
3. Separar la ejecucion en pull requests pequenos y revisables. Evitar repetir un PR amplio como el antecedente citado de PR #9.
4. Agregar inventario GitHub vivo antes de cualquier mutacion remota: repositorio, pull requests, issues, releases, branch protection, rulesets, labels y milestones.
5. Tratar labels, milestones, comentarios en issues, cierre/reapertura de issues, cambio de default branch, branch protection y branch retirement como acciones remotas que requieren aprobacion explicita.
6. Definir una politica de artefactos temporales: archivos bajo `tmp/` no deben versionarse salvo que se muevan a `docs/validation/` como evidencia intencional, con explicacion.
7. Agregar validacion dedicada de secretos con allowlist para ejemplos inactivos. No basta con `git grep` general.
8. Mantener conclusiones legales, licenciamiento, redistribucion SAP, marcas y marketplace como asuntos sujetos a owner o revisor legal calificado.

## Alcance aprobado

- Evaluacion read-only del repositorio local y remoto.
- Generacion de evidencia en `docs/reviews/`.
- Preparacion de documentos de gobierno en `docs/governance/`.
- Creacion o mejora de plantillas `.github/` en una rama dedicada.
- Mejoras de CI justificadas por evidencia del repositorio.
- Validacion local de scripts existentes.
- Preparacion de propuesta de pull request sin merge automatico.

## Acciones no aprobadas por esta decision

- `git push --force` o `git push --force-with-lease`.
- Reescritura de historia publica.
- Eliminacion de ramas.
- Modificacion de tags o release assets existentes.
- Cambio de default branch sin aprobacion owner.
- Aplicacion de branch protection sin aprobacion owner.
- Creacion o cambio de labels, milestones o issues sin aprobacion owner.
- Activacion de MCP servers o Codex hooks.
- Uso de credenciales, tenants SAP o datos de cliente.
- Validacion productiva o non-production tenant validation sin plan aprobado por owner del ambiente.
- Distribucion a clientes, marketplace publication o uso productivo.

## Criterio de avance

La ejecucion debe iniciar por la evaluacion read-only y producir `docs/reviews/repository-governance-assessment-2026-07-25.md`. Despues de ese entregable, cualquier accion remota o destructiva debe presentarse como lista concreta de aprobacion owner antes de ejecutarse.

## Estado de readiness autorizado

- Internal advisory use: CONDITIONALLY READY
- Final v0.2.0 release: NOT READY
- Client distribution: NOT READY
- Marketplace publication: NOT READY
- Tenant-connected execution: NOT READY
- Production use: NOT READY

## Confirmacion de seguridad

Esta aprobacion no habilita conectividad SAP, no incorpora credenciales, no modifica tenants, no cambia roles, no ejecuta transportes, no habilita MCP servers, no habilita Codex hooks y no autoriza acciones productivas.
