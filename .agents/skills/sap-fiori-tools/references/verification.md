# Verification and Port Caveats

This skill was copied from plugins/sap-fiori-tools/skills/sap-fiori-tools in sap-skills-main.zip during the Codex Windows port.

Do not advance last_verified or present the skill as live-tenant validated unless new evidence is added. Treat the content as source-guided SAP implementation guidance until validated in the relevant SAP/BTP/SAC/HANA/S/4HANA environment.

Claude-specific frontmatter keys such as llowed-tools, plugin lifecycle hooks, MCP settings, and slash-command assumptions were not enabled for Codex in this pass. Commands from the source plugin, when copied, are reference material only.

## Original Frontmatter

``yaml
name: sap-fiori-tools
description: |
  Develops SAP Fiori applications using SAP Fiori tools extensions for VS Code and SAP Business Application Studio.
  Use when: generating Fiori Elements or Freestyle SAPUI5 applications, configuring Page Editor for List Report
  or Object Page, working with annotations and Service Modeler, setting up deployment to ABAP or Cloud Foundry,
  creating adaptation projects, using Guided Development, previewing with mock data or live data, configuring
  SAP Fiori launchpad, or using AI-powered generation with Project Accelerator/Joule.
  Technologies: SAP Fiori Elements, SAPUI5, OData V2/V4, CAP, SAP BTP, ABAP, Cloud Foundry, fiori-mcp-server (MCP tools for AI-assisted generation).
license: GPL-3.0
metadata:
  maintainer: "Eduard Jiglau"
  maintainer_email: "hello@sap-ai-skills.com"
  website: "https://sap-ai-skills.com"
  version: "2.3.2"
  last_verified: "2026-02-26"
``