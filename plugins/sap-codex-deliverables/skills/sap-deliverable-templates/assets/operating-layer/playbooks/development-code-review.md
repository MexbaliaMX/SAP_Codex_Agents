# Development and Code Review Playbook

Use this playbook when the user needs SAP development implementation guidance, code review, modernization advice, quality review, or deployment-readiness checks.

## Routing

1. Start with process and SAP Activate context when the code change affects business behavior or delivery commitments.
2. Select development skill by artifact:
   - ABAP: `sap-abap`
   - ABAP CDS: `sap-abap-cds`
   - CAP: `sap-cap-capire`
   - Fiori tools: `sap-fiori-tools`
   - SAPUI5/OpenUI5: `sapui5`
   - SQLScript/AMDP: `sap-sqlscript`
   - HANA inspection/development support: `sap-hana-cli`
3. Add role playbooks when useful:
   - `workspace role playbook: sap-cap-project-architect.md`
   - `workspace role playbook: sap-fiori-app-advisor.md`
   - `workspace role playbook: sap-ui5-code-quality-advisor.md`
   - `workspace role playbook: sap-sqlscript-analyzer.md`
   - `workspace role playbook: sap-hana-database-advisor.md`
   - `workspace role playbook: sap-api-style-reviewer.md`
4. Use `assets/templates/ui5-quality-review.md` for UI5 reviews or `assets/templates/technical-readiness-review.md` for broader technical reviews.

## Required Inputs

- Target runtime and release, such as ABAP release, ABAP Cloud, CAP runtime, UI5 version, HANA version, or BTP environment.
- Business process impact and delivery phase.
- Code, design, manifest, CDS, annotations, service definition, procedure, or deployment artifact.
- Test evidence, lint/build output, defects, performance evidence, and security/access assumptions.
- Deployment path, rollback plan, owner, and support model when production is in scope.

## Review Flow

1. Confirm scope, target release/runtime, and evidence.
2. Review correctness, release compatibility, security, authorization, error handling, performance, observability, tests, accessibility, maintainability, and deployment impact.
3. Prioritize findings by severity and business impact.
4. Distinguish recommended code changes from validation questions and approval-gated decisions.
5. Preserve compatibility caveats from the relevant skill.

## Approval Gates

- Production code or transport changes.
- Security or authorization model changes.
- Public API or service contract changes.
- Dependency upgrades or package execution.
- Tenant-connected testing, credential use, or MCP execution.

## Output Shape

- Findings first, ordered by severity.
- Confirmed facts and assumptions.
- Release/runtime compatibility notes.
- Test and evidence gaps.
- Recommended changes.
- Owners and next actions.
