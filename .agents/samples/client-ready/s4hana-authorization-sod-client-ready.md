# S/4HANA Authorization SoD Review - Client-Ready Sample

This anonymized sample demonstrates the `sap-s4hana-authorization-security` skill, `sap-sod-controls-advisor` playbook, and `sap-sod-control-matrix.md` template. It is not live tenant evidence, legal/tax advice, audit approval, security approval, or production readiness approval.

## Hechos Confirmados

| Hecho | Evidencia | Fuente | Fecha |
|---|---|---|---|
| El rol `Z_MX_R2R_AP_ANALYST` esta asignado al alias `USR_AP01` en QA | Matriz de asignacion sanitizada | Seguridad SAP | 2026-07-25 |
| El usuario puede visualizar proveedor y factura en sociedad `1000` | Evidencia UAT positiva | QA Record-to-Report | 2026-07-25 |
| Existe observacion de cambio de bloqueo de pago | Nota de prueba funcional | QA Record-to-Report | 2026-07-25 |
| La sociedad `2000` debe quedar denegada para este rol | Nota del owner del rol | Owner Record-to-Report | 2026-07-25 |

## Supuestos

- La persona `MX-R2R-AP-ANALYST` es de consulta y analisis, no de mantenimiento operativo de pagos.
- El cambio de bloqueo de pago requiere aprobacion separada de seguridad, proceso y control interno.
- La evidencia recibida es suficiente para levantar un riesgo, pero no para concluir causa raiz tecnica.

## Matriz SoD

| Proceso | Rol/persona | Alias | Tarea sensible | Tarea en conflicto | Evidencia | Riesgo | Estado de control | Owner | Gate |
|---|---|---|---|---|---|---|---|---|---|
| Record-to-Report | `MX-R2R-AP-ANALYST` | `USR_AP01` | Cambiar bloqueo de pago | Visualizar proveedor/factura y analizar pagos | Nota UAT, matriz de asignacion | Alto | Control pendiente | Owner R2R | Seguridad + control interno |
| Record-to-Report | `MX-R2R-AP-ANALYST` | `USR_AP_NEG` | Acceso a sociedad no autorizada | Consulta sociedad `2000` | SU53 negativo para sociedad `2000` | Medio | Parcialmente probado | Seguridad SAP | Retest negativo ampliado |

## Riesgos

- Exceso de privilegio si una persona de analisis puede modificar condiciones que afectan retencion o liberacion de pagos.
- Posible conflicto SoD entre consulta de factura/proveedor y cambios operativos de pago.
- Riesgo de auditoria si no existe evidencia de aprobacion, monitoreo y expiracion de excepciones.
- Para Mexico, validar impacto en CFDI, complemento de pago, evidencia fiscal, aprobaciones y conciliacion.

## Recomendaciones

- Mantener el transporte en espera hasta confirmar el objeto/valor que permite cambiar bloqueo de pago.
- Solicitar export sanitizado de objetos de autorizacion, valores organizacionales y menu/catalagos asociados.
- Ejecutar prueba negativa especifica para cambio de bloqueo de pago en sociedad `1000`.
- Definir control compensatorio solo si el negocio aprueba una excepcion temporal, con owner, monitoreo y fecha de expiracion.
- Requerir signoff de seguridad SAP, owner Record-to-Report y control interno antes de liberar cambios.

## Proximas Acciones

| Prioridad | Accion | Owner | Validacion |
|---|---|---|---|
| Alta | Extraer resumen de autorizaciones del rol | Seguridad SAP | Export sanitizado |
| Alta | Confirmar si bloqueo de pago esta fuera de alcance | Owner R2R | Decision documentada |
| Alta | Ejecutar retest positivo/negativo | QA + Seguridad SAP | Evidencia UAT |
| Media | Evaluar control compensatorio si aplica | Control interno | Control aprobado o rechazado |
