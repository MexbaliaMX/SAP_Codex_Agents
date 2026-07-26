# Source Verification Audit

Date: 2026-07-03

Release hygiene update: 2026-07-05. Caveat discoverability was improved without advancing any `last_verified` dates.

Phase 6 source refresh: 2026-07-26. The four over-180-day technical skills now have refreshed Codex port source evidence in their `references/verification.md` files and in `docs/validation/source-metadata-refresh-2026-07-26.md`. Original upstream `last_verified` values remain preserved as copied-source metadata.

## Scope

This audit covers the 26 Codex workspace skills under `.agents/skills`.

Reviewed:

- Presence of `references/verification.md`.
- Presence of upstream `last_verified` metadata where available.
- Direct discoverability of verification caveats from each `SKILL.md`.

Not performed:

- Phase 6 revalidation was later performed only for the four over-180-day technical skills listed below.
- No live SAP BTP, Integration Suite, HANA, SAC, Datasphere, S/4HANA, BAS, or Fiori launchpad tenant validation.
- No original copied upstream `last_verified` dates were advanced. The Codex port refresh date for the reviewed claim areas is recorded separately as 2026-07-26.

## Audit Result

Status: suitable for local workspace use and internal review packaging with caveats preserved.

External or client-facing use remains evidence-bound. Skills with stale, missing, or audit-only metadata must be treated as source-guided guidance, not live-system proof.

Summary:

- 26 of 26 skills have `references/verification.md`.
- 12 of 26 skills preserve upstream-style `last_verified` metadata.
- 14 of 26 locally created process or SAP Activate overlay skills do not have `last_verified` metadata.
- 26 of 26 `SKILL.md` files directly reference `references/verification.md`.
- 0 of 26 `SKILL.md` files have undisclosed local caveat files.
- 4 source-copied technical skills had `last_verified` dates older than 180 days as of 2026-07-03; Phase 6 refreshed their Codex port source evidence on 2026-07-26 without changing copied upstream metadata.

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
| `sap-btp-cloud-platform` | 2025-11-27; Codex port refresh 2026-07-26 | 218 days at original audit | Refreshed for advisory source guidance | Use refreshed evidence before BTP account, entitlement, Kyma, or Cloud Foundry claims; tenant and licensing evidence still required |
| `sap-btp-connectivity` | 2025-11-27; Codex port refresh 2026-07-26 | 218 days at original audit | Refreshed for advisory source guidance | Use refreshed evidence before destination, Cloud Connector, or proxy claims; tenant, network, and security evidence still required |
| `sap-btp-integration-suite` | 2025-11-27; Codex port refresh 2026-07-26 | 218 days at original audit | Refreshed for advisory source guidance | Use refreshed evidence before Integration Suite feature or adapter claims; service-plan, capability activation, and tenant evidence still required |
| `sap-hana-cli` | 2025-11-26; Codex port refresh 2026-07-26 | 219 days at original audit | Refreshed for advisory source guidance | Distinguish SAP Help Portal HANA Cloud CLI/HDBSQL claims from SAP-samples `hana-cli` utility behavior; tenant evidence still required |

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

Release hygiene update completed on 2026-07-05: the 14 local process and SAP Activate overlay `SKILL.md` files now include a uniform `Verification Caveat` section that points to `references/verification.md`.

No `last_verified` dates were advanced. The overlay skills remain local advisory references and are not live tenant, legal, fiscal, licensing, security, or production-readiness proof.

## Release Impact

This audit does not block the current internal `v0.1.0` release package because the package already states that no live tenant, legal, fiscal, licensing, security, or production-readiness validation is implied.

Before external or client-facing distribution:

- Keep the 2026-07-26 source refresh records discoverable and recheck them before making client-specific, version-specific, licensing, roadmap, or tenant behavior claims.
- Recheck over-90-day technical skills before making version-specific claims.
- Keep the newly added caveat pointers in the 14 process and SAP Activate overlay skills discoverable during future edits.
- Keep tenant-specific, fiscal, legal, licensing, roadmap, and production claims marked as assumptions or validation gaps until evidenced.
