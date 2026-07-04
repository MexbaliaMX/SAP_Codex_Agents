# Final Release Manifest

Date: 2026-07-02

Manifest refresh: 2026-07-04

## Release Identity

| Field | Value |
|---|---|
| Package | `sap-codex-deliverables` |
| Release | `v0.1.0` |
| Git tag | `sap-codex-deliverables-v0.1.0` |
| Git commit | `90bf571 Start plugin-safe operating layer packaging` |
| Branch at release | `master` |
| Git status at manifest creation | Clean |
| Archive | `C:\codex\SAP Agents\sap-codex-deliverables-v0.1.0.zip` |
| Archive size | `1,133,493 bytes` |
| SHA256 | `27114A99F8B9C43FDFD69BE6A609C86FB032FEAAE2A68D2D0B6CFAEC42FC0660` |

## Manifest Refresh Note

This refresh records the archive regenerated from commit `90bf571` after plugin-safe operating-layer packaging. The archive smoke test and extracted plugin operating-layer validation both passed before updating the size and SHA256 above. The commit that carries this manifest note will necessarily have a newer commit ID; the archive hash above remains the last verified package artifact unless a new archive is generated and smoked again.

## Release Decision

Status: ready for local workspace use and internal review packaging.

External or client distribution remains blocked pending licensing and governance review.

Production or tenant-connected use remains blocked pending live SAP tenant evidence, security approval, legal/tax review where relevant, and explicit human approval for tenant-impacting actions.

## Included Assets

Packaged release assets:

- 26 workspace skills under `.agents/skills`.
- 9 Codex-safe role playbooks under `.agents/subagents`.
- 11 shared templates under `.agents/templates`.
- 11 fictional sample deliverables under `.agents/samples/deliverables`.
- Repo-local `sap-codex-deliverables` plugin bundle under `plugins/sap-codex-deliverables`.
- Plugin-safe SAP Agent operating-layer assets under `plugins/sap-codex-deliverables/skills/sap-deliverable-templates/assets/operating-layer`.
- Repo-local marketplace file at `marketplace.json`.
- Disabled MCP example at `.codex/config.toml.example`.
- Documentation-only disabled hook example at `.codex/hooks.example.json`.
- Release smoke script at `scripts/test-release-archive.ps1`.
- Porting and validation evidence under `docs/porting` and `docs/validation`.

Workspace operating assets included in the refreshed archive:

- SAP Agent Registry at `.agents/AGENT_REGISTRY.md`.
- 7 high-value routing playbooks under `.agents/playbooks`.
- 4 output profile files under `.agents/output-profiles`.
- 8 client-ready sample files under `.agents/samples/client-ready`.
- Controlled automation candidates at `.agents/automation-candidates.md`.
- Full SAP Agents coverage plan at `docs/porting/full-sap-agents-coverage-plan.md`.
- Full agent operating-layer forward-test report at `docs/validation/full-agent-forward-test-report.md`.
- Read-only operating-layer validation script at `scripts/validate-agent-operating-layer.ps1`.

Plugin-safe operating-layer packaging included in the refreshed archive:

- Generated plugin-local assets at `plugins/sap-codex-deliverables/skills/sap-deliverable-templates/assets/operating-layer`.
- Packaging generator at `scripts/package-operating-layer-assets.ps1`.
- Plugin asset validator at `scripts/validate-plugin-operating-layer-assets.ps1`.
- Validation record at `docs/validation/plugin-operating-layer-validation-report.md`.
- Porting note at `docs/porting/plugin-safe-operating-layer-packaging.md`.

## Release Smoke

Command:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\test-release-archive.ps1 `
  -ArchivePath sap-codex-deliverables-v0.1.0.zip
```

Result:

```text
Release archive smoke passed.
Workspace skills: 26
Workspace templates markdown files: 11
Workspace sample deliverable markdown files: 11
Plugin templates markdown files: 11
Plugin sample markdown files: 11
```

Additional extracted-archive validation:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\validate-plugin-operating-layer-assets.ps1 -Root <extracted-archive-root>
```

Result:

```text
Plugin operating-layer asset validation passed.
Checked plugin-local registry, playbooks, output profiles, client-ready samples, references, and stale workspace paths.
```

## Validation Evidence

Passed in this workspace:

- `quick_validate.py` for all 26 workspace skills.
- `quick_validate.py` for packaged `sap-deliverable-templates` skill.
- `validate_plugin.py` for `plugins/sap-codex-deliverables`.
- Release archive smoke via `scripts/test-release-archive.ps1`.
- Manual Codex app install/load smoke for `sap-codex-deliverables`.
- Template forward testing and sample deliverable creation.
- Remaining Phase 2 forward testing: L2C, S2P, P2P, Plan-to-Produce, Design-to-Operate, Hire-to-Retire, Discover, Prepare, and Realize.
- Remaining Phase 3 role-playbook forward testing: CAP Project Architect, Fiori App Advisor, HANA Database Advisor, SQLScript Analyzer, and API Style Reviewer.
- `.codex/config.toml.example` disposable-workspace smoke with `active keys: []`.
- `.codex/hooks.example.json` static JSON validation with `activeHooks: []`.
- Upstream MCP env contract validation.
- Upstream MCP security validation after Windows path normalization fix.
- Upstream hook tests and hook contract tests for the source validators.
- Upstream template validation with local `xmllint`.
- Read-only SAP agent operating-layer validation with `scripts/validate-agent-operating-layer.ps1`.
- Plugin-safe operating-layer asset validation with `scripts/validate-plugin-operating-layer-assets.ps1`.
- Packaged `sap-deliverable-templates` skill validation after adding operating-layer assets.
- `sap-codex-deliverables` plugin validation after adding operating-layer assets.

## Safety Boundaries

- No live SAP BTP, Integration Suite, HANA, SAC, Datasphere, S/4HANA, BAS, or Fiori launchpad tenant validation has been performed.
- No fiscal, legal, security, licensing, or production-readiness approval is implied.
- Tenant-connected MCPs remain blocked.
- Hooks remain disabled; `.codex/hooks.example.json` is documentation-only.
- `.codex/config.toml.example` is disabled/comment-only.
- SAP Agent Registry, routing playbooks, output profiles, client-ready samples, and controlled automation notes are advisory guidance. The refreshed archive includes both the workspace operating layer and a plugin-safe generated copy.
- Agent playbooks and output profiles are not autonomous tool-enabled agents.
- Client-ready samples are anonymized examples and require confirmed client evidence before use.
- Fictional sample deliverables must not be reused as client facts.
- `.imports` and `.tools` are local source/tooling evidence and are intentionally excluded from release packaging.

## Remaining Blockers

- Review GPL-3.0 redistribution obligations before proprietary client packaging or marketplace distribution.
- Rerun app-level plugin smoke before external/client distribution of the refreshed archive.
- Decide whether copied command references stay under individual skills or move to a shared prompt library.
- Complete SAC MCP source-install provenance, exact commit evidence, tenant/security approval, and least-privilege access review before enablement.
- Complete tenant/security approval before enabling HANA, Datasphere, or SAC MCPs.
- Confirm Codex hook schema, event names, stdin payload shape, and denial semantics before enabling any hooks from `.codex/hooks.example.json`.
- Add live tenant evidence before making SAP product, API, licensing, roadmap, compliance, or production behavior claims.

## Related Records

- `RELEASE_NOTES.md`
- `docs/validation/internal-release-checklist.md`
- `docs/validation/package-release-readiness-report.md`
- `docs/validation/plugin-bundle-fresh-smoke-test-report.md`
- `docs/validation/plugin-app-install-smoke-report.md`
- `docs/validation/config-example-disposable-smoke-report.md`
- `docs/validation/hooks-example-validation-report.md`
- `docs/validation/xmllint-template-validation-report.md`
- `docs/validation/full-agent-forward-test-report.md`
- `docs/validation/plugin-operating-layer-validation-report.md`
- `docs/porting/full-sap-agents-coverage-plan.md`
- `docs/porting/plugin-safe-operating-layer-packaging.md`
- `docs/porting/mcp-trust-review.md`
- `docs/porting/hook-trust-windows-review.md`
- `docs/porting/upstream-mcp-security-validator-windows-path-fix.md`
