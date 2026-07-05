# Third-Party Notices

## Release License

The SAP Codex Agents Framework source release is planned under GNU General Public License v3.0 only (`GPL-3.0-only`). See `LICENSE`.

## Review Status

Initial post-RC provenance review started on 2026-07-05. See `docs/governance/third-party-provenance-review.md`.

This notice file records the current tracked-repository inventory. It is not legal advice and does not replace formal legal, contributor-rights, SAP documentation terms, marketplace, or client redistribution review.

## Included Upstream Or Third-Party Material

The following technical skills were copied into `.agents/skills` from `sap-skills-main.zip` during the Codex Windows port. Their local verification files preserve original frontmatter with `license: GPL-3.0`, maintainer `Eduard Jiglau`, maintainer email `hello@sap-ai-skills.com`, website `https://sap-ai-skills.com`, and version `2.3.2`.

| Skill | Local verification evidence | Upstream path recorded locally |
| --- | --- | --- |
| `sap-abap` | `.agents/skills/sap-abap/references/verification.md` | `plugins/sap-abap/skills/sap-abap` |
| `sap-abap-cds` | `.agents/skills/sap-abap-cds/references/verification.md` | `plugins/sap-abap-cds/skills/sap-abap-cds` |
| `sap-ai-core` | `.agents/skills/sap-ai-core/references/verification.md` | `plugins/sap-ai-core/skills/sap-ai-core` |
| `sap-btp-cloud-platform` | `.agents/skills/sap-btp-cloud-platform/references/verification.md` | `plugins/sap-btp-cloud-platform/skills/sap-btp-cloud-platform` |
| `sap-btp-connectivity` | `.agents/skills/sap-btp-connectivity/references/verification.md` | `plugins/sap-btp-connectivity/skills/sap-btp-connectivity` |
| `sap-btp-integration-suite` | `.agents/skills/sap-btp-integration-suite/references/verification.md` | `plugins/sap-btp-integration-suite/skills/sap-btp-integration-suite` |
| `sap-cap-capire` | `.agents/skills/sap-cap-capire/references/verification.md` | `plugins/sap-cap-capire/skills/sap-cap-capire` |
| `sap-dependency-security` | `.agents/skills/sap-dependency-security/references/verification.md` | `plugins/sap-dependency-security/skills/sap-dependency-security` |
| `sap-fiori-tools` | `.agents/skills/sap-fiori-tools/references/verification.md` | `plugins/sap-fiori-tools/skills/sap-fiori-tools` |
| `sap-hana-cli` | `.agents/skills/sap-hana-cli/references/verification.md` | `plugins/sap-hana-cli/skills/sap-hana-cli` |
| `sap-sqlscript` | `.agents/skills/sap-sqlscript/references/verification.md` | `plugins/sap-sqlscript/skills/sap-sqlscript` |
| `sapui5` | `.agents/skills/sapui5/references/verification.md` | `plugins/sapui5/skills/sapui5` |

The exact upstream archive URL, commit/tag, source checksum, contributor-rights chain, and upstream license text still need to be confirmed before closing issue #2.

## Repo-Authored And Local Port Material

The repository also includes local Mexbalia/Codex-authored advisory operating-layer material, including process and SAP Activate overlay skills, playbooks, output profiles, templates, samples, subagents, governance docs, validation docs, and release scripts. The 14 process/SAP Activate overlay verification files state that those skills were created locally for this Codex SAP skills port and were not copied from upstream `sap-skills-main.zip`.

These local assets are covered by the repo-level `GPL-3.0-only` source release posture, subject to owner/contributor-rights confirmation and client/NDA artifact review.

## Generated Or Packaged Copies

`plugins/sap-codex-deliverables/**` contains plugin metadata plus generated or copied package-local versions of repo-local templates, samples, and operating-layer assets. These files do not have an independent upstream license signal; they inherit the review status of their source material and must be regenerated after source changes.

## External References And Product Names

SAP product names, SAP S/4HANA process language, SAP BTP, SAP Activate, SAPUI5/OpenUI5, SAP HANA, SAP Integration Suite, SAP CAP, and related SAP documentation URLs appear as advisory references and source citations.

This notice does not confirm SAP trademark permissions, SAP documentation redistribution rights, SAP product licensing, SAP roadmap claims, tenant behavior, fiscal/legal compliance, or production readiness.

## Excluded From Public Source Release Scope

The release plan excludes `.imports/`, `.tools/`, generated `.zip` archives, local runtime configuration, environment files, keys, certificates, customer/NDA artifacts, and live SAP tenant credentials, URLs, aliases, certificates, or protected client evidence.

The tracked repository scan found no common image, office-document, executable, library-binary, or archive asset extensions in tracked files during this review.

## Current Redistribution Posture

Public source advisory RC review under `GPL-3.0-only` remains allowed by owner direction, with caveats preserved.

Proprietary client packaging, closed redistribution, marketplace publication, tenant-connected execution, production-impacting use, and client distribution beyond public source review remain blocked until the open evidence items in `docs/governance/third-party-provenance-review.md` are completed or explicitly accepted by the release owner with appropriate legal/security review.
