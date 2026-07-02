# Open Validation Items

## Source verification

- Preserve upstream `last_verified` metadata; do not advance dates without new evidence.
- Identify skills with stale, missing, or audit-only verification before client-facing use.
- Add tenant evidence only after testing in the relevant SAP landscape.

## Live environment tests

- No SAP BTP, Integration Suite, HANA, SAC, Datasphere, S/4HANA, BAS, or Fiori launchpad tenant validation has been performed in this Codex port.
- Treat generated artifacts as locally structured and source-guided until imported or tested in a real tenant.

## Hooks

- Hook trust and Windows execution review is complete.
- Keep lifecycle hooks disabled until Codex hook schema, event names, stdin payload shape, and denial semantics are confirmed.
- Replace Claude path variables and Bash assumptions before any Windows execution.

## MCP

- Do not commit secrets or tenant credentials.
- Convert MCP definitions only into project-scoped `.codex/config.toml` templates or Codex plugin bundles after approval.
- Pin package versions and document required environment variables.
- Resolve the upstream MCP security validator mismatch for `plugins\sap-sac-scripting\.mcp.json:sac-mcp` before enabling or packaging SAC MCP support.

## Windows compatibility

- Review Bash scripts for Git Bash or WSL assumptions.
- Prefer PowerShell or Node wrappers for local Windows workflows.
- Check paths with spaces, long paths, and `.cmd` binary resolution for Node tooling.
- Install or provide `xmllint` before running upstream iFlow XML template validation on Windows.

## Licensing

- Review GPL-3.0 redistribution obligations before proprietary client packaging or marketplace distribution.

## Skill quality checks

- Validate frontmatter for all migrated skills.
- Check references from `SKILL.md` to copied resource files.
- Decide whether copied command references should remain under each skill or be consolidated under a shared prompt library.
- Install Git or run status checks from an environment where Git is available before making commits or release tags.
- Continue forward-testing the Phase 2 skills not covered in the first representative pass: L2C, S2P, P2P, Plan-to-Produce, Design-to-Operate, Hire-to-Retire, Discover, Prepare, and Realize.
- Continue forward-testing the Phase 3 role playbooks not covered in the first representative pass: CAP Project Architect, Fiori App Advisor, HANA Database Advisor, SQLScript Analyzer, and API Style Reviewer.
- Smoke-test `.codex/config.toml.example` in a disposable workspace before enabling any MCP block in this project.
- Resolve the SAC MCP Windows/POSIX inventory key mismatch before considering SAC enablement.
- Complete tenant/security approval before enabling HANA, Datasphere, or SAC MCPs.
- Confirm Codex hook schema, event names, stdin payload shape, and denial semantics before creating `.codex/hooks.example.json`.
- Create only a disabled `.codex/hooks.example.json` for reviewed hook candidates after disposable-workspace smoke tests.
