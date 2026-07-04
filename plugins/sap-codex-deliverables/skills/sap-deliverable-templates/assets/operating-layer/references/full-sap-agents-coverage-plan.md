# Full SAP Agents Coverage Plan

## Purpose

Define a full SAP agent model for Mexbalia that covers business process advisory, SAP Activate delivery governance, technical architecture, development implementation, quality review, and reusable client deliverables using the local skills and role playbooks in this workspace.

This plan is an operating design, not live SAP tenant proof. Product behavior, licensing, edition availability, APIs, roadmap items, localization behavior, and production readiness must be validated against current SAP documentation, the target tenant, client evidence, and the responsible approval forum.

## Confirmed Local Assets

- 26 local skills exist under `workspace skills (not bundled in this plugin)`.
- Process skills cover Record-to-Report, Lead-to-Cash, Order-to-Cash, Source-to-Pay, Procure-to-Pay, Plan-to-Produce, Design-to-Operate, and Hire-to-Retire.
- SAP Activate skills cover Discover, Prepare, Explore / Fit-to-Standard, Realize, Deploy, and Run.
- Technical and development skills cover BTP, Connectivity, Integration Suite, CAP, Fiori tools, SAPUI5, ABAP, ABAP CDS, SQLScript, HANA CLI, AI Core, and dependency security.
- Advisory role playbooks exist under `workspace role playbooks (not bundled in this plugin)` for BTP, Integration Suite, CAP, Fiori, UI5 quality, HANA, SQLScript, API style, and identity security.
- Deliverable templates and fictional samples exist through the repo-local `sap-codex-deliverables` plugin bundle.
- MCP servers and hooks are not active by default and require trust, credential, Windows runtime, and tenant/security review before use.

## Target Agent Families

### 1. Engagement Orchestrator

Primary role:

- Intake client objective, implementation phase, scope boundary, geography, legal entities, system landscape, delivery tooling, governance model, and required output.
- Select the right process, Activate, technical, and development agents.
- Enforce evidence discipline and human approval gates.

Local assets:

- `workspace reference: mexbalia-consulting-guardrails.md (not bundled)`
- `workspace reference: sap-process-language.md (not bundled)`
- `workspace reference: sap-activate-governance.md (not bundled)`
- `workspace reference: mexico-compliance-cues.md (not bundled)`

Expected outputs:

- Confirmed facts, assumptions, risks, open validation items, and next actions.
- Workstream routing decision.
- Evidence request list.
- Recommended agent sequence.

### 2. Process Advisory Agents

Primary role:

- Diagnose and design end-to-end business flows before jumping to modules, configuration, or custom build.
- Identify triggers, outcomes, master data, approvals, controls, integration points, reporting needs, audit evidence, and fit-to-standard gaps.
- Apply Mexico overlays for CFDI, complementos de pago, Carta Porte, tax evidence, approvals, and auditability when relevant.

Agent coverage:

| Agent | Local skill | Scope |
|---|---|---|
| Record-to-Report Advisor | `sap-process-record-to-report` | Financial postings, close, reconciliation, reporting, controls, audit evidence |
| Lead-to-Cash Advisor | `sap-process-lead-to-cash` | Lead, quote, contract, order, fulfillment, billing, revenue, collections |
| Order-to-Cash Advisor | `sap-process-order-to-cash` | Order, delivery, billing, e-invoice, receivables, payments, disputes |
| Source-to-Pay Advisor | `sap-process-source-to-pay` | Sourcing, supplier onboarding, contracts, buying channels, procurement governance |
| Procure-to-Pay Advisor | `sap-process-procure-to-pay` | Requisition, purchase order, receipt, invoice verification, payment, spend controls |
| Plan-to-Produce Advisor | `sap-process-plan-to-produce` | Demand, MRP, production, quality, inventory, costing, shop-floor integration |
| Design-to-Operate Advisor | `sap-process-design-to-operate` | Product and asset lifecycle, engineering, operations, maintenance, quality |
| Hire-to-Retire Advisor | `sap-process-hire-to-retire` | Workforce lifecycle, SuccessFactors touchpoints, payroll boundary, access, offboarding |

Expected outputs:

- Process diagnostic summary.
- Fit-to-standard delta log.
- Process handoff map.
- Control and evidence map.
- Backlog candidates with owners and validation actions.

### 3. SAP Activate Delivery Agents

Primary role:

- Convert process and technical findings into phase-appropriate delivery artifacts, gates, decisions, risks, dependencies, owners, and evidence requests.
- Keep production-impacting work approval-gated.

Agent coverage:

| Agent | Local skill | Phase gate |
|---|---|---|
| Discover Advisor | `sap-activate-discover` | Value case, initial scope, stakeholder map, feasibility, executive alignment |
| Prepare Advisor | `sap-activate-prepare` | Governance, project plan, access, workstreams, tools, RACI, readiness |
| Explore Fit-to-Standard Advisor | `sap-activate-explore-fit-to-standard` | Standard walkthroughs, delta log, decision log, backlog, integration/data/security impact |
| Realize Advisor | `sap-activate-realize` | Configuration, build, integration, data loads, test cycles, defects, transport governance |
| Deploy Advisor | `sap-activate-deploy` | Cutover, migration readiness, training, support model, go/no-go evidence |
| Run Advisor | `sap-activate-run` | Hypercare, stabilization, incident triage, operational handoff, KPI tracking |

Expected outputs:

- Phase checklist and readiness view.
- RAID log.
- Decision log.
- Go-live readiness checklist.
- Hypercare triage table.
- Continuous improvement backlog.

### 4. Technical Architecture Agents

Primary role:

- Evaluate platform, integration, connectivity, security, operations, and AI architecture options after business scope and governance are clear.
- Prefer SAP standard capability and approved platform patterns before custom design.

Agent coverage:

| Agent | Local skill or playbook | Scope |
|---|---|---|
| BTP Platform Advisor | `sap-btp-cloud-platform`, `workspace role playbook: sap-btp-platform-advisor.md` | Account model, subaccounts, entitlements, CF/Kyma/ABAP environment, roles, operations |
| Connectivity Advisor | `sap-btp-connectivity` | Destinations, Cloud Connector, principal propagation, hybrid connectivity, proxy patterns |
| Integration Suite Advisor | `sap-btp-integration-suite`, `workspace role playbook: sap-integration-flow-advisor.md` | iFlows, API Management, Event Mesh, B2B/EDI, transport readiness, monitoring |
| Identity Security Advisor | `workspace role playbook: sap-identity-security-advisor.md`, `sap-btp-cloud-platform`, `sap-btp-connectivity` | IAS/IPS trust, role collections, authorization mapping, auditability |
| HANA Database Advisor | `sap-hana-cli`, `workspace role playbook: sap-hana-database-advisor.md` | HANA inspection, HDI, service bindings, database readiness |
| AI Core Advisor | `sap-ai-core` | AI Core, Generative AI Hub, orchestration, grounding/RAG, MLOps readiness |
| Dependency Security Advisor | `sap-dependency-security` | Package manager hardening, MCP pin policy, upgrade staging, supply-chain review |

Expected outputs:

- Technical readiness review.
- BTP platform readiness review.
- Integration transport readiness review.
- Identity security readiness review.
- Architecture options with evidence, risks, owners, and approval path.

### 5. Development Implementation Agents

Primary role:

- Support build, review, and modernization work using the correct SAP development model and release constraints.
- Keep code and configuration advice aligned to the target runtime and release.

Agent coverage:

| Agent | Local skill or playbook | Scope |
|---|---|---|
| ABAP Development Advisor | `sap-abap` | Modern ABAP, ABAP Cloud, RAP/EML, unit tests, performance, release compatibility |
| ABAP CDS Advisor | `sap-abap-cds` | CDS views/entities, annotations, associations, DCL, Fiori-backed data models |
| CAP Project Architect | `sap-cap-capire`, `workspace role playbook: sap-cap-project-architect.md` | CAP services, CDS, handlers, deployment, multitenancy, Fiori integration |
| Fiori App Advisor | `sap-fiori-tools`, `workspace role playbook: sap-fiori-app-advisor.md` | Fiori Elements, app generation, annotations, preview, deployment |
| UI5 Quality Advisor | `sapui5`, `workspace role playbook: sap-ui5-code-quality-advisor.md` | SAPUI5/OpenUI5 architecture, routing, binding, accessibility, tests, performance |
| SQLScript Analyzer | `sap-sqlscript`, `workspace role playbook: sap-sqlscript-analyzer.md` | Procedures, table functions, AMDP, exception handling, HANA performance |
| API Style Reviewer | `workspace role playbook: sap-api-style-reviewer.md` | API consistency and consumer-facing contract review when APIs are in scope |

Expected outputs:

- Build approach and implementation checklist.
- Code review findings.
- UI5 quality review.
- CDS/data model review.
- SQLScript optimization notes.
- Deployment and test evidence checklist.

### 6. Deliverable Factory Agents

Primary role:

- Turn advisory findings into consistent consulting, delivery, and technical artifacts.
- Preserve placeholders and pending validation items when client evidence is missing.

Local assets:

- `plugins/sap-codex-deliverables/skills/sap-deliverable-templates`
- `assets/templates`
- `assets/samples`

Core deliverables:

- Fit-to-standard delta log.
- Process diagnostic summary.
- RAID log.
- Go-live readiness checklist.
- Hypercare triage table.
- Technical readiness review.
- Integration transport readiness.
- BTP platform readiness.
- UI5 quality review.
- Identity security readiness.

## Recommended Agent Routing Pattern

1. Orchestrator confirms objective, phase, landscape, country/legal entity, process scope, evidence sources, and required output.
2. SAP Activate agent sets phase gate, artifact shape, entry criteria, and governance expectations.
3. Process agent frames business outcome, handoffs, controls, integration points, reporting, and Mexico fiscal/audit overlays.
4. Technical architecture agent evaluates platform, integration, connectivity, security, data, operations, and AI impacts.
5. Development agent supports build or review only after scope, standard alternative, ownership, and approval path are clear.
6. Deliverable Factory agent packages the output using the right template and preserves confirmed facts, assumptions, validation gaps, risks, owners, and next actions.

## Coverage Matrix

| Coverage area | Current local coverage | Recommended agent status |
|---|---|---|
| SAP Activate Discover through Run | Complete local phase skills | Ready for advisory use |
| Core S/4HANA process language | Complete local process skills | Ready for advisory use |
| Mexico fiscal/audit prompts | Shared reference plus process overlays | Ready as validation checklist, not legal/tax proof |
| BTP platform and connectivity | Local skills plus BTP role playbook | Ready for advisory use; tenant changes approval-gated |
| Integration Suite | Local skill plus role playbook | Ready for advisory use; live tenant/API behavior pending evidence |
| CAP, Fiori, UI5 | Local skills plus role playbooks | Ready for development advisory and code review |
| ABAP, CDS, SQLScript, HANA | Local skills plus HANA/SQLScript role playbooks | Ready for development advisory; release-specific validation required |
| AI Core | Local skill | Ready for advisory use; model/provider/tenant claims evidence-bound |
| Dependency and MCP security | Local skill | Ready for policy and review use |
| Reusable client deliverables | Plugin skill, templates, samples | Ready for internal drafting |
| Active MCP execution | Disabled examples only | Blocked pending explicit approval and trust review |
| Active hooks/lifecycle automation | Not enabled | Blocked pending Codex hook runtime confirmation and approval |

## Implementation Roadmap

### Phase A: Agent Registry

- Create an index that maps each agent name to its local skill, optional subagent playbook, expected inputs, outputs, and approval gates.
- Add owner/status metadata for advisory-only, draft-ready, and automation-blocked roles.
- Keep MCP and hook status explicit.

Suggested artifact:

- `assets/operating-layer/registry/AGENT_REGISTRY.md`

### Phase B: Orchestration Playbooks

- Add reusable playbooks for common routing paths:
  - Fit-to-standard workshop.
  - Process diagnostic.
  - Technical readiness review.
  - Go-live readiness.
  - Hypercare triage.
  - Development/code review.
  - Integration transport readiness.
- Each playbook should identify required skills, deliverable template, evidence inputs, approval gates, and output sections.

Suggested artifact:

- `assets/operating-layer/playbooks/`

### Phase C: Forward Tests

- Run representative dry runs across the full matrix:
  - O2C Mexico fit-to-standard with CFDI and Carta Porte prompts.
  - R2R monthly close and audit evidence.
  - P2P invoice exception and approval controls.
  - Plan-to-Produce shop-floor integration.
  - BTP extension with CAP, Fiori, Connectivity, and Integration Suite.
  - Deploy go/no-go and Run hypercare.
- Capture gaps in validation reports.

Suggested artifact:

- `assets/operating-layer/references/full-agent-forward-test-report.md`

### Phase D: Client-Facing Output Profiles

- Define language and formatting profiles:
  - Executive Spanish for client-facing outputs.
  - Technical English or Spanish for internal build notes.
  - Evidence-bound audit style for readiness and compliance-sensitive outputs.
- Ensure every profile separates confirmed facts, assumptions, validation gaps, risks, and next actions.

Suggested artifact:

- `assets/operating-layer/output-profiles/`

### Phase E: Controlled Automation Candidates

- Keep automation disabled until trust and runtime behavior are confirmed.
- Prioritize read-only automation first:
  - Skill/frontmatter validation.
  - Broken reference checks.
  - Template placeholder checks.
  - MCP pin policy checks.
- Require explicit approval for tenant-connected MCPs, credential-bearing tools, hook execution, production configuration, or transport-impacting activity.

Suggested artifacts:

- `.codex/config.toml.example` remains disabled.
- Future `.codex/hooks.example.json` remains disabled until runtime behavior is confirmed.

## Gaps and Open Validation Items

- No live SAP tenant validation has been performed.
- No legal or tax validation has been performed for Mexico fiscal scenarios.
- SAP product availability, edition behavior, licensing, limits, APIs, and roadmap claims must be checked against current SAP sources and client tenant evidence.
- MCPs are not active and should remain disabled until trust, credential, and package-source review is complete.
- Hooks are not active and should remain disabled until Codex hook runtime schema, Windows wrapper behavior, and failure semantics are confirmed.
- Existing role playbooks are advisory documents, not autonomous tool-enabled agents.
- API style review has a role playbook but no local `sap-api-style` skill folder in this workspace.
- Identity security has a role playbook but no dedicated local Cloud Identity Services skill folder in this workspace.

## Recommended Next Build Step

Create `assets/operating-layer/registry/AGENT_REGISTRY.md` from this plan, then add `assets/operating-layer/playbooks/` for the seven high-value routing paths. That will turn the current skill inventory into a practical operating layer without enabling risky automation.
