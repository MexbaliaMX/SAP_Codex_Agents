# SAP Codex Subagent Role Playbooks

These files are Codex-safe role playbooks converted from upstream Claude agents. They are guidance for delegation and review; they do not enable tools, MCP servers, tenant access, hooks, or production mutations.

| Playbook | Role | Source |
|---|---|---|
| $(System.Collections.Hashtable.name) | SAP BTP Platform Advisor | plugins/sap-btp-cloud-platform/agents/btp-platform-advisor.md |
| $(System.Collections.Hashtable.name) | SAP Integration Flow Advisor | plugins/sap-btp-integration-suite/agents/integration-flow-advisor.md |
| $(System.Collections.Hashtable.name) | SAP CAP Project Architect | plugins/sap-cap-capire/agents/cap-project-architect.md |
| $(System.Collections.Hashtable.name) | SAP Fiori App Advisor | plugins/sap-fiori-tools/agents/fiori-app-advisor.md |
| $(System.Collections.Hashtable.name) | SAP UI5 Code Quality Advisor | plugins/sapui5/agents/ui5-code-quality-advisor.md |
| $(System.Collections.Hashtable.name) | SAP HANA Database Advisor | plugins/sap-hana-cli/agents/hana-database-advisor.md |
| $(System.Collections.Hashtable.name) | SAP SQLScript Analyzer | plugins/sap-sqlscript/agents/sqlscript-analyzer.md |
| $(System.Collections.Hashtable.name) | SAP API Style Reviewer | plugins/sap-api-style/agents/api-style-reviewer.md |
| $(System.Collections.Hashtable.name) | SAP Identity Security Advisor | plugins/sap-btp-cloud-identity-services/agents/identity-security-advisor.md |

## Use Rules

- Load a playbook when a task needs that specialist role.
- Keep tenant-changing actions approval-gated.
- Use the related .agents/skills skill for detailed technical or process guidance.
- Treat MCP and live tenant checks as pending unless the current workspace has an approved, configured tool.