# Phase 3 Advanced Behavior

## Completed in This Pass

Converted selected upstream Claude agents into Codex-safe role playbooks under `.agents/subagents`.

Converted playbooks:

- `sap-btp-platform-advisor`
- `sap-integration-flow-advisor`
- `sap-cap-project-architect`
- `sap-fiori-app-advisor`
- `sap-ui5-code-quality-advisor`
- `sap-hana-database-advisor`
- `sap-sqlscript-analyzer`
- `sap-api-style-reviewer`
- `sap-identity-security-advisor`

Conversion rules:

- Remove Claude tool allowlists, model hints, color hints, and MCP tool identifiers.
- Preserve delegation intent, first checks, safety constraints, and output shape.
- Link each role to the local `.agents/skills` library.
- Keep role playbooks read-only and advisory by default.

## MCP Candidates

MCP configs found in the upstream source remain disabled. Do not copy these into `.codex/config.toml` until a trust and credential review is complete.

| Source plugin | Server | Command | Notes |
|---|---|---|---|
| `sap-cap-capire` | `sap-cap-capire` | `npx -y @cap-js/mcp-server@0.0.5` | Requires network/package trust review. |
| `sap-datasphere` | pending review | source `.mcp.json` | Not enabled in this pass. |
| `sap-fiori-tools` | pending review | source `.mcp.json` | Not enabled in this pass. |
| `sap-hana-cli` | `hana-mcp-server` | `npx -y hana-mcp-server@0.3.1` | Requires HANA env vars and secret handling. |
| `sap-sac-scripting` | `sac-mcp` | local Node path via `SAC_MCP_PATH` | Windows/POSIX validator path mismatch fixed locally; keep disabled until tenant/security approval and source-install evidence. |
| `sapui5` | `ui5-tooling` | `npx -y @ui5/mcp-server@0.2.11` | Requires package trust review. |

## Hook Candidates

Hook-enabled plugins remain disabled:

- `sap-cap-capire`
- `sap-datasphere`
- `sap-dependency-security`
- `sap-sac-custom-widget`
- `sap-sac-planning`
- `sap-sac-scripting`
- `sap-sqlscript`
- `sapui5`

Before enabling hooks:

- Review every validator script.
- Replace Claude path variables.
- Confirm Windows compatibility.
- Confirm write targets and failure behavior.
- Add an explicit user approval gate for lifecycle execution.

## Phase 3 Follow-Ups

- Representative forward testing for the role playbooks is complete for v0.1.0.
- Decide whether `.agents/subagents` should remain advisory docs or map to a future Codex subagent configuration format.
- Create `.codex/config.toml.example` only after MCP trust review.
- Create `.codex/hooks.example.json` only after hook trust review.