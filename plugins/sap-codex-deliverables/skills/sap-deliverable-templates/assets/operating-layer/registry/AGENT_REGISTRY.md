# SAP Agent Registry

This registry maps the local SAP skills, advisory role playbooks, and deliverable assets into an operating model for Mexbalia SAP work. It is advisory by default: it does not enable tenant access, MCP servers, hooks, lifecycle automation, or production-impacting changes.

Use SAP S/4HANA process language first. Treat SAP product, licensing, roadmap, API, tenant behavior, Mexico fiscal/legal, security, and production readiness claims as evidence-bound.

## Shared Operating Rules

- Separate confirmed facts, assumptions, open validation items, risks, owners, and next actions.
- Start with process and SAP Activate framing before recommending configuration, extension, integration, or custom build.
- Prefer SAP standard capability before custom development.
- Apply Mexico prompts for CFDI, complementos de pago, Carta Porte, tax evidence, approvals, and auditability when relevant.
- Require explicit human approval for production configuration, security changes, integration changes, transports, credential-bearing actions, MCP execution, hook execution, and tenant-connected automation.
- Use role playbooks as advisory guidance only; they are not autonomous tool-enabled agents.

## Core References

| Reference | Use |
|---|---|
| `workspace reference: mexbalia-consulting-guardrails.md (not bundled)` | Evidence discipline, recommendation shape, client-safe outputs |
| `workspace reference: sap-process-language.md (not bundled)` | S/4HANA process taxonomy and handoff pattern |
| `workspace reference: sap-activate-governance.md (not bundled)` | Workstreams, phase gates, hypercare severity starter, governance rules |
| `workspace reference: mexico-compliance-cues.md (not bundled)` | Mexico fiscal and audit validation prompts |
| `assets/operating-layer/output-profiles/INDEX.md` | Audience-specific output style for executive, technical, and audit-sensitive work |
| `assets/operating-layer/automation/automation-candidates.md` | Controlled automation candidates and explicitly blocked execution |

## Agent Families

| Family | Status | Primary purpose |
|---|---|---|
| Engagement Orchestrator | Advisory-ready | Intake objective, select skills/playbooks, enforce evidence and approval gates |
| Process Advisory Agents | Advisory-ready | Frame end-to-end business process, controls, handoffs, gaps, and Mexico overlays |
| SAP Activate Delivery Agents | Advisory-ready | Convert findings into phase-appropriate gates, backlog, RAID, readiness, and hypercare outputs |
| GROW Fast Delivery Overlay | Advisory-ready | Route fixed-scope first-wave GROW Fast work across Activate phases, core processes, cookbooks, signoffs, and expansion backlog |
| Technical Architecture Agents | Advisory-ready | Evaluate BTP, integration, connectivity, identity, data, operations, AI, and security impacts |
| Development Implementation Agents | Advisory-ready | Support SAP development design, code review, quality, and release-aware implementation guidance |
| Deliverable Factory Agents | Draft-ready | Package findings into reusable consulting and readiness deliverables |
| MCP and Hook Automation | Blocked | Disabled pending trust, credential, Windows runtime, tenant/security, and approval review |

## Process Advisory Agents

| Agent | Skill | Typical inputs | Expected outputs | Approval gates |
|---|---|---|---|---|
| Record-to-Report Advisor | `sap-process-record-to-report` | Legal entity, close pain point, posting flow, controls, reports, audit evidence | R2R diagnostic, control map, close readiness, fit/gap list | Financial close commitments, audit/compliance claims, production config |
| Lead-to-Cash Advisor | `sap-process-lead-to-cash` | Lead/opportunity/quote/order scope, CRM/CPQ/S/4HANA handoffs, revenue and collection goals | L2C handoff map, revenue-flow gaps, backlog | Revenue recognition claims, custom contract/pricing decisions |
| Order-to-Cash Advisor | `sap-process-order-to-cash` | Order, delivery, billing, receivables, CFDI/e-invoicing, payment, dispute evidence | O2C process map, billing/e-invoicing risks, controls, remediation backlog | CFDI compliance claims, tax/legal conclusions, production billing changes |
| Source-to-Pay Advisor | `sap-process-source-to-pay` | Category strategy, suppliers, contracts, buying channels, procurement policy | S2P operating model, supplier governance map, transformation backlog | Supplier-risk commitments, contract policy decisions |
| Procure-to-Pay Advisor | `sap-process-procure-to-pay` | Requisition, PO, receipt, service entry, invoice verification, payment, approvals | P2P controls map, invoice exception drivers, approval bottlenecks | Payment controls, tax/withholding claims, production workflow changes |
| Plan-to-Produce Advisor | `sap-process-plan-to-produce` | Demand, MRP, BOM/routing, capacity, shop-floor, quality, inventory, costing | Planning pain-point map, master data readiness, manufacturing integration list | Production planning cutover, costing/valuation claims |
| Design-to-Operate Advisor | `sap-process-design-to-operate` | Product/asset lifecycle, engineering, operations, maintenance, quality, IoT | Lifecycle map, asset/product data gaps, reliability risks, roadmap | Maintenance strategy commitments, regulated quality claims |
| Hire-to-Retire Advisor | `sap-process-hire-to-retire` | Workforce lifecycle, SuccessFactors, payroll boundary, access, time, benefits | H2R lifecycle map, data ownership matrix, payroll/access assumptions | Payroll/legal claims, HR privacy/security decisions |

## SAP Activate Delivery Agents

| Agent | Skill | Typical inputs | Expected outputs | Approval gates |
|---|---|---|---|---|
| Discover Advisor | `sap-activate-discover` | Business drivers, scope hypothesis, value case, constraints, sponsors | Value case, stakeholder map, feasibility risks, next-step recommendation | Commercial commitments, product availability claims |
| Prepare Advisor | `sap-activate-prepare` | Governance, RACI, tools, access, workstreams, landscape, plan | Readiness checklist, governance setup, RAID seed, workshop readiness | Delivery methodology commitments, access/security setup |
| Explore Fit-to-Standard Advisor | `sap-activate-explore-fit-to-standard` | Standard walkthroughs, scope, participants, gaps, decisions, evidence | Delta log, decision log, backlog, validation queue | Gap disposition, custom build approval |
| Realize Advisor | `sap-activate-realize` | Approved design, build backlog, integrations, data cycles, tests, defects | Sprint/build readiness, defect triage, test evidence, transport readiness | Transport moves, production-impacting build decisions |
| Deploy Advisor | `sap-activate-deploy` | Cutover plan, migration status, training, readiness, support, risks | Go-live readiness checklist, go/no-go recommendation, residual risks | Go-live approval, residual-risk acceptance |
| Run Advisor | `sap-activate-run` | Incidents, severity, workarounds, process owner status, AMS handoff | Hypercare triage, stabilization view, exit criteria, CI backlog | SLA commitments, incident closure, AMS acceptance |

## GROW Fast Delivery Overlay

| Agent | Skill or playbook | Typical inputs | Expected outputs | Approval gates |
|---|---|---|---|---|
| GROW Fast First-Wave Advisor | `sap-grow-fast`; `assets/operating-layer/playbooks/grow-fast-first-wave.md` | DDA/CBC/Cloud ALM scope, country/legal entity, project plan, RACI, cookbook, workshop, migration, testing, cutover, and backlog evidence | First-wave scope boundary, routing recommendation, cookbook/readiness view, signoff gates, RAID/backlog entries, expansion-wave candidates | Scope freeze, irreversible finance presets, country fiscal/legal validation, custom extension/integration, migration signoff, go-live approval |

## Technical Architecture Agents

| Agent | Skill or playbook | Typical inputs | Expected outputs | Approval gates |
|---|---|---|---|---|
| BTP Platform Advisor | `sap-btp-cloud-platform`; `workspace role playbook: sap-btp-platform-advisor.md` | Account model, subaccounts, regions, entitlements, roles, workloads, operations | BTP readiness review, workload acceptance checks, platform risks | Tenant setup, entitlement/licensing claims, role changes |
| Connectivity Advisor | `sap-btp-connectivity` | Source/target, protocol, destinations, Cloud Connector, auth model, network constraints | Connectivity option, security model, failure modes, evidence requests | Destination creation, principal propagation, certificate or credential changes |
| Integration Suite Advisor | `sap-btp-integration-suite`; `workspace role playbook: sap-integration-flow-advisor.md` | Interfaces, payloads, adapters, API/event/B2B scope, transport path, monitoring | Integration design review, transport readiness, monitoring/error handling | Production interface changes, API exposure, transport approval |
| Identity Security Advisor | `workspace role playbook: sap-identity-security-advisor.md`; `sap-btp-cloud-platform`; `sap-btp-connectivity` | IAS/IPS/trust, IdP groups, role collections, access evidence, audit needs | Identity security readiness, SoD/access risks, role mapping gaps | Trust changes, role assignment, identity provisioning |
| HANA Database Advisor | `sap-hana-cli`; `workspace role playbook: sap-hana-database-advisor.md` | HANA objects, HDI/container scope, bindings, schema evidence, performance issue | HANA readiness review, inspection plan, database risk list | Tenant connection, credential use, destructive database actions |
| AI Core Advisor | `sap-ai-core` | AI use case, model/provider assumptions, data, grounding, security, operations | AI workload readiness, validation gaps, MLOps/security considerations | Provider/model availability claims, data/security approvals |
| Dependency Security Advisor | `sap-dependency-security` | Package manifests, lockfiles, MCP config, CI, upgrade request | Supply-chain review, staged upgrade plan, MCP pin assessment | Dependency upgrades, package execution, MCP activation |

## Development Implementation Agents

| Agent | Skill or playbook | Typical inputs | Expected outputs | Approval gates |
|---|---|---|---|---|
| ABAP Development Advisor | `sap-abap` | ABAP release, code, RAP/EML scope, unit tests, performance issue | ABAP design/review notes, compatibility guidance, test recommendations | Production code changes, release compatibility claims |
| ABAP CDS Advisor | `sap-abap-cds` | CDS requirement, release, annotations, DCL, consuming app/report | CDS model review, annotation/DCL guidance, query/test plan | Authorization model, exposed service behavior |
| CAP Project Architect | `sap-cap-capire`; `workspace role playbook: sap-cap-project-architect.md` | CAP service scope, CDS, handlers, deployment target, auth, multitenancy | CAP architecture checklist, service/data design review | Deployment, service exposure, auth/security changes |
| Fiori App Advisor | `sap-fiori-tools`; `workspace role playbook: sap-fiori-app-advisor.md` | Fiori Elements/freestyle scope, service, annotations, target runtime | Fiori app design/review, deployment/preview checks | App deployment, destination/security changes |
| UI5 Quality Advisor | `sapui5`; `workspace role playbook: sap-ui5-code-quality-advisor.md` | UI5 code, routing, binding, tests, accessibility, performance issue | UI5 quality review, findings, remediation owners | Production UI changes, accessibility conformance claims |
| SQLScript Analyzer | `sap-sqlscript`; `workspace role playbook: sap-sqlscript-analyzer.md` | Procedure/function/AMDP code, HANA version, performance evidence | SQLScript review, optimization notes, exception-handling gaps | Database deployment, performance commitments |
| API Style Reviewer | `workspace role playbook: sap-api-style-reviewer.md` | API contract, OpenAPI/OData shape, consumers, versioning needs | API consistency review, consumer-impact risks | API publication, compatibility commitments |

## Deliverable Factory Agents

| Deliverable need | Template asset |
|---|---|
| Fit-to-standard workshop deltas | `assets/templates/fit-to-standard-delta-log.md` |
| Process diagnosis | `assets/templates/process-diagnostic-summary.md` |
| Delivery governance | `assets/templates/raid-log.md` |
| Go-live readiness | `assets/templates/go-live-readiness-checklist.md` |
| Hypercare triage | `assets/templates/hypercare-triage-table.md` |
| Cross-technical readiness | `assets/templates/technical-readiness-review.md` |
| Integration transport readiness | `assets/templates/integration-transport-readiness.md` |
| BTP platform readiness | `assets/templates/btp-platform-readiness.md` |
| UI5 quality review | `assets/templates/ui5-quality-review.md` |
| Identity security readiness | `assets/templates/identity-security-readiness.md` |

Client-ready anonymized examples live under `assets/operating-layer/client-ready-samples`. They demonstrate how to combine routing playbooks and output profiles, but they are not tenant evidence, legal/tax approval, security approval, or production readiness approval.

## High-Value Routing Playbooks

| Playbook | Path |
|---|---|
| GROW Fast first wave | `assets/operating-layer/playbooks/grow-fast-first-wave.md` |
| Fit-to-standard workshop | `assets/operating-layer/playbooks/fit-to-standard-workshop.md` |
| Process diagnostic | `assets/operating-layer/playbooks/process-diagnostic.md` |
| Technical readiness review | `assets/operating-layer/playbooks/technical-readiness-review.md` |
| Go-live readiness | `assets/operating-layer/playbooks/go-live-readiness.md` |
| Hypercare triage | `assets/operating-layer/playbooks/hypercare-triage.md` |
| Development/code review | `assets/operating-layer/playbooks/development-code-review.md` |
| Integration transport readiness | `assets/operating-layer/playbooks/integration-transport-readiness.md` |

## Output Profiles

| Profile | Path | Use |
|---|---|---|
| Executive Spanish | `assets/operating-layer/output-profiles/executive-spanish.md` | Client-facing decisions, risks, readiness, and next actions |
| Technical working notes | `assets/operating-layer/output-profiles/technical-working-notes.md` | Internal architecture, implementation, troubleshooting, and code review |
| Evidence-bound audit | `assets/operating-layer/output-profiles/evidence-bound-audit.md` | Readiness, fiscal, security, audit, and approval-sensitive outputs |

## Known Gaps

- No live SAP tenant validation has been performed.
- No legal or tax validation has been performed for Mexico fiscal scenarios.
- GROW Fast guidance is a local advisory abstraction; do not publish proprietary accelerator content or treat it as live SAP documentation.
- API style review has a role playbook but no local `sap-api-style` skill folder in this workspace.
- Identity security has a role playbook but no dedicated local Cloud Identity Services skill folder in this workspace.
- MCP servers and hooks remain disabled by design.
