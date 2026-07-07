# License Review

Date: 2026-07-05

## Status

Owner-directed release plan: GNU General Public License v3.0 only (`GPL-3.0-only`).

Initial post-RC third-party provenance and redistribution review is recorded in `docs/governance/third-party-provenance-review.md`. Upstream repository URL confirmation for the copied technical skills is recorded as <https://github.com/secondsky/sap-skills>, pinned to commit `45073ee91a2d7fb81401c35199da32aa91e08053`.

The repository now contains a repo-level `LICENSE` with the GNU GPLv3 license text downloaded from the Free Software Foundation license URL on 2026-07-05:

- <https://www.gnu.org/licenses/gpl-3.0.txt>

This updates the release plan from "license pending" to "GPL-3.0-only source release planned." It does not replace formal legal review for third-party notices, contributor rights, SAP documentation terms, SAP trademark treatment, proprietary packaging, marketplace distribution, or client redistribution.

## Current Assets

Repository-authored assets appear to include the Codex operating-layer documentation, advisory playbooks, output profiles, validation records, roadmap, local plugin metadata, and release-hygiene scripts.

Ported or derived assets include 12 SAP technical skills copied from `sap-skills-main.zip` into `.agents/skills`. The upstream repository URL is recorded as `secondsky/sap-skills` at commit `45073ee91a2d7fb81401c35199da32aa91e08053`; the local import archive checksum and archive-content comparison are recorded in `docs/governance/third-party-provenance-review.md`. Local process and SAP Activate overlays record that they were created locally and were not copied from upstream. Packaged copies under `plugins/sap-codex-deliverables` are generated or copied from repo-local source assets.

## Third-Party And Upstream License Signals

The 12 copied technical skill verification files record `license: GPL-3.0`. The upstream repository root `LICENSE` was checked through GitHub and contains GNU GPLv3 text. The GPL-3.0-only release plan aligns the repository-level source license with those upstream license signals.

The current review confirmed the upstream repository URL and pinned source commit provenance. A 2026-07-07 scan of the pinned upstream archive found contributor-guide material but no root CLA, DCO, copyright-assignment, or contributor-license agreement file. The tracked-source SAP documentation excerpt audit in `docs/governance/sap-documentation-excerpt-audit.md` found no immediate SAP documentation removal items. Contributor-rights acceptance, SAP documentation redistribution terms, SAP trademark treatment, and compatibility between repo-authored assets, ported skill material, templates, and plugin packaging remain formal release-owner/legal decisions.

## Release Decisions

- Use `GPL-3.0-only` as the repo-level source release license.
- Include `LICENSE` in source and distributable archive scope.
- Keep SAP documentation as cited references unless separate redistribution permission is recorded.
- Preserve SAP trademark attribution and avoid SAP endorsement, certification, affiliation, logo, or ownership implications.
- Treat proprietary client packaging, private marketplace distribution, and closed redistribution as blocked until reviewed against GPL-3.0 obligations.

## Pending Decisions

- Obtain release-owner/legal acceptance of the copied-skill contributor-rights posture, or obtain independent upstream maintainer/contributor-rights confirmation beyond public GPL metadata.
- Obtain release-owner/legal acceptance of the completed SAP documentation excerpt audit and confirm whether any future SAP documentation, product names, screenshots, API snippets, or examples require additional attribution, removal, summarization, or usage limits.
- Complete SAP trademark/product-name pass for repository name, README, plugin metadata, marketplace listings, notices, and client-facing materials.
- Preserve the pinned upstream provenance record for ported or derived content and update it only with new evidence.
- Confirm whether any marketplace publication model is compatible with GPL-3.0-only distribution.
- Confirm whether client-ready samples and SEMASS discovery artifacts are fictional, authorized, or should be excluded from public/client redistribution.

## Release Treatment

This repository is suitable for planning a public source advisory RC under GPL-3.0-only.

Proprietary packaging, closed redistribution, marketplace release, external/client distribution beyond public source review, and production-governance claims remain blocked until the pending decisions above are closed or explicitly accepted by the release owner.
