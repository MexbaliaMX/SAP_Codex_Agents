# Verification and Port Caveats

This skill was copied from plugins/sap-btp-integration-suite/skills/sap-btp-integration-suite in sap-skills-main.zip during the Codex Windows port.

Do not advance last_verified or present the skill as live-tenant validated unless new evidence is added. Treat the content as source-guided SAP implementation guidance until validated in the relevant SAP/BTP/SAC/HANA/S/4HANA environment.

Claude-specific frontmatter keys such as llowed-tools, plugin lifecycle hooks, MCP settings, and slash-command assumptions were not enabled for Codex in this pass. Commands from the source plugin, when copied, are reference material only.

## Original Frontmatter

``yaml
name: sap-btp-integration-suite
description: "Enterprise integration solutions using SAP Integration Suite on BTP. Covers Cloud Integration (iFlows), API Management, Event Mesh, Edge Integration Cell, Integration Advisor, Trading Partner Management, and Migration Assessment. Use for building integration flows, managing API proxies, event-driven architectures, B2B/EDI integrations, hybrid deployments, adapter configuration, Groovy/JavaScript message processing, and troubleshooting."


license: GPL-3.0
metadata:
  maintainer: "Eduard Jiglau"
  maintainer_email: "hello@sap-ai-skills.com"
  website: "https://sap-ai-skills.com"
  version: "2.3.2"
  last_verified: 2025-11-27
  documentation_source: "https://github.com/SAP-docs/sap-btp-integration-suite"
  sap_help_portal: "https://help.sap.com/docs/integration-suite"
  status: production
  keywords: [sap integration suite, cloud integration, cpi, iflow, api management, apim, event mesh, edge integration cell, integration advisor, trading partner management, b2b integration, edi integration, migration assessment, graph, odata provisioning, message mapping, groovy script, adapter configuration, sftp adapter, http adapter, odata adapter, rfc adapter, amqp adapter, kafka adapter, jms queue, data store, idempotent processing]

allowed-tools:
  - Read
  - Bash
  - Glob
  - Grep
  - WebFetch
  - WebSearch
``

## Phase 6 Source Refresh - 2026-07-26

Codex port verification status: refreshed for public-source advisory use on 2026-07-26.

Reviewer: Codex repository governance pass for issue #1. This is not SAP tenant validation, legal review, licensing approval, security approval, production readiness, or client distribution approval.

| Claim area | Product / edition context | Authoritative source URL | Access date | Relevant source section | Verification status | Caveats |
|---|---|---|---|---|---|---|
| Integration Suite capability inventory | SAP Integration Suite | https://help.sap.com/docs/SAP_INTEGRATION_SUITE/sap-integration-suite/capabilities | 2026-07-26 | `Capabilities of SAP Integration Suite` | Verified for advisory source guidance | Capability availability depends on service plan, activation, role collections, region, tenant configuration, and SAP terms. |
| Capability activation and role prerequisites | SAP Integration Suite tenant administration | https://help.sap.com/docs/integration-suite/sap-integration-suite/activating-and-managing-capabilities | 2026-07-26 | `Prerequisites`, `Context`, and capability activation table | Verified for advisory source guidance | Do not infer that a tenant has Cloud Integration, API Management, Event Mesh, Trading Partner Management, or other capabilities activated. |
| Cloud Integration scope and adapters | SAP Integration Suite, Cloud Integration | https://help.sap.com/docs/integration-suite/sap-integration-suite/introduction | 2026-07-26 | `Introduction` and `Kind of Systems to Connect to Cloud Integration` | Verified for advisory source guidance | Adapter support must be checked against the active tenant, licensing, connectivity, and security controls before implementation. |
| API Management scope and runtimes | SAP Integration Suite, API Management | https://help.sap.com/docs/integration-suite/isuite-integrations-and-apis/api-management | 2026-07-26 | `API Management` and `API Management Runtimes` | Verified for advisory source guidance | Runtime choice and feature availability require tenant evidence and service-plan review. No API proxy was created or deployed. |
| Edge Integration Cell positioning | SAP Integration Suite, Edge Integration Cell | https://help.sap.com/docs/integration-suite/sap-integration-suite/what-is-sap-integration-suite-edge-integration-cell | 2026-07-26 | `What Is Edge Integration Cell` | Verified for advisory source guidance | Hybrid runtime use requires separate security, infrastructure, licensing, and operations approval. |
| Monitoring surface | SAP Integration Suite | https://help.sap.com/docs/integration-suite/sap-integration-suite/monitor | 2026-07-26 | `Monitor` | Verified for advisory source guidance | Monitoring claims are UI/documentation guidance only. No tenant monitoring evidence was collected. |

Port treatment: the original upstream `last_verified` value is preserved above as copied-source metadata. The Codex port source refresh date for these claim areas is 2026-07-26.
