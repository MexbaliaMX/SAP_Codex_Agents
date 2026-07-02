# Verification and Port Caveats

This skill was copied from plugins/sap-abap/skills/sap-abap in sap-skills-main.zip during the Codex Windows port.

Do not advance last_verified or present the skill as live-tenant validated unless new evidence is added. Treat the content as source-guided SAP implementation guidance until validated in the relevant SAP/BTP/SAC/HANA/S/4HANA environment.

Claude-specific frontmatter keys such as llowed-tools, plugin lifecycle hooks, MCP settings, and slash-command assumptions were not enabled for Codex in this pass. Commands from the source plugin, when copied, are reference material only.

## Original Frontmatter

``yaml
name: sap-abap
description: |
  Comprehensive ABAP development skill for SAP systems. Use when writing ABAP code,
  working with internal tables, structures, ABAP SQL, object-oriented programming,
  RAP (RESTful Application Programming Model), CDS views, EML statements, ABAP Cloud
  development, string processing, dynamic programming, RTTI/RTTC, field symbols,
  data references, exception handling, or ABAP unit testing. Covers both classic
  ABAP and modern ABAP for Cloud Development patterns.
license: GPL-3.0
metadata:
  maintainer: "Eduard Jiglau"
  maintainer_email: "hello@sap-ai-skills.com"
  website: "https://sap-ai-skills.com"
  version: "2.3.2"
  last_verified: "2026-04-02"
  abap_release: "7.40 SP08+ / 7.50+ / ABAP Cloud"
  sources:
    - "https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm"
    - "https://github.com/SAP-samples/abap-cheat-sheets"
``