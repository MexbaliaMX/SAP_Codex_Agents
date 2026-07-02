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