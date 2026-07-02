# SAP Agents Internal Release Notes

Release date: 2026-07-02

## Status

This internal release is ready for local workspace use and internal review packaging.

It is not ready for external/client distribution until the blockers in `docs/validation/internal-release-checklist.md` and `docs/validation/open-items.md` are resolved.

## Included

- 26 local SAP Codex skills under `.agents/skills`.
- 9 advisory role playbooks under `.agents/subagents`.
- Shared references for Mexbalia guardrails, SAP process language, Mexico compliance cues, and SAP Activate governance.
- 11 reusable output templates under `.agents/templates`.
- 11 fictional filled sample deliverables under `.agents/samples/deliverables`.
- Repo-local Codex plugin bundle: `plugins/sap-codex-deliverables`.
- Repo-local marketplace file: `marketplace.json`.
- Disabled MCP config example: `.codex/config.toml.example`.
- Porting, trust-review, forward-test, and readiness reports under `docs/porting` and `docs/validation`.

## Validation Summary

Passed:

- All 26 workspace skills plus the packaged plugin skill passed `quick_validate.py`.
- `sap-codex-deliverables` passed plugin validation.
- `.codex/config.toml.example` parses with no active keys.
- Upstream MCP environment contract validation passed.
- Upstream hook tests and hook contract tests passed.
- Plugin bundle contains 11 packaged templates and 11 packaged fictional samples.
- Plugin bundle has no stale workspace paths, scaffold text, or unfinished placeholders.
- Manual Codex app plugin load/smoke passed for `sap-codex-deliverables`.

Known limitations:

- `git` is not installed in this shell, so release status/tag checks were not run here.
- The upstream MCP security validator still fails on the known SAC Windows/POSIX inventory key mismatch.
- No live SAP tenant validation was performed.
- MCP runtime and Codex hook runtime tests were not performed.
- Upstream iFlow XML template validation still requires `xmllint`.

## Do Not Enable Yet

- Do not enable HANA, Datasphere, or SAC MCPs without tenant/security approval.
- Do not enable SAC MCP until the inventory key mismatch is resolved.
- Do not create active `.codex/hooks.json` until Codex hook schema and denial semantics are confirmed.
- Do not treat templates, samples, or role playbooks as tenant-tested, legal/tax-approved, or production-ready.

## Primary Artifacts

- Release readiness: `docs/validation/package-release-readiness-report.md`
- Release checklist: `docs/validation/internal-release-checklist.md`
- Plugin bundle notes: `docs/porting/plugin-bundle.md`
- MCP trust review: `docs/porting/mcp-trust-review.md`
- Hook trust review: `docs/porting/hook-trust-windows-review.md`
- Migration log: `docs/porting/migration-log.md`
