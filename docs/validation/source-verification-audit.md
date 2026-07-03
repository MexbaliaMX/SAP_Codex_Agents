# Source Verification Audit

Date: 2026-07-03

## Scope

This audit covers the 26 Codex workspace skills under `.agents/skills`.

Reviewed:

- Presence of `references/verification.md`.
- Presence of upstream `last_verified` metadata where available.
- Direct discoverability of verification caveats from each `SKILL.md`.

Not performed:

- No SAP Help Portal, API, roadmap, licensing, or product behavior revalidation.
- No live SAP BTP, Integration Suite, HANA, SAC, Datasphere, S/4HANA, BAS, or Fiori launchpad tenant validation.
- No `last_verified` dates were advanced.

## Audit Result

Status: suitable for local workspace use and internal review packaging with caveats preserved.

External or client-facing use remains evidence-bound. Skills with stale, missing, or audit-only metadata must be treated as source-guided guidance, not live-system proof.

Summary:

- 26 of 26 skills have `references/verification.md`.
- 12 of 26 skills preserve upstream-style `last_verified` metadata.
- 14 of 26 locally created process or SAP Activate overlay skills do not have `last_verified` metadata.
- 12 of 26 `SKILL.md` files directly reference `references/verification.md`.
- 14 of 26 `SKILL.md` files have caveat files but do not directly point readers to them.
- 4 source-copied technical skills have `last_verified` dates older than 180 days as of 2026-07-03.

## Dated Verification Inventory

| Skill | Last verified | Age on 2026-07-03 | Audit status | Release treatment |
|---|---:|---:|---|---|
| `sap-dependency-security` | 2026-06-14 | 19 days | Recent source metadata | Source-guided; no production approval implied |
| `sap-ai-core` | 2026-06-12 | 21 days | Recent source metadata; runtime verification pending | Tenant/model catalog claims require target-tenant evidence |
| `sapui5` | 2026-05-31 | 33 days | Recent source metadata | Source-guided; no launchpad or BAS tenant proof |
| `sap-sqlscript` | 2026-05-31 | 33 days | Recent source metadata | Source-guided; no HANA tenant proof |
| `sap-abap` | 2026-04-02 | 92 days | Watch; over 90 days | Recheck before client-facing platform/version claims |
| `sap-abap-cds` | 2026-04-02 | 92 days | Watch; over 90 days | Recheck before client-facing platform/version claims |
| `sap-fiori-tools` | 2026-02-26 | 127 days | Watch; over 90 days | Recheck before client-facing tool/version claims |
| `sap-cap-capire` | 2026-02-22 | 131 days | Watch; over 90 days | Recheck before client-facing CAP/runtime claims |
| `sap-btp-cloud-platform` | 2025-11-27 | 218 days | Stale; over 180 days | Refresh sources before BTP account, entitlement, Kyma, or Cloud Foundry claims |
| `sap-btp-connectivity` | 2025-11-27 | 218 days | Stale; over 180 days | Refresh sources before destination, Cloud Connector, or proxy claims |
| `sap-btp-integration-suite` | 2025-11-27 | 218 days | Stale; over 180 days | Refresh sources before Integration Suite feature, adapter, or licensing claims |
| `sap-hana-cli` | 2025-11-26 | 219 days | Stale; over 180 days | Refresh sources before HANA CLI/runtime behavior claims |

## Missing Date Inventory

These skills have `references/verification.md` caveats but no `last_verified` date. They were created locally for the Mexbalia Codex SAP skills port and were not copied from upstream `sap-skills-main.zip`.

| Skill | Verification status | Release treatment |
|---|---|---|
| `sap-activate-deploy` | Local overlay; no upstream `last_verified` | Advisory only; validate against SAP Activate/current project evidence |
| `sap-activate-discover` | Local overlay; no upstream `last_verified` | Advisory only; validate against SAP Activate/current project evidence |
| `sap-activate-explore-fit-to-standard` | Local overlay; no upstream `last_verified` | Advisory only; validate against SAP Activate/current project evidence |
| `sap-activate-prepare` | Local overlay; no upstream `last_verified` | Advisory only; validate against SAP Activate/current project evidence |
| `sap-activate-realize` | Local overlay; no upstream `last_verified` | Advisory only; validate against SAP Activate/current project evidence |
| `sap-activate-run` | Local overlay; no upstream `last_verified` | Advisory only; validate against SAP Activate/current project evidence |
| `sap-process-design-to-operate` | Local overlay; no upstream `last_verified` | Advisory only; validate against target process design and tenant evidence |
| `sap-process-hire-to-retire` | Local overlay; no upstream `last_verified` | Advisory only; validate against target process design and tenant evidence |
| `sap-process-lead-to-cash` | Local overlay; no upstream `last_verified` | Advisory only; validate against target process design and tenant evidence |
| `sap-process-order-to-cash` | Local overlay; no upstream `last_verified` | Advisory only; validate against target process design, CFDI, and fiscal evidence where relevant |
| `sap-process-plan-to-produce` | Local overlay; no upstream `last_verified` | Advisory only; validate against target process design and tenant evidence |
| `sap-process-procure-to-pay` | Local overlay; no upstream `last_verified` | Advisory only; validate against target process design, CFDI, payment, and fiscal evidence where relevant |
| `sap-process-record-to-report` | Local overlay; no upstream `last_verified` | Advisory only; validate against close, audit, fiscal, and tenant evidence |
| `sap-process-source-to-pay` | Local overlay; no upstream `last_verified` | Advisory only; validate against target process design and procurement governance evidence |

## Caveat Discoverability

The following 14 skills have verification caveat files but their `SKILL.md` files do not directly reference `references/verification.md`:

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

Recommended follow-up: add a short `SKILL.md` note to each overlay skill pointing to `references/verification.md`, without changing behavior or advancing verification dates.

## Release Impact

This audit does not block the current internal `v0.1.0` release package because the package already states that no live tenant, legal, fiscal, licensing, security, or production-readiness validation is implied.

Before external or client-facing distribution:

- Refresh SAP source references for the four skills older than 180 days.
- Recheck over-90-day technical skills before making version-specific claims.
- Add discoverability pointers for the 14 process and SAP Activate overlay caveat files.
- Keep tenant-specific, fiscal, legal, licensing, roadmap, and production claims marked as assumptions or validation gaps until evidenced.

