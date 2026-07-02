# Verification and Port Caveats

This skill was copied from plugins/sap-cap-capire/skills/sap-cap-capire in sap-skills-main.zip during the Codex Windows port.

Do not advance last_verified or present the skill as live-tenant validated unless new evidence is added. Treat the content as source-guided SAP implementation guidance until validated in the relevant SAP/BTP/SAC/HANA/S/4HANA environment.

Claude-specific frontmatter keys such as llowed-tools, plugin lifecycle hooks, MCP settings, and slash-command assumptions were not enabled for Codex in this pass. Commands from the source plugin, when copied, are reference material only.

## Original Frontmatter

``yaml
name: sap-cap-capire
description: |
  SAP Cloud Application Programming Model (CAP) development skill using Capire documentation.
  Use when: building CAP applications, defining CDS models, implementing services, working with
  SAP HANA/SQLite/PostgreSQL databases, deploying to SAP BTP Cloud Foundry or Kyma, implementing
  Fiori UIs, handling authorization, multitenancy, or messaging. Covers CDL/CQL/CSN syntax,
  Node.js and Java runtimes, event handlers, OData services, and CAP plugins.
license: GPL-3.0
metadata:
  maintainer: "Eduard Jiglau"
  maintainer_email: "hello@sap-ai-skills.com"
  website: "https://sap-ai-skills.com"
  version: "2.3.2"
  last_verified: "2026-02-22"
  cap_version: "@sap/cds 9.7.x"
  mcp_version: "@cap-js/mcp-server 0.0.5"
  lsp_version: "@sap/cds-lsp 9.7.x"
``