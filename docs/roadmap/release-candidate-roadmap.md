# SAP Agents Framework Release Candidate Roadmap

Date: 2026-07-05

## Purpose

This roadmap defines the path from the current internal `v0.1.0` package to a release candidate for the SAP Agents Framework.

The current workspace is suitable for local advisory use and internal review packaging. It is not yet cleared for external, client-facing, marketplace, or tenant-connected distribution.

## Current Evidence Baseline

Confirmed local assets:

- 26 SAP skills under `.agents/skills`.
- 8 S/4HANA process advisory skills: Record-to-Report, Lead-to-Cash, Order-to-Cash, Source-to-Pay, Procure-to-Pay, Plan-to-Produce, Design-to-Operate, and Hire-to-Retire.
- 6 SAP Activate phase skills: Discover, Prepare, Explore/Fit-to-Standard, Realize, Deploy, and Run.
- 9 advisory role playbooks plus `INDEX.md` under `.agents/subagents`.
- 7 high-value routing playbooks under `.agents/playbooks`.
- 3 output profiles plus `INDEX.md` under `.agents/output-profiles`.
- 11 shared Markdown templates under `.agents/templates`.
- 8 client-ready anonymized sample files under `.agents/samples/client-ready`.
- Repo-local `sap-codex-deliverables` plugin bundle under `plugins/sap-codex-deliverables`.
- Plugin-local operating-layer assets under `plugins/sap-codex-deliverables/skills/sap-deliverable-templates/assets/operating-layer`.
- Disabled examples only for Codex config and hooks under `.codex`.
- Release archive `sap-codex-deliverables-v0.1.0.zip`, excluded by `.gitignore`.

Excluded from the public RC:

- Customer/NDA-protected test deliverables used only to validate the agents. These artifacts must not be included in the public Agent Framework repository, release archive, PR, or marketplace package.

Validation already recorded:

- Workspace skill validation passed for all 26 skills.
- Plugin validation passed for `sap-codex-deliverables`.
- Release archive smoke passed.
- Plugin operating-layer asset validation passed.
- App-level plugin smoke passed after archive regeneration.
- Full agent operating-layer forward test passed across process, Activate, technical, development, integration, go-live, and hypercare scenarios.
- Source verification audit completed with caveats preserved.

Validation not yet performed:

- Live SAP S/4HANA, BTP, Integration Suite, HANA, SAC, Datasphere, BAS, or Fiori launchpad tenant validation.
- Fiscal, legal, licensing, security, or production-readiness approval.
- Active MCP runtime smoke tests.
- Codex hook runtime tests.
- Production configuration, transport, credential, or tenant-connected execution tests.

## Release Candidate Definition

An RC is reached when the repository can be pushed to GitHub with a clean, reviewable branch and the framework can be installed or reviewed from source without implying unsupported SAP product, tenant, fiscal/legal, security, or production claims.

The RC may be labeled advisory-only if live tenant and governance approvals are still pending. External or client distribution must remain blocked until the governance gates below are closed or explicitly accepted by the release owner.

## RC Gates

| Gate | Required outcome | Evidence artifact | Status |
|---|---|---|---|
| Repository hygiene | GitHub remote configured, release branch created, unrelated local work excluded from RC commit | `git remote -v`, `git status --short --branch` | Blocked: no remote configured |
| Scope freeze | Exclude customer/NDA test deliverables from public RC scope | `.gitignore`, local Git exclude rules, roadmap scope note, PR description | Complete for current untracked files |
| Source verification | Refresh or explicitly accept stale and missing `last_verified` findings | `docs/validation/source-verification-audit.md` update or acceptance record | Open |
| Caveat discoverability | Add `references/verification.md` pointers to 14 local process/Activate overlay skills | Skill diffs plus validation result | Open |
| Governance | GPL-3.0 redistribution review completed before proprietary/client packaging | License review record | Open |
| Tenant safety | Keep MCPs, hooks, credentials, and tenant-connected execution disabled | `.codex` examples remain disabled, automation notes preserved | Partially complete |
| Release archive | Regenerate and smoke archive after final RC docs and asset changes | `docs/validation/final-release-manifest.md` and smoke output | Open after roadmap addition |
| Plugin app smoke | Rerun app-level plugin smoke after final archive or manifest changes | `docs/validation/plugin-operating-layer-app-smoke-report.md` | Open after final changes |
| GitHub publication | Push branch and open draft PR or publish initial remote branch | GitHub branch/PR URL | Blocked: no remote configured |

## Milestone Plan

### RC0: Repository Publication Readiness

Objective: make the project pushable without mixing local working artifacts into the RC scope.

Actions:

- Configure a GitHub `origin` remote or create the target repository.
- Create a release branch such as `codex/sap-agents-framework-rc-roadmap`.
- Keep customer/NDA test deliverables local-only and excluded from public RC commits.
- Stage only the roadmap and approved release-prep files.
- Preserve `.imports`, `.tools`, and `*.zip` as non-source local artifacts.

Exit criteria:

- `git status --short --branch` shows only intended RC files before staging.
- No customer/NDA files are staged, tracked, archived, or included in the PR.
- Branch can be pushed to GitHub.
- Draft PR or published branch clearly states advisory-only scope and blocked tenant-connected features.

### RC1: Evidence and Caveat Hardening

Objective: make source limits discoverable at the point of skill use.

Actions:

- Add short verification caveat pointers in the 14 local process and SAP Activate overlay `SKILL.md` files.
- Refresh or explicitly accept stale source metadata for BTP, Connectivity, Integration Suite, and HANA CLI before making client-facing platform claims.
- Recheck over-90-day ABAP, ABAP CDS, Fiori tools, and CAP metadata before release notes imply version-specific behavior.
- Keep Mexico fiscal topics, including CFDI, complementos de pago, Carta Porte, tax evidence, approvals, and auditability, as validation prompts unless authoritative client evidence is supplied.

Exit criteria:

- Source verification audit has no undisclosed caveat-discoverability gap.
- Release notes and manifest explicitly separate confirmed facts, assumptions, validation gaps, risks, and next actions.

### RC2: Package and Plugin Refresh

Objective: align repo source, generated plugin assets, release archive, and validation evidence.

Actions:

- Regenerate plugin operating-layer assets after any workspace source edits.
- Run `scripts\validate-agent-operating-layer.ps1`.
- Run `scripts\validate-plugin-operating-layer-assets.ps1`.
- Regenerate `sap-codex-deliverables-v0.1.0.zip` or choose a new RC archive name.
- Run `scripts\test-release-archive.ps1` against the final archive.
- Rerun app-level plugin smoke after archive or marketplace changes.

Exit criteria:

- Final manifest records the archive source commit, smoke results, and unresolved external-distribution blockers.
- Plugin-local assets and workspace sources are aligned.

### RC3: Governance Decision

Objective: decide the release channel and distribution constraints.

Actions:

- Complete GPL-3.0 redistribution review.
- Decide whether the RC is internal-only, GitHub-source-visible, marketplace-ready, or client-distribution-blocked.
- Confirm no tenant URLs, secrets, private user identifiers, certificate material, credential aliases, or customer/NDA test artifacts are committed.
- Document approval owners for security, legal/tax, release management, and SAP tenant validation.

Exit criteria:

- Release owner approves the channel and residual risk position.
- External or client distribution remains blocked unless the required approvals and evidence exist.

## GitHub Push Plan

Current blocker: this checkout has no configured Git remote.

Recommended path:

1. Create or choose the GitHub repository for `SAP Agents Framework`.
2. Configure `origin` with the selected repository URL.
3. Create a Codex branch from `master`.
4. Stage only the roadmap and approved RC files.
5. Commit with a terse message, for example `Add SAP Agents Framework RC roadmap`.
6. Push with upstream tracking.
7. Open a draft PR that states the framework is advisory-only and tenant-connected execution remains disabled.

Do not use `git add -A`. Customer/NDA-protected test artifacts are excluded from the public RC.

## Open Decisions

- GitHub repository owner, visibility, and remote URL.
- Whether to publish from `master` directly or through a `codex/` release branch and draft PR.
- Whether the RC version remains `v0.1.0` or moves to an `rc.1` tag/archive.
- Whether stale source metadata is refreshed now or accepted with explicit advisory-only caveats.
- Whether copied command references remain under individual skills or move to a shared prompt library.

## Recommended Next Action

Configure the GitHub remote and push a draft PR containing this roadmap and the customer/NDA exclusion guardrail as the first release-candidate planning artifact.
