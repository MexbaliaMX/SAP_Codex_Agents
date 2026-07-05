# Third-Party Provenance And Redistribution Review

Date: 2026-07-05

Issue: <https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/2>

## Status

Initial post-RC provenance review started.

This document is an evidence inventory and release-governance record. It is not legal advice and does not replace formal legal, contributor-rights, SAP documentation terms, marketplace, or client redistribution review.

## Review Method

The review inspected tracked repository files only, using local Git and text scans. The review did not inspect untracked imports, upstream repositories, SAP Help Portal terms, SAP product license agreements, marketplace terms, or contributor agreements.

Evidence used:

- Root `LICENSE` contains GNU GPLv3 text for the repo-level `GPL-3.0-only` source release posture.
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
| Copied SAP technical skills | 12 skills listed below under `.agents/skills/**` | Verification files state the skills were copied from `plugins/<skill>/skills/<skill>` in `sap-skills-main.zip`; original frontmatter records `license: GPL-3.0` | Compatible with repo-level GPL-3.0-only planning based on local metadata, but exact upstream source URL, commit/tag, contributor rights, and license text still need confirmation before issue closure |
| Packaged plugin copies | `plugins/sap-codex-deliverables/**` | Generated or copied from repo-local templates, samples, and operating-layer files | No independent license signal; must stay aligned with source files and remain advisory-only until marketplace/client redistribution review is complete |
| External SAP documentation and product references | URLs and product names embedded in skill references and docs | Source citations and product terminology; not bundled binary/media assets | Evidence references only; SAP documentation terms, trademark use, screenshots, API snippets, and product/license claims require separate review before stronger distribution or client claims |
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
- The copied technical-skill license signal is internally consistent with GPL-3.0-only planning.
- The tracked repository does not include common binary/media/office/archive artifacts that would need separate asset license treatment.
- The exact upstream `sap-skills-main.zip` source URL, commit/tag, checksum, and contributor-rights chain are not recorded in tracked files.
- SAP documentation URLs and product names are used as citations and terminology, not as proof of permission to redistribute SAP documentation excerpts or make product, licensing, tenant, roadmap, or compliance claims.
- Packaged plugin assets are generated copies of repo-local content and need regeneration after source changes; they do not remove the need for GPL and marketplace/client redistribution review.

## Redistribution Decision Record

| Distribution path | Current decision |
| --- | --- |
| Public source advisory RC under `GPL-3.0-only` | Allowed as owner-directed source release posture, with caveats preserved |
| Local advisory use from source | Allowed, advisory-only |
| Generated archive for public source review | Allowed only when regenerated from a clean tracked commit and smoke-tested with `LICENSE`, `THIRD_PARTY_NOTICES.md`, and governance docs included |
| Proprietary/client packaging | Blocked pending formal GPL obligations, contributor-rights, SAP documentation terms, and client/NDA artifact review |
| Marketplace publication | Blocked pending marketplace terms, plugin policy, GPL obligations, SAP trademark/documentation review, and security approval |
| Tenant-connected or production-impacting use | Blocked pending tenant/security approval and environment evidence |

## Evidence Still Required To Close Issue #2

- Record upstream `sap-skills-main.zip` origin URL, version/tag/commit, source checksum, and retrieval date.
- Confirm copied-skill license text and contributor-rights chain from the upstream source, not only local frontmatter.
- Confirm whether SAP documentation-derived reference material requires additional attribution, removal, summarization, or usage limits.
- Confirm SAP trademark and product-name treatment for public, marketplace, and client-facing distribution.
- Confirm whether plugin packaging and any marketplace distribution model are compatible with `GPL-3.0-only`.
- Confirm whether client-ready samples and SEMASS discovery artifacts are fictional, authorized, or should be excluded from public/client redistribution.
- Regenerate and smoke-test any distributable archive after governance or notice changes are committed.
