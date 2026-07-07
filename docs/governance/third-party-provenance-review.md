# Third-Party Provenance And Redistribution Review

Date: 2026-07-05

Issue: <https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/2>

## Status

Initial post-RC provenance review started. Contributor-rights and SAP redistribution/trademark checkpoint updated on 2026-07-07.

This document is an evidence inventory and release-governance record. It is not legal advice and does not replace formal legal, contributor-rights, SAP documentation terms, marketplace, or client redistribution review.

## Review Method

The review inspected tracked repository files, the pinned local upstream import evidence under `.imports/`, and public SAP website legal pages available on 2026-07-07. The review did not inspect SAP product license agreements, SAP partner agreements, marketplace terms, private contributor agreements, or client-specific redistribution contracts.

Evidence used:

- Root `LICENSE` contains GNU GPLv3 text for the repo-level `GPL-3.0-only` source release posture.
- Upstream repository URL confirmed on 2026-07-07: <https://github.com/secondsky/sap-skills>.
- GitHub repository metadata confirmed `secondsky/sap-skills` as a public repository with default branch `main` and clone URL `https://github.com/secondsky/sap-skills.git`.
- Upstream source ref pinned on 2026-07-07: commit `45073ee91a2d7fb81401c35199da32aa91e08053` (`Merge pull request #95 from secondsky/codex/fix-hook-packaging-portability`), archive URL <https://github.com/secondsky/sap-skills/archive/45073ee91a2d7fb81401c35199da32aa91e08053.zip>.
- Local import archive evidence: `.imports/sap-skills-main.zip`, size `15,868,913 bytes`, SHA256 `12612A25E34D823A0FC79D2E0D58119C320F25ACF274B02F980B6DD28C2EDC37`, local creation time `2026-07-01 21:12:50`, local last write time `2026-07-01 10:40:21`.
- Fresh extraction of `.imports/sap-skills-main.zip` matched the upstream commit `45073ee91a2d7fb81401c35199da32aa91e08053` archive content on 2026-07-07: 1,093 files compared, 0 path/hash differences after normalizing the generated archive root directory name. The generated zip byte hashes differ because the saved branch archive and commit archive use different root folder names and generated archive metadata.
- The already-extracted local `.imports/sap-skills-main/sap-skills-main` tree differs from the pinned upstream commit in one known local validator patch: `scripts/validate-mcp-security.mjs`, documented in `docs/porting/upstream-mcp-security-validator-windows-path-fix.md`.
- Upstream `LICENSE`, `package.json`, `skills-lock.json`, and representative copied skill blobs were compared through GitHub on 2026-07-07. Matching blob SHA examples: `LICENSE` `f288702d2fa16d3cdf0035b15a9fcbc552cd88e7`, `package.json` `2ec606bf38a9afc74da017689dd7437a171e4642`, `skills-lock.json` `30b6c70b07e5b0bf7faab501130d24b51dfb8fd0`, `plugins/sap-abap/skills/sap-abap/SKILL.md` `ac099f9849e65a5f2702a4c9f6edfa48810bf44c`, and `plugins/sap-btp-cloud-platform/skills/sap-btp-cloud-platform/SKILL.md` `ea02df57675d6c51785aa0123ddb717b06723a76`.
- Contributor-rights scan on 2026-07-07 found the pinned upstream root `LICENSE`, contributor-guide docs, and project guidance, but did not find a root `CONTRIBUTING.md`, CLA, DCO, copyright-assignment, or contributor-license agreement file in the pinned archive.
- Representative upstream copied skill frontmatter records `license: GPL-3.0`, maintainer `Eduard Jiglau`, maintainer email `hello@sap-ai-skills.com`, website `https://sap-ai-skills.com`, and version `2.3.2`.
- Public SAP Trademark page reviewed on 2026-07-07: <https://www.sap.com/about/legal/trademark.html>. SAP's page was effective 2026-01-12 at review time and allows textual SAP compatibility references within stated rules, while restricting SAP logo use, SAP marks in third-party product/service names, and endorsement/confusion.
- Public SAP Terms of Use reviewed on 2026-07-07: <https://www.sap.com/about/legal/terms-of-use.html>. The terms treat SAP website materials as limited-use SAP materials and do not provide a general right to copy, publish, redistribute, bulk download, cache, or repackage SAP documentation.
- SAP documentation excerpt audit completed on 2026-07-07 in `docs/governance/sap-documentation-excerpt-audit.md`. Tracked-source scan found SAP documentation URLs and source-guided summaries, but no tracked `docs/vendor` SAP documentation copy, SAP-authored binary/media/archive asset, large excerpt/API dump signal, or SAP logo/media asset by the audited patterns.
- `.agents/skills/*/references/verification.md` records whether each skill was copied from `sap-skills-main.zip` or created locally.
- `docs/validation/source-verification-audit.md` records stale, missing, and audit-only source-verification caveats.
- `scripts/port-priority-skills.ps1` records the Codex port source path pattern for copied priority skills.
- `scripts/create-phase2-overlays.ps1` records the local overlay generation language for process and SAP Activate skills.
- `git ls-files` found no tracked archive, image, office document, executable, or library binary asset by common extensions.

## Asset Classes

| Asset class | Repository scope | Provenance signal | Redistribution posture |
| --- | --- | --- | --- |
| Repo-authored governance, roadmap, validation, packaging, and release scripts | `README.md`, `docs/**`, `scripts/**`, `.github/**`, root metadata | Created in this Codex port during release hygiene and packaging work | Covered by repo-level `GPL-3.0-only` posture, subject to contributor-rights confirmation |
| Local SAP process, SAP Activate, playbook, template, sample, subagent, registry, and output-profile assets | `.agents/AGENT_REGISTRY.md`, `.agents/playbooks/**`, `.agents/output-profiles/**`, `.agents/templates/**`, `.agents/samples/**`, `.agents/subagents/**`, 14 process/SAP Activate overlay skills | Local Mexbalia/Codex port content; overlay verification files state they were not copied from upstream `sap-skills-main.zip` | Covered by repo-level `GPL-3.0-only` posture, subject to owner/contributor confirmation and client-data checks |
| Copied SAP technical skills | 12 skills listed below under `.agents/skills/**` | Verification files state the skills were copied from `plugins/<skill>/skills/<skill>` in `sap-skills-main.zip`; upstream repository URL confirmed as `secondsky/sap-skills`; source ref pinned to commit `45073ee91a2d7fb81401c35199da32aa91e08053`; original frontmatter records `license: GPL-3.0` | Compatible with repo-level GPL-3.0-only planning based on local and upstream metadata, but contributor-rights chain still needs confirmation before issue closure |
| Packaged plugin copies | `plugins/sap-codex-deliverables/**` | Generated or copied from repo-local templates, samples, and operating-layer files | No independent license signal; must stay aligned with source files and remain advisory-only until marketplace/client redistribution review is complete |
| External SAP documentation and product references | URLs and product names embedded in skill references and docs | Source citations and product terminology; not bundled binary/media assets; no tracked `docs/vendor` SAP documentation copy or common media/archive asset was found in tracked source scope | Evidence references only; no SAP documentation redistribution right, SAP endorsement, SAP certification, SAP logo permission, product licensing claim, or tenant behavior proof is confirmed |
| Local imports, tool binaries, archives, credentials, and customer/NDA artifacts | `.imports/`, `.tools/`, `*.zip`, `.env*`, keys/certificates, private/customer/NDA deliverables | Excluded by `.gitignore` and release-plan scope | Not part of public source release or distributable archive scope |

## Copied Technical Skills

The following copied skills preserve an upstream-style `license: GPL-3.0` signal in their `references/verification.md` original frontmatter block:

| Skill | Verification file | Local provenance signal | Last-verified signal |
| --- | --- | --- | --- |
| `sap-abap` | `.agents/skills/sap-abap/references/verification.md` | Copied from `plugins/sap-abap/skills/sap-abap` in `sap-skills-main.zip` | `2026-04-02` |
| `sap-abap-cds` | `.agents/skills/sap-abap-cds/references/verification.md` | Copied from `plugins/sap-abap-cds/skills/sap-abap-cds` in `sap-skills-main.zip` | `2026-04-02` |
| `sap-ai-core` | `.agents/skills/sap-ai-core/references/verification.md` | Copied from `plugins/sap-ai-core/skills/sap-ai-core` in `sap-skills-main.zip` | `2026-06-12` |
| `sap-btp-cloud-platform` | `.agents/skills/sap-btp-cloud-platform/references/verification.md` | Copied from `plugins/sap-btp-cloud-platform/skills/sap-btp-cloud-platform` in `sap-skills-main.zip` | `2025-11-27` |
| `sap-btp-connectivity` | `.agents/skills/sap-btp-connectivity/references/verification.md` | Copied from `plugins/sap-btp-connectivity/skills/sap-btp-connectivity` in `sap-skills-main.zip` | `2025-11-27` |
| `sap-btp-integration-suite` | `.agents/skills/sap-btp-integration-suite/references/verification.md` | Copied from `plugins/sap-btp-integration-suite/skills/sap-btp-integration-suite` in `sap-skills-main.zip` | `2025-11-27` |
| `sap-cap-capire` | `.agents/skills/sap-cap-capire/references/verification.md` | Copied from `plugins/sap-cap-capire/skills/sap-cap-capire` in `sap-skills-main.zip` | `2026-02-22` |
| `sap-dependency-security` | `.agents/skills/sap-dependency-security/references/verification.md` | Copied from `plugins/sap-dependency-security/skills/sap-dependency-security` in `sap-skills-main.zip` | `2026-06-14` |
| `sap-fiori-tools` | `.agents/skills/sap-fiori-tools/references/verification.md` | Copied from `plugins/sap-fiori-tools/skills/sap-fiori-tools` in `sap-skills-main.zip` | `2026-02-26` |
| `sap-hana-cli` | `.agents/skills/sap-hana-cli/references/verification.md` | Copied from `plugins/sap-hana-cli/skills/sap-hana-cli` in `sap-skills-main.zip` | `2025-11-26` |
| `sap-sqlscript` | `.agents/skills/sap-sqlscript/references/verification.md` | Copied from `plugins/sap-sqlscript/skills/sap-sqlscript` in `sap-skills-main.zip` | `2026-05-31` |
| `sapui5` | `.agents/skills/sapui5/references/verification.md` | Copied from `plugins/sapui5/skills/sapui5` in `sap-skills-main.zip` | `2026-05-31` |

## Local Overlay Skills

The following 14 process and SAP Activate overlay skills record that they were created locally for the Mexbalia Codex SAP skills port and were not copied from upstream `sap-skills-main.zip`:

- `sap-activate-deploy`
- `sap-activate-discover`
- `sap-activate-explore-fit-to-standard`
- `sap-activate-prepare`
- `sap-activate-realize`
- `sap-activate-run`
- `sap-process-design-to-operate`
- `sap-process-hire-to-retire`
- `sap-process-lead-to-cash`
- `sap-process-order-to-cash`
- `sap-process-plan-to-produce`
- `sap-process-procure-to-pay`
- `sap-process-record-to-report`
- `sap-process-source-to-pay`

These overlays are advisory references only. They do not provide live SAP tenant validation, fiscal/legal approval, licensing approval, security approval, or production-readiness approval.

## Initial Findings

- The repo-level public source posture is consistently `GPL-3.0-only`.
- The copied technical-skill license signal is internally consistent with GPL-3.0-only planning, and the upstream repository root `LICENSE` is GNU GPLv3 text.
- The tracked repository does not include common binary/media/office/archive artifacts that would need separate asset license treatment.
- The upstream repository URL, exact source commit ref, source archive URL, and local import archive checksum are now recorded. Contributor-rights evidence is limited to the public GPL repository signals and copied frontmatter; no separate contributor-rights chain was confirmed.
- SAP documentation URLs and product names are used as citations and terminology, not as proof of permission to redistribute SAP documentation excerpts or make product, licensing, tenant, roadmap, endorsement, certification, or compliance claims. The tracked-source SAP documentation excerpt audit did not identify immediate removal items, but legal/owner acceptance remains required before broader distribution.
- Packaged plugin assets are generated copies of repo-local content and need regeneration after source changes; they do not remove the need for GPL and marketplace/client redistribution review.

## Contributor-Rights And SAP Redistribution/Trademark Checkpoint

Checkpoint date: 2026-07-07.

Contributor-rights evidence found:

- Upstream source is pinned to `secondsky/sap-skills` commit `45073ee91a2d7fb81401c35199da32aa91e08053`.
- Upstream root `LICENSE` contains GNU GPLv3 text.
- Copied technical skill frontmatter preserves `license: GPL-3.0` and maintainer metadata.
- The pinned upstream archive includes contributor-guide material, but local scan did not find a root CLA, DCO, copyright-assignment, or contributor-license agreement file.

Contributor-rights decision:

- Public-source GPL planning can rely on the recorded upstream public GPL signals as a release-owner checkpoint.
- Issue #2 cannot be fully closed on contributor-rights until the release owner accepts those public signals as sufficient or obtains independent upstream maintainer/contributor-rights confirmation.

SAP redistribution/trademark evidence found:

- SAP trademark guidance allows textual compatibility references to SAP offerings when the third-party material is clear about the relationship and does not imply bundled offering, sponsorship, affiliation, certification, approval, or endorsement.
- SAP trademark guidance restricts SAP logo use and inclusion of SAP marks or SAP offering names in third-party company, product, service, slogan, domain, logo, or confusing social account names without permission.
- SAP trademark guidance requires correct trademark spelling/capitalization, first-use symbol/descriptor treatment where practical, and a trademark attribution statement in materials that mention SAP trademarks.
- SAP Terms of Use do not provide general permission to copy, publish, redistribute, bulk download, cache, or repackage SAP website materials.
- Tracked-source audit found no SAP-authored binary/media/archive assets and no tracked `docs/vendor` SAP documentation copy.

SAP redistribution/trademark decision:

- Tracked repo content may continue as advisory public-source material that cites SAP documentation by URL and uses SAP product/process terminology for compatibility/advisory context.
- Do not bundle SAP documentation pages, screenshots, large excerpts, API reference dumps, training materials, SAP logos, or SAP-authored assets into public archives, marketplace packages, or client packages unless a separate permission/licensing basis is recorded.
- Treat the current project and marketplace naming as requiring a trademark pass before external promotion. Prefer relationship-clear phrasing such as "for SAP advisory work" or "compatible with SAP software contexts" over names or descriptions that could imply SAP ownership, certification, partnership, or endorsement.
- Add and preserve SAP trademark attribution in notices and client-facing materials that mention SAP marks.

## Redistribution Decision Record

| Distribution path | Current decision |
| --- | --- |
| Public source advisory RC under `GPL-3.0-only` | Allowed as owner-directed source release posture, with contributor-rights and SAP trademark/documentation caveats preserved |
| Local advisory use from source | Allowed, advisory-only |
| Generated archive for public source review | Allowed only when regenerated from a clean tracked commit and smoke-tested with `LICENSE`, `THIRD_PARTY_NOTICES.md`, and governance docs included |
| Proprietary/client packaging | Blocked pending formal GPL obligations, contributor-rights acceptance, SAP documentation/trademark review, and client/NDA artifact review |
| Marketplace publication | Blocked pending marketplace terms, plugin policy, GPL obligations, SAP trademark/documentation treatment, naming review, and security approval |
| Tenant-connected or production-impacting use | Blocked pending tenant/security approval and environment evidence |

## Evidence Still Required To Close Issue #2

- Obtain release-owner/legal acceptance of the copied-skill contributor-rights posture, or obtain independent upstream maintainer/contributor-rights confirmation beyond public GPL metadata.
- Obtain release-owner/legal acceptance of the completed SAP documentation excerpt audit and preserve the no-bundled-SAP-documentation control for future imports, archive refreshes, marketplace packages, and client packages.
- Complete SAP trademark and product-name treatment for public, marketplace, and client-facing distribution, including attribution statement placement and relationship-clear naming.
- Confirm whether plugin packaging and any marketplace distribution model are compatible with `GPL-3.0-only`.
- Confirm whether client-ready samples and SEMASS discovery artifacts are fictional, authorized, or should be excluded from public/client redistribution.
- Regenerate and smoke-test any distributable archive after governance or notice changes are committed.
