# SAP Codex Subagent Role Playbooks

These files are Codex-safe role playbooks converted from upstream Claude agents. They are guidance for delegation and review; they do not enable tools, MCP servers, tenant access, hooks, or production mutations.

| Playbook | Role | Source |
|---|---|---|
| `sap-btp-platform-advisor` | SAP BTP Platform Advisor | plugins/sap-btp-cloud-platform/agents/btp-platform-advisor.md |
| `sap-integration-flow-advisor` | SAP Integration Flow Advisor | plugins/sap-btp-integration-suite/agents/integration-flow-advisor.md |
| `sap-cap-project-architect` | SAP CAP Project Architect | plugins/sap-cap-capire/agents/cap-project-architect.md |
| `sap-fiori-app-advisor` | SAP Fiori App Advisor | plugins/sap-fiori-tools/agents/fiori-app-advisor.md |
| `sap-ui5-code-quality-advisor` | SAP UI5 Code Quality Advisor | plugins/sapui5/agents/ui5-code-quality-advisor.md |
| `sap-hana-database-advisor` | SAP HANA Database Advisor | plugins/sap-hana-cli/agents/hana-database-advisor.md |
| `sap-sqlscript-analyzer` | SAP SQLScript Analyzer | plugins/sap-sqlscript/agents/sqlscript-analyzer.md |
| `sap-api-style-reviewer` | SAP API Style Reviewer | plugins/sap-api-style/agents/api-style-reviewer.md |
| `sap-identity-security-advisor` | SAP Identity Security Advisor | plugins/sap-btp-cloud-identity-services/agents/identity-security-advisor.md |
| `sap-authorization-concept-advisor` | SAP Authorization Concept Advisor | local/sap-s4hana-authorization-security |
| `sap-fiori-authorization-advisor` | SAP Fiori Authorization Advisor | local/sap-s4hana-authorization-security |
| `sap-cds-dcl-security-reviewer` | SAP CDS DCL Security Reviewer | local/sap-s4hana-authorization-security |
| `sap-sod-controls-advisor` | SAP SoD Controls Advisor | local/sap-s4hana-authorization-security |

## Use Rules

- Load a playbook when a task needs that specialist role.
- Keep tenant-changing actions approval-gated.
- Use the related .agents/skills skill for detailed technical or process guidance.
- Treat MCP and live tenant checks as pending unless the current workspace has an approved, configured tool.
