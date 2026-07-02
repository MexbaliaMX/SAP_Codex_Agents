# Verification and Port Caveats

This skill was copied from plugins/sapui5/skills/sapui5 in sap-skills-main.zip during the Codex Windows port.

Do not advance last_verified or present the skill as live-tenant validated unless new evidence is added. Treat the content as source-guided SAP implementation guidance until validated in the relevant SAP/BTP/SAC/HANA/S/4HANA environment.

Claude-specific frontmatter keys such as llowed-tools, plugin lifecycle hooks, MCP settings, and slash-command assumptions were not enabled for Codex in this pass. Commands from the source plugin, when copied, are reference material only.

## Original Frontmatter

``yaml
name: sapui5
description: "This skill should be used when developing SAP UI5 applications, including creating freestyle apps, Fiori Elements apps, custom controls, testing, data binding, OData integration, routing, and troubleshooting. Use when building enterprise web applications with SAP UI5 framework, implementing MVC patterns, configuring manifest.json, creating XML views, writing controllers, setting up data models (JSON, OData v2/v4), implementing responsive UI with sap.m controls, building Fiori Elements apps, writing unit tests with QUnit, integration tests with OPA5, setting up mock servers, handling security (XSS, CSP), optimizing performance, implementing accessibility features, or debugging UI5 applications. Also covers sap.ui.mdc controls and TypeScript control libraries."
license: GPL-3.0
metadata:
  maintainer: "Eduard Jiglau"
  maintainer_email: "hello@sap-ai-skills.com"
  website: "https://sap-ai-skills.com"
  version: "2.3.2"
  last_verified: 2026-05-31
  framework_version: "1.148.1 latest verified, 1.120.0+ baseline"
  documentation_source: "https://github.com/SAP-docs/sapui5"
  documentation_files_analyzed: 1416
  reference_files: 15
  mcp_integration: true
  mcp_tools: 9
  specialized_agents: 4
  slash_commands: 5
  status: production
  keywords: [sapui5, ui5, openui5, sap ui5, ui5 framework, ui5 application, ui5 development, ui5 tooling, ui5 cli, Component.js, manifest.json, xml view, data binding, odata v2, odata v4, fiori elements, sap.m controls, mvc pattern, routing, navigation, qunit, opa5, testing, mock server, sap.ui.mdc, mdc table, typescript, accessibility, security, performance, ui5 inspector]
``