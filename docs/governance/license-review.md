# License Review

Date: 2026-07-05

## Status

Owner-directed release plan: GNU General Public License v3.0 only (`GPL-3.0-only`).

The repository now contains a repo-level `LICENSE` with the GNU GPLv3 license text downloaded from the Free Software Foundation license URL on 2026-07-05:

- <https://www.gnu.org/licenses/gpl-3.0.txt>

This updates the release plan from "license pending" to "GPL-3.0-only source release planned." It does not replace formal legal review for third-party notices, contributor rights, SAP documentation terms, proprietary packaging, marketplace distribution, or client redistribution.

## Current Assets

Repository-authored assets appear to include the Codex operating-layer documentation, advisory playbooks, output profiles, validation records, roadmap, local plugin metadata, and release-hygiene scripts.

Ported or derived assets appear to include SAP technical skill content, reference material, templates, and command-reference files under `.agents/skills` and packaged copies under `plugins/sap-codex-deliverables`.

## Third-Party And Upstream License Signals

Several ported skill verification files record `license: GPL-3.0`. The GPL-3.0-only release plan aligns the repository-level source license with those upstream license signals.

The current review did not validate upstream repositories, exact commit provenance, contributor rights, SAP documentation terms, or compatibility between repo-authored assets, ported skill material, templates, and plugin packaging.

## Release Decisions

- Use `GPL-3.0-only` as the repo-level source release license.
- Include `LICENSE` in source and distributable archive scope.
- Treat proprietary client packaging, private marketplace distribution, and closed redistribution as blocked until reviewed against GPL-3.0 obligations.

## Pending Decisions

- Confirm whether third-party notices are required for SAP skill content, command references, templates, bundled plugin metadata, and validation scripts.
- Confirm whether any SAP documentation, product names, screenshots, API snippets, or examples require additional attribution or usage limits.
- Confirm contributor rights and exact upstream provenance for ported or derived content.
- Confirm whether any marketplace publication model is compatible with GPL-3.0-only distribution.

## Release Treatment

This repository is suitable for planning a public source advisory RC under GPL-3.0-only.

Proprietary packaging, closed redistribution, marketplace release, external/client distribution beyond public source review, and production-governance claims remain blocked until the pending decisions above are closed or explicitly accepted by the release owner.
