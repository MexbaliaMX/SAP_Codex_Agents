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

## Phase 6 Source Refresh - 2026-07-26

Codex port verification status: refreshed for public-source advisory use on 2026-07-26.

Reviewer: Codex repository governance pass for issue #1. This is not SAP tenant validation, legal review, licensing approval, security approval, production readiness, or client distribution approval.

Important distinction: this skill covers the open-source/sample `hana-cli` utility from SAP-samples documentation and also references official SAP HANA Cloud command-line concepts where applicable. Do not present `hana-cli` package behavior as SAP Help Portal product behavior unless the claim is separately supported by SAP Help, SAP documentation, or target-environment evidence.

| Claim area | Product / edition context | Authoritative source URL | Access date | Relevant source section | Verification status | Caveats |
|---|---|---|---|---|---|---|
| SAP HANA Cloud administration and command-line instance operations | SAP HANA Cloud, SAP HANA database | https://help.sap.com/docs/HANA_CLOUD/9ae9104a46f74a6583ce5182e7fb20cb | 2026-07-26 | `SAP HANA Cloud Administration Guide` | Verified for advisory source guidance | SAP Help documentation covers SAP HANA Cloud administration, not every `hana-cli` utility command in this skill. |
| Creating and managing SAP HANA Cloud database instances with CLI | SAP HANA Cloud, SAP HANA database | https://help.sap.com/docs/hana-cloud/sap-hana-cloud-administration-guide/create-sap-hana-database-instance-using-cli | 2026-07-26 | `Create an SAP HANA Database Instance Using the CLI` | Verified for advisory source guidance | Instance creation requires authorized SAP BTP/SAP HANA Cloud access, approved parameters, and credential handling controls. No instance action was performed. |
| SAP HANA database connection guidance | SAP HANA Cloud, SAP HANA database and SAP HANA client | https://help.sap.com/docs/hana-cloud/sap-hana-cloud-getting-started-guide/connecting-to-sap-hana-database-in-sap-hana-cloud | 2026-07-26 | `Connecting to the SAP HANA Database in SAP HANA Cloud` | Verified for advisory source guidance | Client support, connection limits, firewall paths, and credentials must be validated against the target database instance. |
| HDBSQL command-line reference | SAP HANA Client Interface Programming Reference | https://help.sap.com/docs/HANA_CLOUD_DATABASE/f1b440ded6144a54ada97ff95dac7adf/c22c67c3bb571014afebeb4a76c3d95d.html | 2026-07-26 | `SAP HANA HDBSQL (Command-Line Reference)` | Verified for advisory source guidance | HDBSQL is an SAP HANA client command-line tool; do not conflate it with the open-source `hana-cli` package. |
| Open-source/sample `hana-cli` utility installation and command behavior | SAP-samples `hana-developer-cli-tool-example` documentation | https://sap-samples.github.io/hana-developer-cli-tool-example/01-getting-started/installation | 2026-07-26 | `Installation Guide` | Verified as sample utility documentation, not SAP Help product documentation | Requires Node.js and database connectivity. Package versions and command behavior may change independently of SAP HANA Cloud product documentation. |
| `hana-cli` agent/MCP instruction generation | SAP-samples `hana-developer-cli-tool-example` documentation | https://sap-samples.github.io/hana-developer-cli-tool-example/03-features/agent-instructions | 2026-07-26 | `Agent Instructions` and `Regenerating Instructions` | Verified as sample utility documentation, not Codex runtime approval | Does not approve this repository's MCP activation. Keep MCPs disabled unless issue #5 governance is resolved. |

Port treatment: the original upstream `last_verified` value is preserved above as copied-source metadata. The Codex port source refresh date for these claim areas is 2026-07-26.
