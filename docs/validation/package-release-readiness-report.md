# Package and Release Readiness Report

Date: 2026-07-02

## Release Scope

This readiness pass covers the local Codex SAP Agents workspace and the repo-local `sap-codex-deliverables` plugin bundle.

Included deliverables:

- 26 workspace skills under `.agents/skills`.
- 9 role playbooks under `.agents/subagents`.
- SAP Agent Registry at `.agents/AGENT_REGISTRY.md`.
- 7 routing playbooks under `.agents/playbooks`.
- 4 output profile files under `.agents/output-profiles`.
- 8 client-ready sample files under `.agents/samples/client-ready`.
- Controlled automation candidates at `.agents/automation-candidates.md`.
- 11 shared templates under `.agents/templates`.
- 11 fictional sample deliverables under `.agents/samples/deliverables`.
- Repo-local plugin bundle at `plugins/sap-codex-deliverables`.
- Repo-local marketplace file at `marketplace.json`.
- Disabled MCP example at `.codex/config.toml.example`.
- Disabled hook example at `.codex/hooks.example.json`.
- Porting and validation reports under `docs/porting` and `docs/validation`.

## Readiness Decision

Status: ready for local workspace use and internal review packaging.

Not ready for external/client distribution until the blockers below are resolved.

## Validation Summary

Passed:

- All 26 workspace skills plus packaged plugin skill passed `quick_validate.py`.
- `plugins/sap-codex-deliverables` passed `validate_plugin.py`.
- `.codex/config.toml.example` parses as TOML with no active keys.
- `.codex/config.toml.example` has no active MCP server blocks.
- `.codex/config.toml.example` passed disposable-workspace smoke testing with `active keys: []`.
- `.codex/hooks.example.json` is documentation-only with `activeHooks: []` and validates as JSON.
- Upstream `validate-mcp-env-contracts.mjs` passed.
- Upstream `test-hooks.mjs` passed.
- Upstream `test-hook-contracts.mjs` passed for all 8 hook-enabled upstream plugins.
- Upstream `validate-templates.mjs` passed after local `xmllint` tooling was installed under `.tools/xmllint`.
- Plugin bundle contains 11 packaged templates and 11 packaged samples.
- Plugin bundle has no stale workspace paths, scaffold text, or unfinished placeholders.
- Manual Codex app plugin load/smoke passed for `sap-codex-deliverables`.
- Full agent operating-layer forward-test report completed.
- Read-only agent operating-layer validation passed with `scripts/validate-agent-operating-layer.ps1`, including client-ready samples.

Previously known failure now fixed locally:

- Upstream `validate-mcp-security.mjs` originally failed on the SAC MCP Windows/POSIX inventory key mismatch:
  - `plugins\sap-sac-scripting\.mcp.json:sac-mcp` reported missing from inventory.
  - `plugins/sap-sac-scripting/.mcp.json:sac-mcp` reported stale or unused.
  - Root cause was Windows `path.relative(...)` output being compared against POSIX-style inventory keys.
  - Fixed in the imported upstream validator by normalizing `.mcp.json` paths through the existing `relPath(...)` helper.
  - `node scripts\validate-mcp-security.mjs` now passes.

Not run / unavailable:

- Live SAP tenant validation.
- MCP runtime smoke tests.
- Active MCP server startup tests.
- Codex hook runtime tests.

Additional QA refresh on 2026-07-04:

- `git status --short` completed from this workspace; current pending edits are limited to validation documentation updates.
- Release tag alignment completed: `sap-codex-deliverables-v0.1.0` points to the manifest-recorded archive source commit `90bf571 Start plugin-safe operating layer packaging`.
- Release archive regenerated from the current tracked workspace after tag alignment and smoke-tested as `sap-codex-deliverables-v0.1.0.zip`.
- Archive SHA256 is recorded from the post-build archive smoke output; in-archive validation docs avoid self-referential checksums.
- Plugin-safe operating-layer assets are included in the refreshed release archive.
- Extracted archive documentation check confirmed that the embedded readiness report contains the current release tag alignment status.
- App-level plugin smoke rerun opened the repo-local plugin URL after archive regeneration and completed a go-live readiness output rerun using plugin-local assets.

Release hygiene update on 2026-07-05:

- Broken verification-reference path scan completed; malformed verification reference paths were corrected in the targeted technical skills.
- The 14 local process/SAP Activate overlay skills now expose a uniform `Verification Caveat` section that points to `references/verification.md`.
- `.github/workflows/release-hygiene.yml` was added for push and pull request validation.
- `scripts/validate-release-hygiene.ps1` was added to enforce advisory RC guardrails for broken reference paths, active `.codex/config.toml`, active `.codex/hooks.json`, disabled example files, unfinished operating-layer markers, and private/customer/NDA artifact filename patterns.
- `.gitignore` was expanded for local Codex runtime config, environment files, certificates, keys, and private/customer/NDA deliverable patterns.
- Formal license review remains pending in `docs/governance/license-review.md`; `THIRD_PARTY_NOTICES.md` is a pending-review stub.
- Local validation passed for `scripts\validate-agent-operating-layer.ps1`, `scripts\validate-plugin-operating-layer-assets.ps1`, and `scripts\validate-release-hygiene.ps1`.

GPL-3.0 release planning update on 2026-07-05:

- Owner direction recorded for GPL-3.0-only source release planning.
- `LICENSE` added with GNU GPLv3 text downloaded from the Free Software Foundation license URL.
- `docs/governance/gpl-3-release-plan.md` added.
- Third-party notices, contributor-rights, provenance, proprietary packaging, marketplace distribution, and client redistribution review remain open.

## Release Assets

| Asset | Status |
|---|---|
| Workspace skills | Ready for local use |
| Phase 2 process/Activate overlays | Ready for local advisory use |
| Phase 3 role playbooks | Ready for advisory use |
| SAP Agent Registry | Ready for internal advisory use |
| Routing playbooks | Ready for internal advisory use |
| Output profiles | Ready for internal advisory use |
| Client-ready sample outputs | Ready for internal adaptation; not tenant/legal/security proof |
| Controlled automation candidates | Documented; automation remains disabled |
| Plugin-safe operating-layer assets | Generated, statically validated, included in refreshed archive, and recorded in the final release manifest |
| Shared templates | Ready for local use |
| Fictional sample deliverables | Ready for local use |
| `sap-codex-deliverables` plugin bundle | Loaded and smoke-tested in Codex app; ready for internal review packaging |
| `marketplace.json` | Ready for repo-local marketplace review |
| `.codex/config.toml.example` | Safe as disabled example; disposable-workspace smoke passed with no active keys |
| `.codex/hooks.example.json` | Safe as documentation-only disabled example; no active hooks |
| Hooks | Reviewed, not enabled |
| Tenant-connected MCPs | Blocked |
| Release hygiene CI | Added for advisory RC push and pull request checks |
| License review | GPL-3.0-only source release planned; third-party notice and redistribution review still open |

## Blockers Before External Distribution

- Keep SAC MCP disabled until source-install evidence, tenant approval, and security review are complete.
- Complete tenant/security approval before enabling HANA, Datasphere, or SAC MCPs.
- Confirm Codex hook schema, event names, stdin payload shape, and denial semantics before enabling any hooks from `.codex/hooks.example.json`.
- Review GPL-3.0 obligations before proprietary client packaging, marketplace distribution, closed redistribution, or client distribution beyond public source review.
- Complete formal third-party notice review before external/client distribution.
- Regenerate and smoke the release archive again if validation documentation changes before distribution.
- Rerun app-level plugin smoke after any archive, marketplace, plugin manifest, or operating-layer asset change before external/client distribution.

## Recommended Next Release Step

Complete the remaining governance checks, then rerun app-level plugin smoke immediately before any external/client distribution.
