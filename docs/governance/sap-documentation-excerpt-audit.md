# SAP Documentation Excerpt Audit

Date: 2026-07-07

Issue: <https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/2>

## Status

Tracked-source audit complete for public source advisory RC governance.

This audit is not legal advice and does not grant SAP documentation redistribution rights. It records whether the tracked repository appears to bundle SAP-authored documentation pages, screenshots, large excerpts, API reference dumps, or media assets that would need removal or separate permission before distribution.

## Scope

Included:

- Tracked files under `.agents/`, `docs/`, `plugins/`, `README.md`, and `THIRD_PARTY_NOTICES.md`.
- Repo metadata and governance docs that affect the public source advisory RC.

Excluded:

- `.imports/`, `.tools/`, generated `.zip` archives, local runtime files, credentials, customer/NDA artifacts, and untracked files.
- Live SAP Help Portal content, SAP product license agreements, SAP partner agreements, marketplace terms, or client-specific redistribution contracts.

## Method

The audit used local tracked-file scans for:

- SAP documentation and API reference URLs: `help.sap.com`, `api.sap.com`, `developers.sap.com`, `sapui5.hana.ondemand.com`, `github.com/SAP-docs`, `sap.github.io`, and `cap.cloud.sap`.
- SAP-owned-content signals: `Copyright SAP`, `All rights reserved`, `Terms of Use`, `Documentation Source`, `Source`, `copied from`, `derived from`, `verbatim`, `screenshot`, `logo`, `image`, `excerpt`, and common binary/media/archive extensions.
- Tracked asset paths that would indicate bundled vendor documentation or media: `docs/vendor`, `vendor/sap`, `optimizedstorySacAPI`, `*.png`, `*.jpg`, `*.jpeg`, `*.gif`, `*.svg`, `*.pdf`, `*.docx`, `*.pptx`, `*.xlsx`, and `*.zip`.

## Findings

### SAP Documentation References

The tracked repository contains many SAP documentation and SAP-docs GitHub URLs, primarily in copied technical skill references under `.agents/skills/**`.

Observed reference classes:

- SAP Help Portal links, especially ABAP, BTP, Connectivity, Integration Suite, HANA, Fiori tools, and SAP AI Core references.
- SAP Business Accelerator Hub/API links under `api.sap.com`.
- SAPUI5 Demo Kit and API links under `sapui5.hana.ondemand.com`.
- SAP-docs GitHub links for SAP AI Core, SAP BTP, BTP Connectivity, SAPUI5, and related documentation repositories.
- CAP documentation links under `cap.cloud.sap`.
- SAP-samples ABAP cheat-sheet links under `github.com/SAP-samples`.

These references are source citations and source-guided technical summaries. They are not live tenant proof, product licensing proof, SAP certification, or SAP redistribution permission.

### Bundled SAP Documentation Or Media

No tracked `docs/vendor`, `vendor/sap`, or `optimizedstorySacAPI` path was found.

No tracked binary/media/office/archive assets were found by the audited extension set: `*.png`, `*.jpg`, `*.jpeg`, `*.gif`, `*.svg`, `*.pdf`, `*.docx`, `*.pptx`, `*.xlsx`, or `*.zip`.

No tracked SAP copyright notice, SAP "all rights reserved" notice, or SAP terms-of-use grant was found by text scan.

### Direct Quote And Excerpt Signals

The scan found one short direct quote-like line in `.agents/skills/sap-ai-core/references/advanced-features.md` about AI Core Docker image responsibility. The quote is short and not a bulk documentation copy, but it should remain covered by the general source-citation and no-redistribution posture.

Other blockquotes are mostly local version notes, Codex port notices, source pointers, or advisory notes. No bulk SAP documentation page copy was identified from tracked-file signals.

### Ignored Upstream Import Risk

The ignored `.imports/` source-evidence area is not part of the public source release or distributable archive. Prior review observed upstream-only vendored documentation material in the extracted import tree. That material must remain excluded from public archives, marketplace packages, and client packages unless a separate permission/licensing basis is recorded.

## Decision

For tracked public source advisory RC scope, no immediate SAP documentation excerpt removal is required based on this audit.

The repo may continue to use SAP documentation URLs and SAP product/process terminology as source citations and advisory compatibility context, with the caveats already recorded in `THIRD_PARTY_NOTICES.md` and `docs/governance/third-party-provenance-review.md`.

## Remaining Controls

- Do not add SAP documentation pages, screenshots, large excerpts, API reference dumps, training materials, SAP logos, or SAP-authored assets to tracked source, generated archives, marketplace packages, or client packages without separate permission/licensing evidence.
- Keep `.imports/`, generated `.zip` files, local tool caches, and client/NDA artifacts excluded from public source and distributable archive scope.
- Preserve SAP trademark attribution and no-endorsement language in notices and client-facing materials.
- Run this audit again after importing upstream updates, adding new SAP technical references, changing plugin package assets, or refreshing client-facing samples.
- Obtain release-owner/legal acceptance before treating this audit as sufficient for issue #2 closure, marketplace publication, proprietary/client packaging, or external/client distribution beyond public source advisory review.
