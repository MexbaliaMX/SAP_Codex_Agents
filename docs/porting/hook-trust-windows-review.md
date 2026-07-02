# Hook Trust and Windows Execution Review

Date: 2026-07-02

## Scope

Reviewed upstream hook-enabled plugins from `.imports/sap-skills-main/sap-skills-main`. No hooks were enabled in this workspace.

Hook-enabled plugins reviewed:

- `sap-cap-capire`
- `sap-datasphere`
- `sap-dependency-security`
- `sap-sac-custom-widget`
- `sap-sac-planning`
- `sap-sac-scripting`
- `sap-sqlscript`
- `sapui5`

Reviewed hook files:

- `hooks/hooks.json`
- `hooks/validator.mjs`
- `hooks/validator.py` where present
- `hooks/dispatch.sh`

## Inventory

| Plugin | Purpose | Events / matchers | Runtime in manifest | Windows/Codex decision |
|---|---|---|---|---|
| `sap-cap-capire` | CAP/CDS syntax and best-practice validation | `PreToolUse` and `PostToolUse` for `Write|Edit|MultiEdit` | `node ${CLAUDE_PLUGIN_ROOT}/hooks/validator.mjs` | Do not enable as-is |
| `sap-datasphere` | SQL/view validation for Datasphere-style development | `PreToolUse` and `PostToolUse` for `Write|Edit|MultiEdit` | `node ${CLAUDE_PLUGIN_ROOT}/hooks/validator.mjs` | Do not enable as-is |
| `sap-dependency-security` | Dependency and MCP executable-package security validation | `PreToolUse` for `Write|Edit|MultiEdit` and `Bash`; `PostToolUse` for `Write|Edit|MultiEdit` | `node ${CLAUDE_PLUGIN_ROOT}/hooks/validator.mjs` | Strong candidate after Codex hook mapping |
| `sap-sac-custom-widget` | SAC custom widget quality validation | `PreToolUse` and `PostToolUse` for `Write|Edit|MultiEdit` | `node ${CLAUDE_PLUGIN_ROOT}/hooks/validator.mjs` | Do not enable as-is |
| `sap-sac-planning` | SAC planning API usage and best-practice validation | `PreToolUse` and `PostToolUse` for `Write|Edit|MultiEdit` | `node ${CLAUDE_PLUGIN_ROOT}/hooks/validator.mjs` | Do not enable as-is |
| `sap-sac-scripting` | SAC scripting validation and best practices | `PreToolUse` and `PostToolUse` for `Write|Edit|MultiEdit` | `node ${CLAUDE_PLUGIN_ROOT}/hooks/validator.mjs` | Do not enable as-is |
| `sap-sqlscript` | SQLScript code quality validation | `PostToolUse` for `Write|Edit|MultiEdit` | `node ${CLAUDE_PLUGIN_ROOT}/hooks/validator.mjs` | Candidate as manual validator first |
| `sapui5` | SAPUI5 best-practice validation | `PreToolUse` for `Write|Edit|MultiEdit` and `Bash`; `PostToolUse` for `Write|Edit|MultiEdit` | `node ${CLAUDE_PLUGIN_ROOT}/hooks/validator.mjs` | Candidate after Codex hook mapping |

## Trust Findings

- Upstream hook manifests are Claude-specific. They use `${CLAUDE_PLUGIN_ROOT}` and Claude event/matcher names.
- The hook validators read JSON from stdin and write JSON to stdout.
- Static checks did not find filesystem writes, network calls, subprocess launches, or environment variable reads in the validators.
- Seven domain validators are byte-identical copies across their plugins. The dependency-security validator is separate.
- `dispatch.sh` is Bash-based and not Windows-native, but the hook manifests call `node` directly rather than `dispatch.sh`.
- The validators emit Claude-style hook fields such as `permissionDecision`, `permissionDecisionReason`, and `additionalContext`; Codex compatibility is not proven.
- Some validators can deny writes or command execution when high-risk SAP content is detected. This is useful as a guardrail, but lifecycle denial behavior must be tested in Codex before enabling.

## Windows Compatibility

Current blockers:

- `${CLAUDE_PLUGIN_ROOT}` must be replaced with a Codex-compatible absolute or project-relative path.
- `dispatch.sh` requires Git Bash, WSL, or another Bash runtime on Windows if used.
- Codex hook schema and event names were not confirmed in this session.
- Timeout and denial semantics may differ from Claude hook behavior.

Potential Windows path:

- Prefer direct `node` invocation of `validator.mjs`.
- Avoid `dispatch.sh` unless a Bash runtime is explicitly required and approved.
- Use project-relative paths only in an example file, with every hook disabled or commented until Codex hook schema is confirmed.
- Keep the Python validators as reference/fallback only unless a Windows wrapper is added.

## Validation Results

Ran in `.imports/sap-skills-main/sap-skills-main`:

- `node scripts/test-hooks.mjs`: passed.
- `node scripts/test-hook-contracts.mjs`: passed for all 8 hook-enabled plugins.

These tests validate upstream hook behavior and contract fixtures. They do not prove Codex hook runtime compatibility.

## Decision

Do not create an active `.codex/hooks.json` or enable lifecycle hooks yet.

A documentation-only `.codex/hooks.example.json` has been created with `activeHooks: []`, disabled candidates, blocked candidates, and explicit runtime blockers. It is not an active hook configuration.

Best candidates for a future disabled example:

- `sap-dependency-security` because it guards package/MCP executable trust and Bash package commands.
- `sapui5` because it has useful UI5 write and deploy-command checks.
- `sap-sqlscript` because it is post-write only and narrower than the multi-domain validator set.

Blocked from example config until more review:

- SAC hooks (`sap-sac-custom-widget`, `sap-sac-planning`, `sap-sac-scripting`) because they can affect tenant-facing SAC artifacts and need SAC-specific workflow validation.
- `sap-datasphere` because Datasphere SQL/view guidance overlaps tenant-connected modeling and should be handled carefully.
- `sap-cap-capire` until CAP-specific Codex write-hook behavior is tested in a disposable project.

## Required Conditions Before Enabling Hooks

- Confirm Codex hook schema, event names, stdin payload shape, and denial semantics.
- Replace `${CLAUDE_PLUGIN_ROOT}` with a Codex-compatible path strategy.
- Use `validator.mjs` directly on Windows.
- Run a disposable-workspace smoke test for each candidate hook.
- Keep tenant-connected, production-impacting, and credential-related workflows approval-gated.
