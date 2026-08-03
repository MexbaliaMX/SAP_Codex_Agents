# Smoke Prompts

Use these prompts to sanity-check the first migrated Codex skills. They are local reasoning checks, not live SAP tenant validation.

## sap-btp-integration-suite

Use `$sap-btp-integration-suite` to design an HTTPS-to-SFTP Cloud Integration iFlow package. Include externalized parameters, security material assumptions, and tenant import validation gaps.

## sap-cap-capire

Use `$sap-cap-capire` to create a CAP service design for a sales order approval app with entities, service exposure, authorization assumptions, and deployment checks.

## sap-fiori-tools

Use `$sap-fiori-tools` to plan a Fiori elements app generated from an OData service. Include project setup, annotation strategy, local testing, and deployment considerations.

## sapui5

Use `$sapui5` to review a UI5 controller and XML view for accessibility, data binding, routing, and security issues. Return findings with file-level remediation advice.

## sap-abap-cds

Use `$sap-abap-cds` to model a CDS view for customer open items. Include associations, annotations, authorization, performance considerations, and release-state caveats.

## sap-abap

Use `$sap-abap` to review an ABAP class for clean ABAP, testability, SQL access patterns, and transport-readiness.

## sap-btp-connectivity

Use `$sap-btp-connectivity` to troubleshoot a failed destination through Cloud Connector to an on-premise S/4HANA system. Include checks for principal propagation and network reachability.

## sap-btp-cloud-platform

Use `$sap-btp-cloud-platform` to outline a BTP subaccount setup for an integration project. Include entitlements, role collections, destinations, security, and landscape assumptions.

## sap-sqlscript

Use `$sap-sqlscript` to review a HANA SQLScript procedure for performance, SQL injection exposure, transaction behavior, and calculation pushdown.

## sap-hana-cli

Use `$sap-hana-cli` to draft a safe sequence for inspecting HANA Cloud database metadata with CLI tools. Do not assume credentials are available.

## sap-ai-core

Use `$sap-ai-core` to design an SAP AI Core workflow for model deployment. Include resource groups, executables, configurations, secrets handling, and evidence gaps.

## sap-dependency-security

Use `$sap-dependency-security` to review a Node.js SAP extension dependency tree for vulnerable packages, license risk, and remediation sequencing.

# Phase 2 Overlay Smoke Prompts

## sap-process-record-to-report

Use `$sap-process-record-to-report` to assess a monthly close delay caused by intercompany reconciliation and manual journal approvals. Return confirmed assumptions, process map, controls, risks, and validation steps.

## sap-process-lead-to-cash

Use `$sap-process-lead-to-cash` to frame an opportunity-to-revenue process where CRM opportunities, CPQ quotes, S/4HANA orders, billing, and collections are split across systems.

## sap-process-order-to-cash

Use `$sap-process-order-to-cash` to diagnose billing and CFDI exception handling for a Mexico sales process with delivery, e-invoicing, payment complement, and dispute management impacts.

## sap-process-procure-to-pay

Use `$sap-process-procure-to-pay` to analyze invoice blocks caused by purchase order, goods receipt, tax, and approval mismatches. Include master data and control impacts.

## sap-process-source-to-pay

Use `$sap-process-source-to-pay` to outline a sourcing and supplier-governance improvement program that hands off cleanly into P2P execution.

## sap-process-plan-to-produce

Use `$sap-process-plan-to-produce` to assess MRP instability caused by master data, capacity, quality, and inventory handoff issues in a make-to-stock plant.

## sap-process-design-to-operate

Use `$sap-process-design-to-operate` to map an asset lifecycle scenario from engineering change through maintenance, quality, spare parts, and operations analytics.

## sap-process-hire-to-retire

Use `$sap-process-hire-to-retire` to frame an employee lifecycle integration between SuccessFactors, identity management, time, payroll posting, and S/4HANA cost accounting.

## sap-successfactors-hcm

Use `$sap-successfactors-hcm` to map SuccessFactors H2R scope across Recruiting, Onboarding, Employee Central, Time, Employee Central Payroll, Benefits, Learning, Performance, Compensation, Succession, Workforce Analytics, Work Zone, integrations, RBP, and Mexico payroll evidence. See `docs/validation/successfactors-hcm-smoke-prompts.md` for the full smoke pack.

## sap-activate-discover

Use `$sap-activate-discover` to qualify an S/4HANA transformation opportunity. Include value case, scope hypotheses, risks, stakeholders, assumptions, and next-step recommendation.

## sap-activate-prepare

Use `$sap-activate-prepare` to create a project readiness checklist for governance, workstreams, system access, delivery tooling, RACI, and workshop preparation.

## sap-activate-explore-fit-to-standard

Use `$sap-activate-explore-fit-to-standard` to structure a fit-to-standard workshop for Order-to-Cash in Mexico. Include standard-first guidance, delta log categories, decisions, risks, and evidence requests.

## sap-activate-realize

Use `$sap-activate-realize` to organize a sprint backlog for approved gaps involving configuration, extensions, integrations, data migration, security, and test evidence.

## sap-activate-deploy

Use `$sap-activate-deploy` to prepare a go-live readiness view with cutover, migration, training, support, integration, batch jobs, and go/no-go criteria.

## sap-activate-run

Use `$sap-activate-run` to triage hypercare issues after go-live. Include severity, process area, workaround, root cause, owner, SLA, and continuous-improvement backlog.

# Phase 3 Role Playbook Smoke Prompts

## sap-btp-platform-advisor

Use the `.agents/subagents/sap-btp-platform-advisor.md` role playbook to review a BTP subaccount readiness plan for a CAP, Fiori, Integration Suite, and HANA Cloud workload. Return missing prerequisites and pending tenant checks.

## sap-integration-flow-advisor

Use the `.agents/subagents/sap-integration-flow-advisor.md` role playbook to review an HTTPS-to-SFTP iFlow design before transport. Include security, retry, idempotency, observability, and pending runtime checks.

## sap-cap-project-architect

Use the `.agents/subagents/sap-cap-project-architect.md` role playbook to assess a CAP project architecture with HANA, XSUAA, MTA, and future multitenancy requirements.

## sap-fiori-app-advisor

Use the `.agents/subagents/sap-fiori-app-advisor.md` role playbook to decide whether a business app should use Fiori Elements or freestyle UI5, then outline preview and deployment readiness.

## sap-ui5-code-quality-advisor

Use the `.agents/subagents/sap-ui5-code-quality-advisor.md` role playbook to review a UI5 controller and XML view for security, accessibility, deprecations, and performance issues.

## sap-hana-database-advisor

Use the `.agents/subagents/sap-hana-database-advisor.md` role playbook to draft a safe read-only HANA metadata inspection plan without exposing credentials or business data.

## sap-sqlscript-analyzer

Use the `.agents/subagents/sap-sqlscript-analyzer.md` role playbook to review a SQLScript procedure for performance, error handling, security, and AMDP compatibility.

## sap-api-style-reviewer

Use the `.agents/subagents/sap-api-style-reviewer.md` role playbook to review an OpenAPI or OData contract for naming, lifecycle metadata, documentation, compatibility, and SDK consistency.

## sap-identity-security-advisor

Use the `.agents/subagents/sap-identity-security-advisor.md` role playbook to review an IAS/IPS/BTP trust and role-mapping design with certificate, fallback-admin, and provisioning risks.
