# Verification and Port Caveats

This skill was copied from plugins/sap-abap-cds/skills/sap-abap-cds in sap-skills-main.zip during the Codex Windows port.

Do not advance last_verified or present the skill as live-tenant validated unless new evidence is added. Treat the content as source-guided SAP implementation guidance until validated in the relevant SAP/BTP/SAC/HANA/S/4HANA environment.

Claude-specific frontmatter keys such as llowed-tools, plugin lifecycle hooks, MCP settings, and slash-command assumptions were not enabled for Codex in this pass. Commands from the source plugin, when copied, are reference material only.

## Original Frontmatter

``yaml
name: sap-abap-cds
description: "Comprehensive SAP ABAP CDS (Core Data Services) reference for data modeling, view development, and semantic enrichment. Use when creating CDS views or view entities, defining data models with annotations, working with associations and cardinality, implementing input parameters, using built-in functions, writing CASE expressions, implementing access control with DCL, handling CURR/QUAN data types, troubleshooting CDS errors, querying CDS views from ABAP, or displaying data with SALV IDA. Covers ABAP 7.4+ through ABAP Cloud."
license: GPL-3.0
metadata:
  maintainer: "Eduard Jiglau"
  maintainer_email: "hello@sap-ai-skills.com"
  website: "https://sap-ai-skills.com"
  version: "2.3.2"
  last_verified: "2026-04-02"
  abap_release: "7.4 SP8+ / 7.50+ / ABAP Cloud"
  sources:
    - "https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/abencds.html"
    - "https://github.com/SAP-samples/abap-cheat-sheets"
  keywords: [ABAP CDS, Core Data Services, CDS view, CDS view entity, define view, DDL, DCL, annotations, "@AbapCatalog", "@AccessControl", "@EndUserText", "@Semantics", "@UI", "@Consumption", "@ObjectModel", associations, cardinality, path expressions, input parameters, WITH PARAMETERS, built-in functions, CASE expression, CAST, session variables, GROUP BY, HAVING, joins, access control, DEFINE ROLE, pfcg_auth, SALV IDA, Eclipse ADT, CDS annotations, Fiori Elements, OData, RAP, currencyCode, unitOfMeasure, SD_CDS_ENTITY105]
``