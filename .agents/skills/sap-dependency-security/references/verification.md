# Verification and Port Caveats

This skill was copied from plugins/sap-dependency-security/skills/sap-dependency-security in sap-skills-main.zip during the Codex Windows port.

Do not advance last_verified or present the skill as live-tenant validated unless new evidence is added. Treat the content as source-guided SAP implementation guidance until validated in the relevant SAP/BTP/SAC/HANA/S/4HANA environment.

Claude-specific frontmatter keys such as llowed-tools, plugin lifecycle hooks, MCP settings, and slash-command assumptions were not enabled for Codex in this pass. Commands from the source plugin, when copied, are reference material only.

## Original Frontmatter

``yaml
name: sap-dependency-security
description: "SAP dependency security and MCP executable trust policy with secure upgrades, cooldowns, staged rollout, and supply-chain protection. Use when upgrading deps, configuring security policies, preventing supply chain attacks, pinning SAP MCP servers, or reviewing SAP CAP/UI5/Fiori/HANA/Datasphere/SAC/BTP/ABAP dependency workflows."
license: GPL-3.0
metadata:
  maintainer: "Eduard Jiglau"
  maintainer_email: "hello@sap-ai-skills.com"
  website: "https://sap-ai-skills.com"
  version: "2.3.2"
  last_verified: "2026-06-14"
  known_issues: []
``