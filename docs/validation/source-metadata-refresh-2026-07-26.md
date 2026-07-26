# Source Metadata Refresh - 2026-07-26

Tracking issue: [#1 Refresh stale SAP technical source metadata](https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/1)

Status: completed for the four over-180-day technical skills identified by `docs/validation/source-verification-audit.md`

## Scope

This refresh updates repository verification evidence for:

- `sap-btp-cloud-platform`
- `sap-btp-connectivity`
- `sap-btp-integration-suite`
- `sap-hana-cli`

The refresh does not modify runtime behavior, plugin assets, SAP tenant connections, MCP server activation, Codex hook activation, credentials, release tags, release assets, marketplace publication, client distribution, proprietary packaging, or production configuration.

## Evidence Standard

Each affected `references/verification.md` file now records:

- Claim area.
- Product or edition context.
- Authoritative source URL.
- Access date.
- Relevant source section.
- Repository file affected.
- Verification status.
- Reviewer.
- Caveats.

The original upstream `last_verified` metadata remains preserved in the copied frontmatter blocks. The Codex port source refresh date for the reviewed claim areas is 2026-07-26.

## Reviewed Sources

| Skill | Repository file affected | Source URLs | Verification status |
|---|---|---|---|
| `sap-btp-cloud-platform` | `.agents/skills/sap-btp-cloud-platform/references/verification.md` | SAP Help Portal pages for BTP environments, entitlements and quotas, Kyma instance creation, and btp CLI entitlement operations | Refreshed for advisory source guidance |
| `sap-btp-connectivity` | `.agents/skills/sap-btp-connectivity/references/verification.md` | SAP Help Portal pages for SAP BTP Connectivity overview, product page, Transparent Proxy, and Connectivity Proxy | Refreshed for advisory source guidance |
| `sap-btp-integration-suite` | `.agents/skills/sap-btp-integration-suite/references/verification.md` | SAP Help Portal pages for Integration Suite capabilities, activation, Cloud Integration, API Management, Edge Integration Cell, and Monitor | Refreshed for advisory source guidance |
| `sap-hana-cli` | `.agents/skills/sap-hana-cli/references/verification.md` | SAP Help Portal pages for SAP HANA Cloud administration, HANA Cloud CLI instance creation, HANA Cloud connectivity, HDBSQL, plus SAP-samples `hana-cli` documentation | Refreshed for advisory source guidance with sample-utility caveat |

## Final Evidence Review

No unsupported SAP roadmap, licensing, edition availability, tenant behavior, production readiness, marketplace, client distribution, or legal/tax conclusion was introduced.

The refreshed records remain source-guided references only. They do not prove that any client tenant has the relevant service plans, entitlements, subscriptions, roles, regions, connectivity paths, adapters, runtimes, credentials, data residency posture, or production approvals.

## Remaining Release Caveats

- Live SAP tenant validation remains unresolved under issue #3.
- MCP activation governance remains unresolved under issue #5.
- Codex hook runtime validation remains unresolved under issue #4.
- External/client distribution remains blocked by `docs/governance/external-distribution-decision-record-2026-07-26.md`.
- Mexico-specific scenarios involving CFDI, complementos de pago, Carta Porte, tax evidence, approval controls, and auditability remain validation topics unless supported by target-client evidence.
