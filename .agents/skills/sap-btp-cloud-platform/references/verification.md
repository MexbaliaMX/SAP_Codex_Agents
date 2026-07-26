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

## Phase 6 Source Refresh - 2026-07-26

Codex port verification status: refreshed for public-source advisory use on 2026-07-26.

Reviewer: Codex repository governance pass for issue #1. This is not SAP tenant validation, legal review, licensing approval, security approval, production readiness, or client distribution approval.

| Claim area | Product / edition context | Authoritative source URL | Access date | Relevant source section | Verification status | Caveats |
|---|---|---|---|---|---|---|
| SAP BTP account model, subaccounts, environments, and environment instances | SAP Business Technology Platform, multi-cloud foundation | https://help.sap.com/docs/btp/sap-business-technology-platform/environments | 2026-07-26 | `Environments` and `Environment Instances` | Verified for advisory source guidance | Exact availability depends on region, contract, subaccount, entitlements, and tenant configuration. Neo content is legacy context only. |
| Entitlements and quotas | SAP Business Technology Platform enterprise/global account and subaccount administration | https://help.sap.com/docs/btp/sap-business-technology-platform/entitlements-and-quotas | 2026-07-26 | `Entitlements`, `Quota Plans`, and service/service-plan descriptions | Verified for advisory source guidance | Do not infer purchased services, commercial model, service plans, or quota availability for a client tenant. |
| Kyma environment setup | SAP BTP, Kyma runtime | https://help.sap.com/docs/btp/sap-business-technology-platform/create-kyma-environment-instance | 2026-07-26 | `Creating Kyma Instances` | Verified for advisory source guidance | Requires subaccount entitlements and administrator authorization. No Kyma tenant was provisioned or tested. |
| btp CLI entitlement operations | SAP BTP command line interface | https://help.sap.com/docs/btp/sap-business-technology-platform/setting-entitlements-using-btp-cli | 2026-07-26 | `Setting Entitlements Using the btp CLI` | Verified for advisory source guidance | Commands are reference guidance only. Do not run against a customer or production account without explicit approval and environment evidence. |

Port treatment: the original upstream `last_verified` value is preserved above as copied-source metadata. The Codex port source refresh date for these claim areas is 2026-07-26.
