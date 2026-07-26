# v0.2.0 External Distribution Decision Record

Date: 2026-07-26

Status: approved for public-source advisory release posture only; external/client distribution remains blocked

Tracking issue: [#14 Approve external and client distribution posture for v0.2.0](https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/14)

Related plan: `docs/governance/external-distribution-posture-plan.md`

## Decision Summary

The v0.2.0 release posture is approved only for public source review and local/internal advisory use under the repository's `GPL-3.0-only` source posture.

No client distribution, proprietary packaging, marketplace publication, SAP-branded promotion, SAP documentation redistribution, tenant-connected execution, security approval, legal/tax approval, or production readiness is approved by this record.

## Decision Authority

| Role | Record |
|---|---|
| Release owner direction | Repository owner request in Codex task on 2026-07-26 to work issue #14 through an explicit distribution approval decision. |
| Legal reviewer | Not engaged in this record. Paths requiring legal approval are blocked or deferred rather than approved. |
| Qualified release review | Repository governance review against the evidence listed below. This review is not legal advice. |

## Evidence Reviewed

- [Issue #2 closure record](https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/2)
- [PR #8 GPL and provenance hardening](https://github.com/MexbaliaMX/SAP_Codex_Agents/pull/8)
- `LICENSE`
- `THIRD_PARTY_NOTICES.md`
- `docs/governance/license-review.md`
- `docs/governance/gpl-3-release-plan.md`
- `docs/governance/third-party-provenance-review.md`
- `docs/governance/sap-documentation-excerpt-audit.md`
- `docs/validation/final-release-manifest.md`
- `docs/validation/v0.2.0-rc1-acceptance.md`
- `docs/governance/external-distribution-posture-plan.md`

## Distribution Decisions

| Area | Decision | Conditions and caveats |
|---|---|---|
| Public-source advisory release under `GPL-3.0-only` | Approved | Approved for source visibility, public source review, and local/internal advisory evaluation with existing caveats preserved. |
| External/client distribution beyond public source review | Blocked | Requires separate release-owner, legal, security, SAP documentation/trademark, and client-specific review before any approval. |
| Proprietary or client-specific packaging | Blocked | GPL obligations, contributor-rights posture, client contract terms, and redistribution terms must be reviewed before any proprietary/client package is prepared. |
| Marketplace publication | Deferred and blocked | Marketplace terms, security posture, naming, trademark treatment, and package contents must be approved in a later decision record. |
| SAP trademark and product-name treatment | Conditionally accepted for repository source references only | Factual references to SAP products may remain with attribution and no-endorsement language. Promotional, marketplace, client-facing, or SAP-branded wording remains blocked pending qualified review. |
| SAP documentation redistribution and excerpts | Conditionally accepted for current tracked-source advisory scope only | The current tracked-source audit found no immediate removal items for the advisory source scope. Bundling SAP documentation pages, screenshots, API reference dumps, training materials, SAP logos, or large excerpts remains blocked without separate permission evidence. |
| Client-ready samples and SEMASS artifacts | Excluded from approved external/client distribution | Samples are examples only and must be fictional, authorized, or client-approved before client-facing use. SEMASS or customer/NDA artifacts remain out of public source, release archives, PRs, marketplace packages, and client packages unless separately authorized. |
| Tenant-connected execution, MCP activation, and hooks | Blocked | No SAP tenant, credential, MCP server, hook runtime, production configuration, role/user change, or transport action is approved. |

## Release Readiness Impact

- Issue #14 is no longer a blocker for public-source advisory release posture after this record is merged to `main`.
- Issue #14 remains a boundary record for blocked client, proprietary, marketplace, tenant-connected, and production paths.
- Final v0.2.0 readiness still depends on the remaining release backlog for tenant validation, source metadata acceptance, MCP activation governance, hook runtime validation, and final release hygiene.

## Required Follow-Up

- Keep external/client distribution blocked unless a later decision record explicitly approves it.
- Do not market this repository as SAP-certified, SAP-endorsed, marketplace-ready, client-ready, tenant-validated, or production-ready.
- Re-run package and app-level smoke tests after any runtime asset, archive, plugin manifest, marketplace, MCP, or hook behavior changes.
- Continue Phase 6 release readiness using `docs/governance/v0.2.0-final-readiness-phase-6.md`.

## Closure Criteria For Issue #14

Issue #14 may be closed after this record is merged to `main`, because each requested distribution path is explicitly classified as approved, blocked, conditionally accepted, or deferred.
