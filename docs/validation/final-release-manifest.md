# Final Release Manifest

Date: 2026-07-02

Manifest refresh: 2026-07-03

## Release Identity

| Field | Value |
|---|---|
| Package | `sap-codex-deliverables` |
| Release | `v0.1.0` |
| Git tag | `sap-codex-deliverables-v0.1.0` |
| Git commit | `745876c Add final release manifest` |
| Branch at release | `master` |
| Git status at manifest creation | Clean |
| Archive | `C:\codex\SAP Agents\sap-codex-deliverables-v0.1.0.zip` |
| Archive size | `1,035,405 bytes` |
| SHA256 | `C3BF794B5C1AC2012A36A312D852A529ADEF4C583A6D690CB719A0620FF5BEC9` |

## Manifest Refresh Note

This refresh records the externally generated archive produced after commit `745876c` and the final smoke output. The commit that carries this note will necessarily have a newer commit ID; the archive hash above remains the last verified package artifact unless a new archive is generated and smoked again.

## Release Decision

Status: ready for local workspace use and internal review packaging.

External or client distribution remains blocked pending licensing and governance review.

Production or tenant-connected use remains blocked pending live SAP tenant evidence, security approval, legal/tax review where relevant, and explicit human approval for tenant-impacting actions.

## Included Assets

- 26 workspace skills under `.agents/skills`.
- 9 Codex-safe role playbooks under `.agents/subagents`.
- 11 shared templates under `.agents/templates`.
- 11 fictional sample deliverables under `.agents/samples/deliverables`.
- Repo-local `sap-codex-deliverables` plugin bundle under `plugins/sap-codex-deliverables`.
- Repo-local marketplace file at `marketplace.json`.
- Disabled MCP example at `.codex/config.toml.example`.
- Documentation-only disabled hook example at `.codex/hooks.example.json`.
- Release smoke script at `scripts/test-release-archive.ps1`.
- Porting and validation evidence under `docs/porting` and `docs/validation`.

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

## Safety Boundaries

- No live SAP BTP, Integration Suite, HANA, SAC, Datasphere, S/4HANA, BAS, or Fiori launchpad tenant validation has been performed.
- No fiscal, legal, security, licensing, or production-readiness approval is implied.
- Tenant-connected MCPs remain blocked.
- Hooks remain disabled; `.codex/hooks.example.json` is documentation-only.
- `.codex/config.toml.example` is disabled/comment-only.
- Fictional sample deliverables must not be reused as client facts.
- `.imports` and `.tools` are local source/tooling evidence and are intentionally excluded from release packaging.

## Remaining Blockers

- Review GPL-3.0 redistribution obligations before proprietary client packaging or marketplace distribution.
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
- `docs/porting/mcp-trust-review.md`
- `docs/porting/hook-trust-windows-review.md`
- `docs/porting/upstream-mcp-security-validator-windows-path-fix.md`
