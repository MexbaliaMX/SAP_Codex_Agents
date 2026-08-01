# Final Release Manifest

## Release Addendum - v0.2.0-rc1

Date: 2026-07-25

| Field | Value |
|---|---|
| Package | `sap-codex-deliverables` |
| Release | `v0.2.0-rc1-advisory-rc` |
| Git tag | `sap-codex-deliverables-v0.2.0-rc1` |
| Tag target commit | `637cad305060134360c655efa455f1a205b923c5` |
| Merge commit | `637cad305060134360c655efa455f1a205b923c5` |
| Base branch | `chore/release-hygiene-advisory-rc` |
| Merged PR | `https://github.com/MexbaliaMX/SAP_Codex_Agents/pull/9` |
| GitHub prerelease | `https://github.com/MexbaliaMX/SAP_Codex_Agents/releases/tag/sap-codex-deliverables-v0.2.0-rc1` |
| Archive | `C:\codex\SAP Agents\sap-codex-deliverables-v0.2.0-rc1.zip` |
| Archive size | `1,576,400 bytes` |
| SHA256 | `6BCD9E94BEDA196C149950118AE5B3C4AD794217DB68DBE69F5A4721A8AA053F` |

### v0.2.0-rc1 Scope

This advisory RC records the merged SAP agents framework roadmap package, including SAP S/4HANA Authorization & Access Security, SoD controls advisory, evidence ingestion, repeatable review packs, deterministic authorization review-pack generation, CI regression coverage, SAP Fiori/process deliverables, GROW Fast advisory content, and extension calculator assets.

### v0.2.0-rc1 Validation

Post-merge local validation passed:

- `scripts\validate-agent-operating-layer.ps1`
- `scripts\validate-plugin-operating-layer-assets.ps1`
- `scripts\test-authorization-review-packs.ps1`
- `scripts\validate-release-hygiene.ps1`

Release archive smoke passed:

```text
Plugin validation passed: <extracted-archive-root>\plugins\sap-codex-deliverables
config example active keys: []
Release archive smoke passed.
Archive: C:\codex\SAP Agents\sap-codex-deliverables-v0.2.0-rc1.zip
SHA256: 6BCD9E94BEDA196C149950118AE5B3C4AD794217DB68DBE69F5A4721A8AA053F
Workspace skills: 29
Workspace templates markdown files: 16
Workspace sample deliverable markdown files: 13
Plugin templates markdown files: 11
Plugin sample markdown files: 11
```

GitHub prerelease verification confirmed:

- `isDraft: false`
- `isPrerelease: true`
- Asset: `sap-codex-deliverables-v0.2.0-rc1.zip`
- Asset state: `uploaded`
- Asset digest: `sha256:6bcd9e94beda196c149950118ae5b3c4ad794217db68dbe69f5a4721a8aa053f`

GitHub prerelease asset fresh-download smoke passed:

```text
Downloaded asset: sap-codex-deliverables-v0.2.0-rc1.zip
Downloaded SHA256: 6BCD9E94BEDA196C149950118AE5B3C4AD794217DB68DBE69F5A4721A8AA053F
Plugin validation passed: <extracted-archive-root>\plugins\sap-codex-deliverables
config example active keys: []
Release archive smoke passed.
Workspace skills: 29
Workspace templates markdown files: 16
Workspace sample deliverable markdown files: 13
Plugin templates markdown files: 11
Plugin sample markdown files: 11
```

Manual install/load automated validation was also completed and recorded in `docs/validation/sap-codex-deliverables-v0.2.0-rc1-manual-install-load-smoke.md`.

```text
Download: PASS - 1,576,400 bytes
SHA-256: PASS - matches 6BCD9E94...AA053F
Extraction and required paths: PASS
All 29 workspace skills and plugin skill: PASS
Plugin validation: PASS
Disabled configuration: PASS
Control-character scan: PASS
GitHub release confirmed as a published prerelease
Codex desktop install/load smoke: PASS
Fresh task: 019f9b20-861d-7f73-b0bd-fdb20ef262f4
Smoke prompt 1: PASS
Smoke prompt 2: PASS
MCP/hooks/tenant credentials: Not enabled
Deviation: PowerShell unavailable; equivalent native extraction and python3 checks were used
Desktop deviation: /tmp marketplace path was not visible from Windows/PowerShell, but the requested codex:// URL opened successfully and the workspace marketplace fallback was also opened
```

No GitHub Actions run or combined status appeared for merge commit `637cad3` at packaging time. Pre-merge `Release Hygiene` passed for head SHA `f6cdd5e`, and post-merge local validation passed on `637cad3`.

### v0.2.0-rc1 Safety Boundaries

- This is an advisory and template-oriented release candidate.
- No live SAP tenant validation has been performed.
- Issue #3 tenant validation is deferred for v0.2.0 in `docs/governance/tenant-validation-deferral-decision-2026-07-26.md`.
- No fiscal, legal, security, SAP trademark, SAP documentation redistribution, marketplace, client redistribution, or production-readiness approval is implied.
- Tenant-connected MCPs, hooks, production configuration, direct role/user changes, and transport actions remain blocked without separate explicit approval and environment evidence.
- The manifest addendum may be committed after the release tag because archive checksum, prerelease URL, and GitHub asset metadata are known only after packaging and prerelease creation.

### v0.2.0-rc1 Acceptance

Status: ACCEPTED for internal advisory RC use.

Acceptance record: `docs/validation/v0.2.0-rc1-acceptance.md`.

This acceptance is limited to internal advisory RC use, local workspace use, template/skill review, and fresh Codex plugin install/load evaluation. It does not approve production use, client distribution, marketplace publication, SAP tenant access, legal/fiscal conclusions, security approval, or SAP trademark/documentation redistribution.

### v0.2.0 Final Readiness

Final readiness checklist: `docs/validation/v0.2.0-final-release-readiness-checklist.md`.

Status: READY FOR FINAL PROMOTION DECISION.

Final promotion is appropriate only if the release owner confirms that final `v0.2.0` preserves the same internal advisory/source release scope and distribution limits as the accepted `v0.2.0-rc1`.

Date: 2026-07-07

Manifest refresh: 2026-07-07

## Release Identity

| Field | Value |
|---|---|
| Package | `sap-codex-deliverables` |
| Release | `v0.1.0-advisory-rc` |
| Git tag | `sap-codex-deliverables-v0.1.0` (not moved during this archive refresh) |
| Archive source commit | `f62cd38 Record SAP documentation excerpt audit` |
| Branch at archive refresh | `codex/sap-agents-framework-rc-roadmap` |
| Git status at archive creation | Clean tracked workspace before ignored archive generation; manifest updated after smoke |
| Archive | `C:\codex\SAP Agents\sap-codex-deliverables-v0.1.0.zip` |
| Archive size | `1,190,304 bytes` |
| SHA256 | `36B1F20E5A5452D41B10B972D0ABADED817EB31D860B787A0AC64786662CF42D` |

## Manifest Refresh Note

This manifest records the GPL-3.0-only advisory RC archive regenerated from commit `f62cd38` after issue #2 was closed for the public-source advisory RC GPL/provenance/notices review scope. The archive includes the SAP documentation excerpt audit available at that commit; this manifest records the later issue #2 closure note. The archive smoke test, extracted plugin validation, disabled config check, and GPL file presence check passed.

The final manifest commit may be newer than the archive source commit because the archive checksum cannot be embedded inside the same archive without changing the checksum.

## Release Decision

Status: ready for local workspace use, internal review packaging, and GPL-3.0-only public source advisory RC review.

Issue #2 is closed for the public-source advisory RC GPL/provenance/notices review scope. Issue #14 is addressed by `docs/governance/external-distribution-decision-record-2026-07-26.md`: public-source advisory release posture remains approved under `GPL-3.0-only`, while external/client distribution beyond public-source advisory review, proprietary/client packaging, marketplace publication, SAP-branded promotion, SAP documentation redistribution, tenant-connected execution, security approval, legal/tax approval, and production readiness remain blocked or deferred pending separate qualified approval.

Production or tenant-connected use remains blocked. Issue #3 tenant validation is deferred for v0.2.0 in `docs/governance/tenant-validation-deferral-decision-2026-07-26.md`; any future tenant validation requires live SAP tenant evidence, security approval, legal/tax review where relevant, and explicit human approval for tenant-impacting actions.

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
- GPL-3.0-only license file at `LICENSE`.
- GPL-3.0 release plan at `docs/governance/gpl-3-release-plan.md`.
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
Plugin validation passed: <extracted-archive-root>\plugins\sap-codex-deliverables
config example active keys: []
Release archive smoke passed.
Archive: C:\codex\SAP Agents\sap-codex-deliverables-v0.1.0.zip
SHA256: 7EE823211B620D5167A076ACE7272ADB09E68C82B4EB95BB90C522F56465985A
Workspace skills: 26
Workspace templates markdown files: 11
Workspace sample deliverable markdown files: 11
Plugin templates markdown files: 11
Plugin sample markdown files: 11
```

Post-PR #8 archive refresh result:

```text
Plugin validation passed: <extracted-archive-root>\plugins\sap-codex-deliverables
config example active keys: []
Release archive smoke passed.
Archive: C:\codex\SAP Agents\sap-codex-deliverables-v0.1.0.zip
SHA256: EA444CB94350C0C0DF1D4A4D0FDF30A5ABE28F5C440D305724041F8CBB0458E2
Workspace skills: 26
Workspace templates markdown files: 11
Workspace sample deliverable markdown files: 11
Plugin templates markdown files: 11
Plugin sample markdown files: 11
```

Post-issue #2 close archive refresh result:

```text
Plugin validation passed: <extracted-archive-root>\plugins\sap-codex-deliverables
config example active keys: []
Release archive smoke passed.
Archive: C:\codex\SAP Agents\sap-codex-deliverables-v0.1.0.zip
SHA256: 36B1F20E5A5452D41B10B972D0ABADED817EB31D860B787A0AC64786662CF42D
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
- GPL release files present in the refreshed archive: `LICENSE`, `THIRD_PARTY_NOTICES.md`, and `docs/governance/gpl-3-release-plan.md`.
- Issue #2 closed as completed for public-source advisory RC GPL/provenance/notices review scope.
- SAP documentation excerpt audit present at `docs/governance/sap-documentation-excerpt-audit.md`.
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
- Manual Codex app fresh-thread smoke for plugin-local operating-layer routing and output profiles, recorded in `docs/validation/plugin-operating-layer-app-smoke-report.md`.

## Safety Boundaries

- No live SAP BTP, Integration Suite, HANA, SAC, Datasphere, S/4HANA, BAS, or Fiori launchpad tenant validation has been performed.
- No fiscal, legal, security, SAP trademark, SAP documentation redistribution, marketplace, client redistribution, or production-readiness approval is implied.
- Tenant-connected MCPs remain blocked.
- Hooks remain disabled; `.codex/hooks.example.json` is documentation-only.
- `.codex/config.toml.example` is disabled/comment-only.
- SAP Agent Registry, routing playbooks, output profiles, client-ready samples, and controlled automation notes are advisory guidance. The refreshed archive includes both the workspace operating layer and a plugin-safe generated copy.
- Agent playbooks and output profiles are not autonomous tool-enabled agents.
- Client-ready samples are anonymized examples and require confirmed client evidence before use.
- Fictional sample deliverables must not be reused as client facts.
- `.imports` and `.tools` are local source/tooling evidence and are intentionally excluded from release packaging.

## Remaining Blockers

- Issue #2 is closed for public-source advisory RC GPL/provenance/notices review scope, but proprietary/client packaging, marketplace distribution, closed redistribution, SAP-branded promotion, or external/client distribution beyond public source review still require separate release-owner/legal/security acceptance.
- Rerun app-level plugin smoke after any archive, marketplace, plugin manifest, or operating-layer asset change before external/client distribution.
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
- `docs/validation/plugin-operating-layer-app-smoke-report.md`
- `docs/porting/full-sap-agents-coverage-plan.md`
- `docs/porting/plugin-safe-operating-layer-packaging.md`
- `docs/porting/mcp-trust-review.md`
- `docs/porting/hook-trust-windows-review.md`
- `docs/porting/upstream-mcp-security-validator-windows-path-fix.md`
