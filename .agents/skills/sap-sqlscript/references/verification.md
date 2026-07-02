# Verification and Port Caveats

This skill was copied from plugins/sap-sqlscript/skills/sap-sqlscript in sap-skills-main.zip during the Codex Windows port.

Do not advance last_verified or present the skill as live-tenant validated unless new evidence is added. Treat the content as source-guided SAP implementation guidance until validated in the relevant SAP/BTP/SAC/HANA/S/4HANA environment.

Claude-specific frontmatter keys such as llowed-tools, plugin lifecycle hooks, MCP settings, and slash-command assumptions were not enabled for Codex in this pass. Commands from the source plugin, when copied, are reference material only.

## Original Frontmatter

``yaml
name: sap-sqlscript
description: |
  This skill should be used when the user asks to "write a SQLScript procedure", "create HANA stored procedure", "implement AMDP method", "optimize SQLScript performance", "handle SQLScript exceptions", "debug HANA procedure", "create table function", or mentions SQLScript, SAP HANA procedures, AMDP, EXIT HANDLER, or code-to-data paradigm.

  Comprehensive SQLScript development guidance for SAP HANA database programming including syntax patterns, built-in functions, exception handling, performance optimization, cursor management, and ABAP Managed Database Procedure (AMDP) integration.
license: GPL-3.0
metadata:
  maintainer: "Eduard Jiglau"
  maintainer_email: "hello@sap-ai-skills.com"
  website: "https://sap-ai-skills.com"
  version: "2.3.2"
  last_verified: "2026-05-31"
  production_tested: "No; documentation and community references only, no live HANA runtime evidence"
  sap_hana_version: "2.0 SPS08"
  hana_cloud_version: "QRC 1/2026"
  errors_prevented: 15
``