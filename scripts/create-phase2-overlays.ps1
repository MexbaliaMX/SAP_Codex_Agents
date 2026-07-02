$ErrorActionPreference = "Stop"

$skillRoot = ".agents\skills"
$sharedRoot = ".agents\references"
New-Item -ItemType Directory -Force -Path $skillRoot, $sharedRoot | Out-Null

$processTemplate = @'
---
name: {name}
description: "{description}"
---

# {title}

## Operating Posture

Use this skill to reason from an end-to-end SAP business process view before jumping to module, configuration, integration, or extension answers. Keep confirmed facts, assumptions, risks, validation gaps, and next actions separate.

Use SAP S/4HANA process language first. Use legacy module names only when the client, configuration object, or source system requires them.

## Core Workflow

1. Confirm the business outcome, legal entity, country, system landscape, and implementation phase.
2. Map the current and target process from trigger to close, including handoffs, documents, approvals, master data, integration points, and controls.
3. Identify pain points as process, data, integration, control, adoption, reporting, or governance issues.
4. Connect recommendations to SAP standard capability first, then evaluate configuration, extensibility, integration, analytics, or custom build.
5. For Mexico scenarios, check whether CFDI, complementos de pago, Carta Porte, tax evidence, audit trail, or approval controls matter.
6. Produce client-safe outputs: process map, fit/gap summary, key decisions, open questions, risks, owners, and validation steps.

## Process Focus

{focus}

## Expected Outputs

- Executive summary in business language.
- Scope boundary and assumptions.
- End-to-end process steps and handoffs.
- Master data, transaction, integration, reporting, and control impacts.
- SAP standard capability candidates and related technical skills.
- Fit-to-standard deltas, decisions needed, and validation plan.

## Related Skills

Use technical skills only after the process framing is clear:

- `$sap-btp-integration-suite` for integration flow, API, event, and B2B design.
- `$sap-btp-connectivity` for destinations, Cloud Connector, principal propagation, and hybrid connectivity.
- `$sap-btp-cloud-platform` for BTP account, entitlement, role, and landscape setup.
- `$sap-abap`, `$sap-abap-cds`, `$sap-cap-capire`, `$sap-fiori-tools`, `$sapui5`, `$sap-sqlscript`, and `$sap-hana-cli` for implementation details.

## Shared References

Read these only when needed:

- `.agents/references/mexbalia-consulting-guardrails.md` for evidence, client-facing language, and decision hygiene.
- `.agents/references/sap-process-language.md` for process taxonomy and handoff patterns.
- `.agents/references/mexico-compliance-cues.md` for Mexico-specific fiscal and audit prompts.
- `.agents/references/sap-activate-governance.md` for phase gates and SAP Activate alignment.
'@

$activateTemplate = @'
---
name: {name}
description: "{description}"
---

# {title}

## Operating Posture

Use this skill to guide SAP Activate delivery work for the named phase. Keep workstream outputs evidence-bound, implementation-safe, and human-approved before any production-impacting change.

Use this phase skill together with the relevant process skill when the work concerns an end-to-end business flow. Use technical skills only after scope, decisions, data, integration, security, and governance are clear.

## Phase Workflow

1. Confirm phase objective, project type, scope, timeline, governance model, and system landscape.
2. Establish entry criteria, required inputs, stakeholders, and decision forums.
3. Identify process, data, integration, security, testing, change, training, migration, and operations impacts.
4. Convert findings into backlog items, decisions, risks, dependencies, owners, and evidence requests.
5. Check whether Cloud ALM, Solution Manager, Jira, Azure DevOps, or another delivery tool is the system of record.
6. Produce a concise phase output with confirmed facts, assumptions, open items, risks, and next actions.

## Phase Focus

{focus}

## Expected Outputs

- Phase-specific checklist and readiness view.
- Workstream impact summary.
- Decision log entries and open questions.
- Risk, issue, dependency, and assumption list.
- Evidence needed before client-facing or production claims.
- Next actions with owners and suggested sequencing.

## Related Skills

- Use process skills for R2R, L2C, O2C, P2P, S2P, Plan-to-Produce, Design-to-Operate, and Hire-to-Retire scope.
- Use `$sap-btp-cloud-platform`, `$sap-btp-integration-suite`, `$sap-btp-connectivity`, `$sap-cap-capire`, `$sap-fiori-tools`, `$sapui5`, `$sap-abap`, `$sap-abap-cds`, `$sap-sqlscript`, and `$sap-hana-cli` for build details.

## Shared References

Read these only when needed:

- `.agents/references/sap-activate-governance.md` for phase gates, workstreams, and artifact expectations.
- `.agents/references/mexbalia-consulting-guardrails.md` for evidence and client-safe recommendations.
- `.agents/references/sap-process-language.md` for process taxonomy.
- `.agents/references/mexico-compliance-cues.md` for Mexico-specific fiscal and audit prompts.
'@

$processSkills = @(
  @{
    name = "sap-process-record-to-report"
    title = "SAP Record-to-Report Process Advisory"
    description = "Record-to-Report process diagnostics and SAP S/4HANA advisory. Use for financial close, journal entry, intercompany, asset accounting, allocations, consolidation, reporting, controls, audit evidence, and Mexico finance compliance questions."
    focus = @"
- Trigger: business event, subledger posting, manual journal, asset transaction, tax event, allocation, period-end activity, or reporting need.
- Core flow: source transaction, validation, posting, reconciliation, close task, financial statement, management report, and audit evidence.
- Watch points: chart of accounts, company code, fiscal calendar, document splitting, parallel ledger, tax code, intercompany, approvals, segregation of duties, and close cockpit governance.
- Integration touchpoints: O2C billing, P2P invoices, fixed assets, payroll, treasury, tax, consolidation, bank statements, and analytics.
- Outputs: close readiness, control map, reconciliation issue list, reporting gap summary, and decision log.
"@
  },
  @{
    name = "sap-process-lead-to-cash"
    title = "SAP Lead-to-Cash Process Advisory"
    description = "Lead-to-Cash process advisory from opportunity through quote, contract, order, fulfillment, billing, revenue, and collections. Use for CRM, CPQ, S/4HANA sales, subscription, service, integration, and revenue-flow questions."
    focus = @"
- Trigger: lead, opportunity, quotation, contract, subscription, sales order, service order, or renewal.
- Core flow: demand capture, qualification, quote, pricing, approval, contract, order creation, fulfillment, billing, revenue recognition, collection, and customer success feedback.
- Watch points: pricing conditions, credit exposure, ATP, contract terms, revenue rules, approval matrix, sales tax, customer master, and handoff from CRM to S/4HANA.
- Integration touchpoints: SAP Sales Cloud, CPQ, Commerce, S/4HANA Sales, EWM, TM, Finance, Integration Suite, and customer portals.
- Outputs: funnel-to-revenue map, handoff issues, integration needs, control points, and fit/gap list.
"@
  },
  @{
    name = "sap-process-order-to-cash"
    title = "SAP Order-to-Cash Process Advisory"
    description = "Order-to-Cash process diagnostics and SAP S/4HANA advisory. Use for sales order, delivery, shipping, billing, accounts receivable, collections, CFDI/e-invoicing, customer claims, and logistics-finance handoff questions."
    focus = @"
- Trigger: approved sales order, customer request, contract release, consignment movement, return, or billing due item.
- Core flow: order capture, availability, credit check, delivery, picking, goods issue, billing, e-invoice, accounts receivable, payment, clearing, dispute, and reporting.
- Watch points: customer master, pricing, tax, credit management, incoterms, delivery block, billing block, output management, revenue recognition, and dispute handling.
- Mexico cues: CFDI issuance, cancellation, complementos de pago, Carta Porte when transport is relevant, tax evidence, and audit traceability.
- Outputs: O2C process map, billing/e-invoicing risk list, integration impact, controls, and remediation backlog.
"@
  },
  @{
    name = "sap-process-procure-to-pay"
    title = "SAP Procure-to-Pay Process Advisory"
    description = "Procure-to-Pay process diagnostics and SAP S/4HANA advisory. Use for requisition, purchase order, goods receipt, service entry, invoice verification, payment, approval, supplier, tax, and spend-control questions."
    focus = @"
- Trigger: purchase requisition, MRP proposal, service need, catalog request, contract call-off, or invoice receipt.
- Core flow: request, source, approve, purchase order, receive goods or services, match invoice, resolve exception, pay supplier, and report spend.
- Watch points: material/service master, vendor master, account assignment, release strategy, three-way match, tax code, withholding, blocked invoices, payment proposal, and segregation of duties.
- Integration touchpoints: Ariba, supplier portal, warehouse, project systems, finance, bank payments, OCR, tax engines, and analytics.
- Outputs: P2P controls map, invoice exception drivers, approval bottlenecks, master data gaps, and standardization plan.
"@
  },
  @{
    name = "sap-process-source-to-pay"
    title = "SAP Source-to-Pay Process Advisory"
    description = "Source-to-Pay process advisory for sourcing strategy, supplier onboarding, contracts, procurement governance, buying channels, P2P handoff, analytics, and SAP Ariba or S/4HANA procurement operating models."
    focus = @"
- Trigger: category strategy, sourcing event, supplier onboarding, contract need, buying channel design, or procurement transformation.
- Core flow: spend analysis, sourcing, supplier qualification, negotiation, contract, catalog/channel setup, requisitioning, purchasing, receiving, invoicing, payment, and supplier performance.
- Watch points: supplier risk, contract leakage, approval policy, buying channel compliance, catalog governance, source list, info records, and procurement analytics.
- Integration touchpoints: SAP Ariba, S/4HANA Sourcing and Procurement, Business Network, finance, tax, risk systems, and master data governance.
- Outputs: S2P operating model, sourcing pipeline, supplier governance map, policy controls, and transformation backlog.
"@
  },
  @{
    name = "sap-process-plan-to-produce"
    title = "SAP Plan-to-Produce Process Advisory"
    description = "Plan-to-Produce process diagnostics and SAP S/4HANA advisory. Use for demand planning, MRP, production planning, manufacturing execution, quality, inventory, costing, and shop-floor integration questions."
    focus = @"
- Trigger: demand plan, sales order, forecast, replenishment signal, production order, process order, or make-to-stock/make-to-order requirement.
- Core flow: demand, supply planning, MRP, capacity check, procurement or staging, production execution, confirmation, quality, goods receipt, costing, variance, and reporting.
- Watch points: BOM, routing, recipe, work center, production version, lot sizing, MRP type, capacity, batch, serial, quality inspection, and inventory valuation.
- Integration touchpoints: O2C demand, P2P materials, EWM, PP/DS, MES, quality, maintenance, costing, and analytics.
- Outputs: planning pain-point map, master data readiness, manufacturing integration list, controls, and phased improvement backlog.
"@
  },
  @{
    name = "sap-process-design-to-operate"
    title = "SAP Design-to-Operate Process Advisory"
    description = "Design-to-Operate process advisory across product or asset lifecycle, engineering, manufacturing, maintenance, quality, operations, and SAP S/4HANA or SAP BTP integration scenarios."
    focus = @"
- Trigger: new product, engineering change, asset onboarding, maintenance strategy, quality issue, manufacturing change, or operations transformation.
- Core flow: design, plan, source, build, inspect, operate, maintain, improve, retire, and feed learnings back into engineering and planning.
- Watch points: product structure, engineering change, asset master, functional location, maintenance plan, quality notification, warranty, spare parts, and operational analytics.
- Integration touchpoints: PLM, EAM, manufacturing, quality, procurement, inventory, service, IoT, Integration Suite, and analytics.
- Outputs: lifecycle map, asset/product data gaps, integration needs, reliability risks, and improvement roadmap.
"@
  },
  @{
    name = "sap-process-hire-to-retire"
    title = "SAP Hire-to-Retire Process Advisory"
    description = "Hire-to-Retire process advisory for workforce lifecycle, SuccessFactors, S/4HANA finance integration, payroll touchpoints, access governance, onboarding, time, benefits, and HR operations questions."
    focus = @"
- Trigger: workforce plan, requisition, hiring event, employee change, time entry, payroll cycle, offboarding, or compliance request.
- Core flow: plan workforce, recruit, hire, onboard, manage job and compensation changes, capture time, run payroll or payroll interface, handle benefits, manage access, and retire/offboard.
- Watch points: employee central master data, position, cost center, legal entity, payroll area, time valuation, role provisioning, privacy, and audit evidence.
- Integration touchpoints: SuccessFactors, identity management, S/4HANA cost accounting, payroll provider, finance posting, learning, travel, and analytics.
- Outputs: H2R lifecycle map, data ownership matrix, integration/control list, payroll boundary assumptions, and remediation backlog.
"@
  }
)

$activateSkills = @(
  @{
    name = "sap-activate-discover"
    title = "SAP Activate Discover Advisory"
    description = "SAP Activate Discover phase advisory. Use for opportunity qualification, business value framing, initial scope, feasibility, stakeholder alignment, solution direction, risk discovery, and executive pre-project recommendations."
    focus = @"
- Clarify business drivers, measurable outcomes, constraints, timeline, budget posture, and executive sponsors.
- Identify candidate scope by end-to-end process, product, geography, company code, plant, channel, and integration landscape.
- Separate confirmed scope from hypotheses and discovery questions.
- Produce a value case, initial risk view, stakeholder map, assumptions, and next-step recommendation.
"@
  },
  @{
    name = "sap-activate-prepare"
    title = "SAP Activate Prepare Advisory"
    description = "SAP Activate Prepare phase advisory. Use for project setup, governance, workstream planning, system access, team onboarding, backlog setup, quality gates, Cloud ALM setup, and delivery readiness."
    focus = @"
- Establish governance, cadence, workstreams, RACI, decision forums, delivery tooling, and reporting.
- Confirm landscape, access, methodology, templates, deliverable ownership, and escalation paths.
- Build the initial backlog, RAID log, integrated plan, quality criteria, and environment readiness checklist.
- Guard against starting fit-to-standard before scope, participants, and evidence sources are ready.
"@
  },
  @{
    name = "sap-activate-explore-fit-to-standard"
    title = "SAP Activate Explore Fit-to-Standard Advisory"
    description = "SAP Activate Explore and Fit-to-Standard advisory. Use for fit-to-standard workshops, process delta logs, design decisions, backlog shaping, scope control, standard-first recommendations, and avoiding premature custom design."
    focus = @"
- Start from SAP standard process and demo script before discussing custom design.
- Capture fit, gap, configuration, extension, integration, data, reporting, security, and change impacts.
- Maintain process delta log, decision log, assumption log, and evidence links.
- Push unresolved questions into backlog or validation actions instead of inventing answers.
"@
  },
  @{
    name = "sap-activate-realize"
    title = "SAP Activate Realize Advisory"
    description = "SAP Activate Realize phase advisory. Use for configuration, build, extensions, integrations, data migration cycles, testing, defect triage, sprint planning, transport readiness, and release governance."
    focus = @"
- Convert approved design into configuration, build, integration, data, security, testing, and change work packages.
- Track sprint scope, defects, dependencies, decisions, transports, test evidence, and readiness criteria.
- Confirm that every extension or integration has a business owner, evidence, fallback, and operations handoff.
- Keep production-impacting changes approval-gated.
"@
  },
  @{
    name = "sap-activate-deploy"
    title = "SAP Activate Deploy Advisory"
    description = "SAP Activate Deploy phase advisory. Use for cutover, migration readiness, go-live criteria, training, business readiness, operational handover, production controls, and launch risk decisions."
    focus = @"
- Build cutover plan, business readiness checklist, technical readiness checklist, data migration status, and go/no-go criteria.
- Confirm training completion, support model, access, integrations, batch jobs, monitoring, fallback, and communication plan.
- Separate mandatory go-live blockers from accepted residual risks.
- Produce executive-ready go-live recommendation with evidence and owners.
"@
  },
  @{
    name = "sap-activate-run"
    title = "SAP Activate Run Advisory"
    description = "SAP Activate Run phase advisory. Use for hypercare, stabilization, incident triage, adoption, continuous improvement, Cloud ALM handoff, operations governance, and post-go-live value tracking."
    focus = @"
- Organize hypercare by severity, process area, root cause, owner, SLA, workaround, and permanent fix.
- Track stabilization, adoption, operational monitoring, business KPIs, and continuous-improvement backlog.
- Confirm handoff from project team to support, AMS, product owners, and process owners.
- Avoid declaring closure until open issues, ownership, and evidence are clean.
- When incident severities are not supplied, use a provisional matrix and state that SLA and escalation rules must be validated against the client contract, PMO governance, and AMS model:
  - P1: business-critical outage or compliance blocker; restore service target often measured in hours.
  - P2: major process impairment with workaround; restore or mitigate within the agreed daily operating window.
  - P3: localized issue or adoption/data defect; resolve through normal hypercare cadence.
  - P4: enhancement or non-critical reporting/adoption item; move to continuous-improvement backlog.
- Include hypercare exit criteria: critical incidents closed or formally accepted, recurring issues root-caused, workarounds approved with expiry, AMS handoff complete, monitoring active, process owners signed off, and residual risks documented.
"@
  }
)

function Write-TextFile {
  param([string]$Path, [string]$Content)
  $dir = Split-Path -Parent $Path
  if ($dir) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
  [System.IO.File]::WriteAllText((Resolve-Path -LiteralPath $dir).Path + [System.IO.Path]::DirectorySeparatorChar + (Split-Path -Leaf $Path), $Content, $utf8NoBom)
}

function Format-Skill {
  param([string]$Template, [hashtable]$Data)
  return $Template.
    Replace("{name}", $Data.name).
    Replace("{description}", $Data.description).
    Replace("{title}", $Data.title).
    Replace("{focus}", $Data.focus.Trim())
}

function Write-OpenAiYaml {
  param([hashtable]$Data)
  $display = ($Data.title -replace "^SAP ", "SAP ")
  $short = if ($Data.name -like "sap-process-*") {
    "Frame SAP process scope, risks, controls, and fit-to-standard decisions."
  } else {
    "Guide SAP Activate phase governance, outputs, risks, and next actions."
  }
  $yaml = @"
interface:
  display_name: "$display"
  short_description: "$short"
"@
  Write-TextFile -Path (Join-Path $skillRoot "$($Data.name)\agents\openai.yaml") -Content $yaml
}

function Write-Verification {
  param([hashtable]$Data)
  $content = @"
# Verification and Port Caveats

This Phase 2 overlay skill was created locally for the Mexbalia Codex SAP skills port. It was not copied from the upstream `sap-skills-main.zip` repository.

Use it as consulting and delivery guidance, not as live SAP tenant evidence. Validate product behavior, configuration options, legal compliance, integration feasibility, licensing, and go-live readiness against the client landscape and current SAP documentation.

Do not make production-impacting recommendations without explicit user approval and environment evidence.
"@
  Write-TextFile -Path (Join-Path $skillRoot "$($Data.name)\references\verification.md") -Content $content
}

foreach ($skill in $processSkills) {
  Write-TextFile -Path (Join-Path $skillRoot "$($skill.name)\SKILL.md") -Content (Format-Skill -Template $processTemplate -Data $skill)
  Write-OpenAiYaml -Data $skill
  Write-Verification -Data $skill
}

foreach ($skill in $activateSkills) {
  Write-TextFile -Path (Join-Path $skillRoot "$($skill.name)\SKILL.md") -Content (Format-Skill -Template $activateTemplate -Data $skill)
  Write-OpenAiYaml -Data $skill
  Write-Verification -Data $skill
}

Write-TextFile -Path (Join-Path $sharedRoot "mexbalia-consulting-guardrails.md") -Content @'
# Mexbalia Consulting Guardrails

Use this reference when a response will influence SAP scope, design, client decisions, commercial commitments, or go-live readiness.

## Evidence Discipline

- Separate confirmed facts, assumptions, open validation items, risks, and next actions.
- Do not invent SAP app names, product capabilities, edition availability, API behavior, limits, licensing, or roadmap commitments.
- Treat stale or audit-only skill metadata as source-guided context, not proof.
- Ask for tenant evidence, screenshots, logs, configuration exports, business process documents, or workshop decisions when a claim depends on the client landscape.

## Recommendation Shape

- Lead with business impact and process language.
- Prefer SAP standard capability before custom build.
- Make decision points explicit: option, benefit, cost, risk, owner, evidence needed, and deadline.
- Flag production-impacting actions for explicit human approval.
- For client-facing Spanish, use executive Spanish without unnecessary Spanglish.

## Common Output Sections

- Confirmed facts
- Assumptions
- Recommended approach
- Risks and controls
- Open questions
- Validation steps
- Owners and next actions
'@

Write-TextFile -Path (Join-Path $sharedRoot "sap-process-language.md") -Content @'
# SAP Process Language

Use S/4HANA process language before legacy module labels.

## Process Families

- Record-to-Report: financial postings, close, reconciliation, reporting, controls, and audit evidence.
- Lead-to-Cash: lead, opportunity, quote, contract, order, fulfillment, billing, revenue, and collections.
- Order-to-Cash: order, delivery, billing, e-invoice, accounts receivable, payment, and disputes.
- Source-to-Pay: sourcing, supplier onboarding, contracting, buying channels, procurement governance, and supplier performance.
- Procure-to-Pay: requisition, purchase order, goods or service receipt, invoice verification, payment, and spend controls.
- Plan-to-Produce: demand, MRP, capacity, production, quality, inventory, costing, and shop-floor integration.
- Design-to-Operate: product or asset lifecycle, engineering changes, operations, maintenance, quality, and continuous improvement.
- Hire-to-Retire: workforce planning, recruiting, onboarding, employee changes, time, payroll touchpoints, access, and offboarding.

## Handoff Pattern

For each process, identify:

- Trigger and desired business outcome.
- Master data and ownership.
- Transaction steps and approvals.
- Integration points and failure modes.
- Reporting, analytics, and audit evidence.
- Controls, segregation of duties, and compliance.
- Fit-to-standard gaps and decisions needed.
'@

Write-TextFile -Path (Join-Path $sharedRoot "mexico-compliance-cues.md") -Content @'
# Mexico Compliance Cues

Use this reference as a prompt checklist, not legal or tax advice. Validate with the client's fiscal, legal, and audit owners.

## Fiscal and Audit Prompts

- Does the process create or consume CFDI documents?
- Are complementos de pago relevant for payment confirmation?
- Is Carta Porte relevant because goods movement or transportation is involved?
- Are withholding, VAT, exchange rate, or foreign trade considerations in scope?
- Is the evidence chain complete from source transaction to accounting entry and audit report?
- Are cancellation, correction, reissue, and dispute processes defined?
- Are SAT-related timestamps, UUIDs, status, and XML/PDF storage responsibilities clear?

## SAP Design Prompts

- Confirm country version, localization scope, e-document solution, output management, tax procedure, and integration architecture.
- Identify where fiscal evidence is generated, validated, stored, monitored, and reconciled.
- Confirm who owns exception handling: business, tax, shared service, IT, AMS, or external provider.
- Do not claim compliance until the target legal entity, solution scope, and client validation evidence are known.
'@

Write-TextFile -Path (Join-Path $sharedRoot "sap-activate-governance.md") -Content @'
# SAP Activate Governance

Use this reference to align process and technical work with SAP Activate delivery phases.

## Workstreams

- Project governance and PMO
- Business process
- Configuration and extensibility
- Integration
- Data migration
- Security and roles
- Testing and defect management
- Change, training, and adoption
- Cutover and operations
- Reporting and analytics

## Phase Gates

Discover:
- Value case, initial scope, stakeholder map, feasibility, and executive alignment.

Prepare:
- Governance, project plan, system access, workstream setup, tools, RACI, and readiness to run workshops.

Explore / Fit-to-Standard:
- Standard process walkthroughs, delta log, decision log, backlog, integration scope, data scope, and security impact.

Realize:
- Configuration, build, integration, data loads, test cycles, defect triage, transport management, and change readiness.

Deploy:
- Cutover, migration readiness, training, business readiness, technical readiness, support model, and go/no-go evidence.

Run:
- Hypercare, incident triage, stabilization, operational handoff, KPI tracking, and continuous improvement.

## Hypercare Severity Starter

Validate these targets against the client contract, PMO governance, and AMS model before treating them as commitments.

| Severity | Typical meaning | Governance expectation |
|---|---|---|
| P1 | Business-critical outage, compliance blocker, or process stop with no viable workaround | Immediate war room, executive visibility, named owner, restore-service target often measured in hours |
| P2 | Major process impairment with workaround or high business impact | Daily leadership review, mitigation owner, target within agreed operating window |
| P3 | Localized defect, adoption issue, data correction, or non-critical integration/reporting issue | Normal hypercare cadence, owner and due date |
| P4 | Enhancement, optimization, or non-critical reporting/adoption request | Continuous-improvement backlog with value and priority |
 
## Hypercare Exit Criteria

- P1 incidents are closed; P2 incidents are closed or formally accepted with workaround, owner, and date.
- Recurring issues have documented root cause and permanent-fix backlog.
- Workarounds are approved, controlled, and have expiry or review dates.
- AMS/support handoff is complete with RACI, SLA, channels, knowledge transfer, and escalation path.
- Monitoring is active for critical integrations, jobs, fiscal flows, interfaces, and business KPIs.
- Process owners sign off stabilization by process area.
- Residual risks are documented and accepted by the right governance forum.

## Governance Rules

- Every gap needs a business owner, disposition, evidence, and decision date.
- Every custom extension needs standard alternative analysis, operations owner, test evidence, and rollback or support plan.
- Every integration needs source, target, protocol, data owner, security model, monitoring, retry/error handling, and support owner.
- Every go-live risk needs owner, mitigation, residual risk statement, and approval path.
'@

Write-Output "Phase 2 overlay skills and shared references written."
