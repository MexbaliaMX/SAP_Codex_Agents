# Matriz Fit-to-Standard SAP Fiori Apps

Fecha de preparacion: 2026-07-13

## Proposito

Esta matriz convierte el indice maestro E2E de SAP Fiori Apps en un tracker de workshop para SAP Activate Explore / Fit-to-Standard. Su objetivo es capturar decisiones, evidencia, owners, scope items, scripts de prueba y preguntas abiertas sin asumir activacion real en tenant.

## Fuente

- Indice maestro: `docs/deliverables/s4hana-fiori-e2e-master-app-index.csv`
- Matriz generada: `docs/deliverables/s4hana-fiori-fit-to-standard-workshop-matrix.csv`

La matriz hereda las caveats de los catalogos FARL: es evidencia de referencia, no prueba de licenciamiento, activacion, rol asignado, alcance de scope item ni comportamiento productivo.

## Resumen ejecutivo

| Metrica | Valor |
| --- | --- |
| Filas de workshop | 204 |
| Prioridad High | 159 |
| Prioridad Medium | 45 |
| Riesgo: Edition/scope validation | 5 |
| Riesgo: Fallback dependency | 12 |
| Riesgo: Mexico fiscal/audit review | 44 |
| Riesgo: Standard validation | 143 |

## Columnas clave

| Columna | Uso en workshop |
| --- | --- |
| Workshop | Agrupacion sugerida para agenda Fit-to-Standard |
| Workstream | Proceso E2E de referencia |
| BusinessOwner | Owner sugerido para decision y evidencia |
| Priority | Prioridad inicial para preparar workshop |
| FitGapDecision | Decision a capturar: Fit, Gap, Configuration, Extension, Integration, Fallback o Not in scope |
| DecisionStatus | Estado: Open, Proposed, Approved, Deferred o Rejected |
| ScopeItem | Scope item validado contra SAP Best Practices o tenant |
| TestScript | Evidencia de prueba, demo script o caso Cloud ALM |
| TenantEvidence | Prueba de app visible, role/catalog, space/page, configuracion y evidencia de ejecucion |
| OpenQuestions | Pregunta minima para cerrar la decision |
| KeyValidation | Checklist de evidencia esperada |
| RiskFlag | Riesgo inicial para priorizacion |

## Agenda sugerida por workshop

| Workshop | Filas |
| --- | --- |
| Fallback and transition controls | 12 |
| L2C/O2C commercial document flow | 22 |
| Mexico compliance and fiscal evidence | 6 |
| O2C analytics and controls | 6 |
| O2C billing, returns and credit memo | 14 |
| O2C credit management | 9 |
| O2C delivery, picking and logistics handoff | 6 |
| O2C receivables, payments, disputes and collections | 34 |
| O2C revenue accounting handoff | 2 |
| P2P controls and analytics | 4 |
| P2P invoice verification and finance handoff | 6 |
| P2P master data and supplier performance | 4 |
| P2P receiving, inventory and logistics handoff | 8 |
| P2P requisition, purchase order and approvals | 19 |
| R2R accounts payable and payment operations | 1 |
| R2R accounts receivable and correspondence | 4 |
| R2R banking, payments and cash operations | 8 |
| R2R general ledger, close and controls | 21 |
| R2R master data and reporting | 2 |
| S2P sourcing, contracts and source determination | 16 |

## Reglas de uso

- Empezar cada fila como `TBD - standard first`; no marcar gap hasta demostrar que SAP standard no cubre el escenario validado.
- No aprobar uso de SAP GUI fallback sin owner, razon, control SoD, impacto de adopcion y evidencia de que Fiori no cubre el caso.
- No cerrar filas Mexico sin evidencia CFDI/DRC, complemento de pago, Carta Porte cuando aplique, XML/acuses y trazabilidad contable/fiscal.
- No usar `PublicCloud2602 = Si` como prueba de activacion; confirmar scope, business role, catalog, space/page y tenant.
- Conectar cada decision aprobada con backlog, configuracion, pruebas, seguridad, datos maestros y change impact.

## Siguientes acciones

1. Asignar owners reales por workstream antes del primer workshop.
2. Completar scope items y scripts de prueba por fila prioritaria.
3. Capturar evidencia tenant para apps core y fallbacks SAP GUI.
4. Separar filas Mexico en un compliance tracker dedicado cuando inicie el rollout local.
5. Actualizar `FitGapDecision` y `DecisionStatus` despues de cada sesion.
