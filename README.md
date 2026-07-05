# SAP Codex Agents Framework

Advisory SAP agent framework for Codex, focused on SAP S/4HANA process language, SAP Activate delivery governance, technical architecture review, development implementation guidance, and reusable consulting deliverables.

> **Release status:** `v0.1.0-advisory-rc` candidate. Local advisory use and public source review only. Not tenant-connected, not production-ready, not legal/tax/licensing/security approved, and not marketplace-ready.

The framework is designed for evidence-bound SAP advisory work. It helps structure analysis, route work to the right skill or playbook, and produce clear outputs that separate confirmed facts, assumptions, validation gaps, risks, owners, and next actions.

## Current Status

This repository is a release-candidate planning branch for public source review.

Ready for:

- Local advisory use in Codex.
- Internal SAP process, delivery, architecture, and development drafting.
- Evidence-bound templates, playbooks, and anonymized examples.
- Public review of the framework structure and roadmap.

Not ready for:

- Live SAP tenant execution.
- Production configuration or transports.
- Fiscal, legal, licensing, security, or go-live approval.
- Enabled MCP servers, hooks, credential-bearing tools, or tenant-connected automation.
- Customer/NDA-protected test artifacts.

## What Is Included

| Area | Contents |
|---|---|
| Skills | 26 SAP skills under `.agents/skills` |
| Agent registry | `.agents/AGENT_REGISTRY.md` |
| Routing playbooks | 7 playbooks under `.agents/playbooks` |
| Role playbooks | Advisory technical/development roles under `.agents/subagents` |
| Output profiles | Executive Spanish, technical working notes, and evidence-bound audit profiles |
| Templates | 11 reusable SAP deliverable templates under `.agents/templates` |
| Samples | Anonymized and fictional examples under `.agents/samples` and `docs/deliverables` |
| Plugin bundle | `plugins/sap-codex-deliverables` |
| Marketplace file | `marketplace.json` for local plugin review |
| Validation records | `docs/validation` |
| Release roadmap | `docs/roadmap/release-candidate-roadmap.md` |

## Core Operating Rules

- Use SAP S/4HANA process language first: Record-to-Report, Procure-to-Pay, Lead-to-Cash, Order-to-Cash, Source-to-Pay, Plan-to-Produce, Design-to-Operate, and Hire-to-Retire.
- Use legacy module names such as FI, MM, or SD only for ECC, configuration objects, or client terminology.
- Treat SAP product behavior, API availability, licensing, roadmap, tenant behavior, Mexico fiscal/legal topics, security, and production readiness as evidence-bound.
- Keep Mexico-specific prompts such as CFDI, complementos de pago, Carta Porte, tax evidence, approval controls, and auditability as validation topics unless confirmed evidence is supplied.
- Require human approval for production-impacting decisions, security changes, transports, integration changes, credential use, MCP execution, hook execution, or tenant-connected automation.

## Agent Families

### Engagement Orchestrator

Use the registry and shared references to clarify objective, implementation phase, scope, country/legal entity, evidence sources, and required output before selecting specialist skills.

Start with:

- `.agents/AGENT_REGISTRY.md`
- `.agents/references/mexbalia-consulting-guardrails.md`
- `.agents/references/sap-process-language.md`
- `.agents/references/sap-activate-governance.md`
- `.agents/references/mexico-compliance-cues.md`

### Process Advisory Agents

Use these skills to frame end-to-end business processes before jumping to configuration, extensions, integrations, or custom build.

| Process | Skill |
|---|---|
| Record-to-Report | `sap-process-record-to-report` |
| Lead-to-Cash | `sap-process-lead-to-cash` |
| Order-to-Cash | `sap-process-order-to-cash` |
| Source-to-Pay | `sap-process-source-to-pay` |
| Procure-to-Pay | `sap-process-procure-to-pay` |
| Plan-to-Produce | `sap-process-plan-to-produce` |
| Design-to-Operate | `sap-process-design-to-operate` |
| Hire-to-Retire | `sap-process-hire-to-retire` |

### SAP Activate Delivery Agents

Use these skills to convert process and technical findings into phase-appropriate outputs, readiness gates, risks, decisions, backlog items, and next actions.

| Phase | Skill |
|---|---|
| Discover | `sap-activate-discover` |
| Prepare | `sap-activate-prepare` |
| Explore / Fit-to-Standard | `sap-activate-explore-fit-to-standard` |
| Realize | `sap-activate-realize` |
| Deploy | `sap-activate-deploy` |
| Run | `sap-activate-run` |

### Technical Architecture Agents

Use these skills and role playbooks for platform, integration, connectivity, identity, data, AI, operations, and supply-chain security reviews.

| Area | Skill or playbook |
|---|---|
| BTP platform | `sap-btp-cloud-platform`, `.agents/subagents/sap-btp-platform-advisor.md` |
| Connectivity | `sap-btp-connectivity` |
| Integration Suite | `sap-btp-integration-suite`, `.agents/subagents/sap-integration-flow-advisor.md` |
| Identity security | `.agents/subagents/sap-identity-security-advisor.md` |
| HANA | `sap-hana-cli`, `.agents/subagents/sap-hana-database-advisor.md` |
| AI Core | `sap-ai-core` |
| Dependency security | `sap-dependency-security` |

### Development Implementation Agents

Use these skills and role playbooks for SAP implementation guidance, code review, model review, UI quality, database logic, and API contract review.

| Area | Skill or playbook |
|---|---|
| ABAP | `sap-abap` |
| ABAP CDS | `sap-abap-cds` |
| CAP | `sap-cap-capire`, `.agents/subagents/sap-cap-project-architect.md` |
| Fiori tools | `sap-fiori-tools`, `.agents/subagents/sap-fiori-app-advisor.md` |
| SAPUI5/OpenUI5 | `sapui5`, `.agents/subagents/sap-ui5-code-quality-advisor.md` |
| SQLScript | `sap-sqlscript`, `.agents/subagents/sap-sqlscript-analyzer.md` |
| API style | `.agents/subagents/sap-api-style-reviewer.md` |

### Deliverable Factory

Use the template assets to turn findings into consulting-ready working documents.

| Need | Template |
|---|---|
| Fit-to-standard workshop deltas | `.agents/templates/fit-to-standard-delta-log.md` |
| Process diagnosis | `.agents/templates/process-diagnostic-summary.md` |
| RAID governance | `.agents/templates/raid-log.md` |
| Go-live readiness | `.agents/templates/go-live-readiness-checklist.md` |
| Hypercare triage | `.agents/templates/hypercare-triage-table.md` |
| Technical readiness | `.agents/templates/technical-readiness-review.md` |
| Integration transport readiness | `.agents/templates/integration-transport-readiness.md` |
| BTP platform readiness | `.agents/templates/btp-platform-readiness.md` |
| UI5 quality review | `.agents/templates/ui5-quality-review.md` |
| Identity security readiness | `.agents/templates/identity-security-readiness.md` |

## Start Using The Framework

### 1. Clone The Repository

```powershell
git clone https://github.com/MexbaliaMX/SAP_Codex_Agents.git
cd SAP_Codex_Agents
```

### 2. Open The Folder In Codex

Open the cloned folder as a Codex workspace. Codex will read `AGENTS.md` and the `.agents/skills` directory as the local operating context.

### 3. Start With The Registry

Ask Codex to route your request before drafting:

```text
Using the SAP Agent Registry, route this request to the right process, Activate, technical, and deliverable assets. Separate confirmed facts, assumptions, validation gaps, risks, owners, and next actions.
```

Add your business context after that prompt:

```text
Scenario: We need an Order-to-Cash fit-to-standard workshop plan for a Mexico S/4HANA rollout. Include CFDI, complementos de pago, Carta Porte, billing, receivables, approvals, and audit evidence as validation topics. Do not claim tenant behavior without evidence.
```

### 4. Use A Playbook For Common Work

Pick the closest playbook:

- `.agents/playbooks/fit-to-standard-workshop.md`
- `.agents/playbooks/process-diagnostic.md`
- `.agents/playbooks/technical-readiness-review.md`
- `.agents/playbooks/go-live-readiness.md`
- `.agents/playbooks/hypercare-triage.md`
- `.agents/playbooks/development-code-review.md`
- `.agents/playbooks/integration-transport-readiness.md`

Example:

```text
Use `.agents/playbooks/go-live-readiness.md` and the go-live readiness template to draft a Deploy phase readiness view. Mark missing migration, training, integration, security, fiscal/legal, and tenant validation evidence as open items.
```

### 5. Choose An Output Profile

Use one of the output profiles to control tone and evidence discipline:

- Executive Spanish: `.agents/output-profiles/executive-spanish.md`
- Technical working notes: `.agents/output-profiles/technical-working-notes.md`
- Evidence-bound audit: `.agents/output-profiles/evidence-bound-audit.md`

Example:

```text
Use the Executive Spanish output profile. Prepare a concise client-facing readiness summary with confirmed facts, assumptions, validation gaps, risks, owners, and next actions.
```

### 6. Draft From A Template

Ask Codex to use a template and preserve unknowns:

```text
Use `.agents/templates/integration-transport-readiness.md` to draft an Integration Suite transport readiness review. Only fill facts provided below. Leave missing destinations, credentials, monitoring, rollback, and approval evidence as validation gaps.
```

### 7. Validate Local Operating Assets

Run the read-only validators after editing the registry, playbooks, output profiles, samples, automation notes, or plugin operating-layer assets:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\validate-agent-operating-layer.ps1
powershell -ExecutionPolicy Bypass -File scripts\validate-plugin-operating-layer-assets.ps1
```

## Optional Local Plugin Review

The repo includes a local Codex plugin bundle:

- Plugin: `plugins/sap-codex-deliverables`
- Marketplace file: `marketplace.json`
- Skill: `sap-deliverable-templates`

Use the plugin when you want a packaged template and playbook experience for local drafting. The plugin does not enable SAP tenant access, MCP servers, hooks, or production-impacting actions.

## Example Prompts

```text
Use the SAP Agents Framework to create a Record-to-Report close diagnostic. Focus on journal entry flow, reconciliation, approvals, reporting, audit evidence, risks, owners, and next actions. Treat tenant behavior and compliance claims as validation gaps unless evidence is supplied.
```

```text
Route this BTP extension scenario through SAP Activate, process, technical architecture, and development agents. Produce a technical readiness review with platform, connectivity, identity, Integration Suite, CAP, Fiori, monitoring, security, and support considerations.
```

```text
Use the hypercare triage playbook for a Run phase stabilization update. Separate incidents, severity assumptions, workarounds, business impact, owners, target dates, exit criteria, and continuous-improvement backlog.
```

```text
Use the UI5 quality review template for this application code review. Lead with findings, include accessibility, routing, binding, test coverage, performance, security, and release risks.
```

## Safety And Governance

The framework is advisory by default.

Disabled or blocked until explicitly approved:

- SAP tenant-connected MCP execution.
- Codex hooks or lifecycle automation.
- Credential-bearing tools.
- Production configuration changes.
- Transports or deployment actions.
- Fiscal/legal conclusions.
- Security approvals.
- Licensing or roadmap claims.

Before any client-facing or external distribution, review:

- `docs/roadmap/release-candidate-roadmap.md`
- `docs/validation/source-verification-audit.md`
- `docs/validation/package-release-readiness-report.md`
- `docs/validation/open-items.md`

## Repository Hygiene

Do not commit customer/NDA-protected test artifacts, tenant URLs, credentials, private user identifiers, certificate material, or credential aliases.

The public `.gitignore` excludes common private deliverable patterns. Use `.git/info/exclude` for local customer-specific ignore rules that should not appear in public source.

## Known Gaps

- No live SAP tenant validation has been performed.
- No legal, tax, licensing, security, or production-readiness approval is implied.
- MCP servers and hooks remain disabled by design.
- Some source verification metadata is stale or audit-only; preserve caveats until refreshed with evidence.
- Role playbooks are advisory documents, not autonomous tool-enabled agents.

## Release Roadmap

See `docs/roadmap/release-candidate-roadmap.md` for the current release-candidate gates and publication plan.
