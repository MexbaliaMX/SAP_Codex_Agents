# External Distribution Posture Plan

Date: 2026-07-26

Status: completed by constrained decision record; not legal approval

Tracking issue: [#14 Approve external and client distribution posture for v0.2.0](https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/14)

Decision record: `docs/governance/external-distribution-decision-record-2026-07-26.md`

## Purpose

Clarify the Phase 5 release decision path for external/client distribution, proprietary packaging, marketplace publication, SAP trademark/product-name treatment, and SAP documentation redistribution posture for v0.2.0.

This document does not grant legal approval, SAP trademark permission, SAP documentation redistribution rights, marketplace approval, client distribution approval, tenant/security approval, or production readiness.

## Confirmed Facts

- Issue #2, [Complete GPL-3.0 notices and redistribution review](https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/2), is closed.
- Issue #2 closure is narrow: public-source advisory RC GPL/provenance/notices scope only.
- Issue #2 closure caveat explicitly states that legal clearance, SAP trademark permission, SAP documentation redistribution rights, marketplace approval, proprietary/client packaging approval, tenant/security approval, and production readiness remain separate decisions.
- PR #8, [Start GPL provenance hardening](https://github.com/MexbaliaMX/SAP_Codex_Agents/pull/8), merged the initial provenance hardening work.
- The repository records `GPL-3.0-only` source posture in `LICENSE`, `docs/governance/license-review.md`, and `docs/governance/gpl-3-release-plan.md`.
- `THIRD_PARTY_NOTICES.md` records upstream provenance, SAP attribution/no-endorsement language, and redistribution caveats.
- `docs/governance/sap-documentation-excerpt-audit.md` records that no immediate tracked-source removal items were identified for the public source advisory RC scope.

## Evidence To Review

- [Issue #2 closure and comments](https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/2)
- [PR #8 provenance work](https://github.com/MexbaliaMX/SAP_Codex_Agents/pull/8)
- `LICENSE`
- `THIRD_PARTY_NOTICES.md`
- `docs/governance/license-review.md`
- `docs/governance/gpl-3-release-plan.md`
- `docs/governance/third-party-provenance-review.md`
- `docs/governance/sap-documentation-excerpt-audit.md`
- `docs/validation/final-release-manifest.md`
- `docs/validation/v0.2.0-rc1-acceptance.md`

## Decision Areas

| Area | Current posture | Required decision |
|---|---|---|
| Public-source advisory release under `GPL-3.0-only` | Supported for advisory RC scope by existing governance records | Confirm whether this remains approved for final v0.2.0. |
| External/client distribution | Not approved | Approve, conditionally approve, block, or defer. |
| Proprietary/client packaging | Blocked pending review | Approve, conditionally approve, block, or defer. |
| Marketplace publication | Not approved | Approve, conditionally approve, block, or defer. |
| SAP trademark/product-name treatment | Attribution and no-endorsement language exists | Confirm sufficiency for repository, README, plugin metadata, marketplace/client wording, and attribution placement. |
| SAP documentation redistribution/excerpts | No immediate tracked-source removal items found for advisory RC scope | Confirm sufficiency for intended distribution path. |
| Client-ready samples and SEMASS artifacts | Not finally classified for external/client distribution | Classify as fictional, authorized, excluded, or requiring further review. |

## Recommended Phase 5 Outcome

Keep issue #2 closed and use issue #14 as the active release blocker for final distribution posture.

Reason:

- Issue #2 already records GPL/provenance/notices closure for the public-source advisory RC scope.
- Reopening issue #2 would mix completed provenance work with unresolved final distribution decisions.
- Issue #14 isolates the v0.2.0 final release decision and keeps legal/release-owner approval explicit.

## Required Decision Record

Before final v0.2.0, create or update a decision record that states:

- Decision owner.
- Legal or qualified reviewer.
- Distribution paths reviewed.
- Evidence reviewed.
- Approved, conditionally approved, blocked, or deferred posture for each decision area.
- Required caveats and attribution text.
- Exclusions from distributable scope.
- Residual risks.
- Expiration or re-review trigger, if any.

## Non-Goals

- No legal approval is granted by this plan.
- No SAP trademark permission is claimed.
- No SAP documentation redistribution right is claimed.
- No marketplace publication is authorized.
- No client distribution is authorized.
- No proprietary packaging is authorized.
- No SAP tenant validation or production readiness is implied.

## Next Actions

1. Merge `docs/governance/external-distribution-decision-record-2026-07-26.md`.
2. Close issue #14 after the decision record is on `main`.
3. Continue final readiness through `docs/governance/v0.2.0-final-readiness-phase-6.md`.

## Safety Confirmation

This Phase 5 plan does not modify release tags, release assets, SAP tenant connectivity, MCP servers, Codex hooks, credentials, production configuration, role changes, transports, marketplace publication, or client distribution.
