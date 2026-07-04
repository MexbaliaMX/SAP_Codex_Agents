# SAP Agents Internal Release Notes

Release date: 2026-07-02

## Status

This internal release is ready for local workspace use and internal review packaging.

It is not ready for external/client distribution until the blockers in `docs/validation/internal-release-checklist.md` and `docs/validation/open-items.md` are resolved.

## Included

- 26 local SAP Codex skills under `.agents/skills`.
- 9 advisory role playbooks under `.agents/subagents`.
- Workspace-only SAP Agent Registry at `.agents/AGENT_REGISTRY.md`.
- Workspace-only routing playbooks under `.agents/playbooks`.
- Workspace-only output profiles under `.agents/output-profiles`.
- Workspace-only client-ready anonymized samples under `.agents/samples/client-ready`.
- Workspace-only controlled automation candidates at `.agents/automation-candidates.md`.
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
- Agent operating-layer validation passed with `scripts/validate-agent-operating-layer.ps1`, including client-ready samples.

Known limitations:

- No live SAP tenant validation was performed.
- MCP runtime and Codex hook runtime tests were not performed.
- Plugin-safe operating-layer assets have been generated under the repo-local plugin, but they are not included in the existing `sap-codex-deliverables-v0.1.0.zip` archive until a future package refresh and smoke validation.

## Do Not Enable Yet

- Do not enable HANA, Datasphere, or SAC MCPs without tenant/security approval.
- Do not enable SAC MCP until the inventory key mismatch is resolved.
- Do not create active `.codex/hooks.json` until Codex hook schema and denial semantics are confirmed.
- Do not treat templates, samples, or role playbooks as tenant-tested, legal/tax-approved, or production-ready.
- Do not treat registry/playbooks/output profiles as autonomous tool-enabled agents.
- Do not use client-ready samples as client facts without replacing anonymized assumptions with confirmed evidence.

## Primary Artifacts

- Release readiness: `docs/validation/package-release-readiness-report.md`
- Final manifest: `docs/validation/final-release-manifest.md`
- Release checklist: `docs/validation/internal-release-checklist.md`
- Agent coverage plan: `docs/porting/full-sap-agents-coverage-plan.md`
- Agent operating-layer forward test: `docs/validation/full-agent-forward-test-report.md`
- Plugin-safe operating-layer packaging: `docs/porting/plugin-safe-operating-layer-packaging.md`
- Plugin operating-layer validation: `docs/validation/plugin-operating-layer-validation-report.md`
- Plugin bundle notes: `docs/porting/plugin-bundle.md`
- MCP trust review: `docs/porting/mcp-trust-review.md`
- Hook trust review: `docs/porting/hook-trust-windows-review.md`
- Migration log: `docs/porting/migration-log.md`
