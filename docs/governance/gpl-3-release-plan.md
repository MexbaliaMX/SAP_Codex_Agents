# GPL-3.0 Release Plan

Date: 2026-07-05

## Release Intent

Release the SAP Codex Agents Framework source under GNU General Public License v3.0 only, using SPDX identifier `GPL-3.0-only`.

The repository now includes the canonical GPLv3 license text in `LICENSE`, downloaded from the Free Software Foundation license URL:

- <https://www.gnu.org/licenses/gpl-3.0.txt>

## Release Scope

The GPL-3.0-only release applies to source content intended for the public advisory RC repository, including:

- SAP advisory skills and local overlays under `.agents/skills`.
- Operating-layer references, playbooks, output profiles, templates, samples, and registry files.
- Repo-local plugin source under `plugins/sap-codex-deliverables`.
- Validation scripts, packaging scripts, roadmap, governance notes, and release hygiene documentation.

Excluded from the public GPL-3.0-only release:

- `.imports/`, `.tools/`, generated `.zip` archives, local runtime config, environment files, keys, certificates, and customer/NDA artifacts.
- Any live SAP tenant credentials, URLs, certificates, aliases, or protected client evidence.

## Required Release Steps

1. Keep `LICENSE` at the repository root with the unmodified GNU GPLv3 license text.
2. Add the release note phrase: `Licensed under GNU General Public License v3.0 only (GPL-3.0-only).`
3. Keep `THIRD_PARTY_NOTICES.md` and `docs/governance/third-party-provenance-review.md` current for ported or derived SAP skill/reference material.
4. Confirm every distributable archive includes `LICENSE`, `THIRD_PARTY_NOTICES.md`, `docs/governance/license-review.md`, and `docs/governance/third-party-provenance-review.md`.
5. Regenerate and smoke-test the release archive after the licensing files are committed.
6. Keep proprietary client packaging, private marketplace distribution, and closed redistribution blocked unless reviewed against GPL-3.0 obligations.

## Continuing Caveats

This GPL-3.0-only release plan does not provide live SAP tenant validation, legal/tax approval, security approval, production readiness, marketplace approval, or permission to enable MCP servers or hooks.

Human approval remains required before any production-impacting configuration, security, integration, architecture, tenant-connected automation, or client distribution decision.
