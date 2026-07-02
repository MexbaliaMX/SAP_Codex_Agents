# Verification and Port Caveats

This skill was copied from plugins/sap-btp-cloud-platform/skills/sap-btp-cloud-platform in sap-skills-main.zip during the Codex Windows port.

Do not advance last_verified or present the skill as live-tenant validated unless new evidence is added. Treat the content as source-guided SAP implementation guidance until validated in the relevant SAP/BTP/SAC/HANA/S/4HANA environment.

Claude-specific frontmatter keys such as llowed-tools, plugin lifecycle hooks, MCP settings, and slash-command assumptions were not enabled for Codex in this pass. Commands from the source plugin, when copied, are reference material only.

## Original Frontmatter

``yaml
name: sap-btp-cloud-platform
description: "Comprehensive SAP Business Technology Platform (BTP) reference for cloud development, deployment, and operations. Use when setting up BTP accounts, working with Cloud Foundry environment, deploying to Kyma (Kubernetes, serverless), developing in ABAP environment (RAP, CDS), managing entitlements and quotas, configuring identity providers (XSUAA), using btp CLI or CF CLI, deploying multi-target applications (MTA), setting up connectivity (destinations, Cloud Connector), implementing CI/CD pipelines, extending SAP solutions, or troubleshooting BTP services. Covers all three runtime environments."
license: GPL-3.0
metadata:
  maintainer: "Eduard Jiglau"
  maintainer_email: "hello@sap-ai-skills.com"
  website: "https://sap-ai-skills.com"
  version: "2.3.2"
  last_verified: "2025-11-27"
  source: "https://github.com/SAP-docs/sap-btp-cloud-platform"
  keywords: [SAP BTP, Business Technology Platform, Cloud Foundry, Kyma, ABAP environment, subaccount, global account, entitlements, btp CLI, CF CLI, MTA, multi-target application, XSUAA, Cloud Identity Services, destinations, Cloud Connector, service binding, Kubernetes, serverless, RAP, CDS, CAP, CI/CD, extensions, trial account, free tier, enterprise account, CPEA, BTPEA, role collections, Neo environment, Helm, Docker, Istio, API Gateway, Eventing]
``