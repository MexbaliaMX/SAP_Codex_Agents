# Verification and Port Caveats

This skill was copied from plugins/sap-hana-cli/skills/sap-hana-cli in sap-skills-main.zip during the Codex Windows port.

Do not advance last_verified or present the skill as live-tenant validated unless new evidence is added. Treat the content as source-guided SAP implementation guidance until validated in the relevant SAP/BTP/SAC/HANA/S/4HANA environment.

Claude-specific frontmatter keys such as llowed-tools, plugin lifecycle hooks, MCP settings, and slash-command assumptions were not enabled for Codex in this pass. Commands from the source plugin, when copied, are reference material only.

## Original Frontmatter

``yaml
name: sap-hana-cli
description: |
  Assists with SAP HANA Developer CLI (hana-cli) for database development and administration.
  Use when: installing hana-cli, connecting to SAP HANA databases, inspecting database objects
  (tables, views, procedures, functions), managing HDI containers, executing SQL queries,
  converting metadata to CDS/EDMX/OpenAPI formats, managing SAP HANA Cloud instances,
  working with BTP CLI integration, or troubleshooting hana-cli commands.
  Covers: 91 commands, 17+ output formats, HDI container management, cloud operations.
license: GPL-3.0
metadata:
  maintainer: "Eduard Jiglau"
  maintainer_email: "hello@sap-ai-skills.com"
  website: "https://sap-ai-skills.com"
  version: "2.3.2"
  last_verified: "2025-11-26"
``