# Verification and Port Caveats

This skill was copied from plugins/sap-btp-connectivity/skills/sap-btp-connectivity in sap-skills-main.zip during the Codex Windows port.

Do not advance last_verified or present the skill as live-tenant validated unless new evidence is added. Treat the content as source-guided SAP implementation guidance until validated in the relevant SAP/BTP/SAC/HANA/S/4HANA environment.

Claude-specific frontmatter keys such as llowed-tools, plugin lifecycle hooks, MCP settings, and slash-command assumptions were not enabled for Codex in this pass. Commands from the source plugin, when copied, are reference material only.

## Original Frontmatter

``yaml
name: sap-btp-connectivity
description: "SAP BTP Connectivity skill covering Destination Service, Connectivity Service, Cloud Connector, Connectivity Proxy, and Transparent Proxy for Kubernetes. Use when configuring destinations (HTTP, RFC, LDAP, MAIL, TCP), setting up cloud-to-on-premise connectivity, implementing OAuth and principal propagation, deploying connectivity proxies in Kubernetes/Kyma, troubleshooting connectivity errors (405, 407, 503), or configuring multitenancy."
license: GPL-3.0
metadata:
  maintainer: "Eduard Jiglau"
  maintainer_email: "hello@sap-ai-skills.com"
  website: "https://sap-ai-skills.com"
  version: "2.3.2"
  last_verified: "2025-11-27"
  keywords: [SAP BTP, Connectivity, Destination Service, Cloud Connector, Connectivity Proxy, Transparent Proxy, Kyma, Kubernetes, OAuth, Principal Propagation, RFC, LDAP, on-premise, hybrid connectivity, service channels, SOCKS5, reverse proxy, tunnel]
``

## Phase 6 Source Refresh - 2026-07-26

Codex port verification status: refreshed for public-source advisory use on 2026-07-26.

Reviewer: Codex repository governance pass for issue #1. This is not SAP tenant validation, legal review, licensing approval, security approval, production readiness, or client distribution approval.

| Claim area | Product / edition context | Authoritative source URL | Access date | Relevant source section | Verification status | Caveats |
|---|---|---|---|---|---|---|
| Destination, Connectivity service, Cloud Connector, Connectivity Proxy, and Transparent Proxy positioning | SAP BTP Connectivity, multi-cloud foundation | https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/connectivity | 2026-07-26 | `What is SAP BTP Connectivity?`, `Overview`, `Components`, and `Supported Protocols` | Verified for advisory source guidance | Exact protocols, regions, service plans, and tenant behavior require target-subaccount evidence. No connectivity tunnel was configured or tested. |
| Connectivity product documentation scope | SAP BTP Connectivity | https://help.sap.com/docs/connectivity | 2026-07-26 | SAP BTP Connectivity product page, `Getting Started`, `Integration`, and `Operations` | Verified for advisory source guidance | Product-page links are source orientation, not permission to activate services or expose on-premise systems. |
| Transparent Proxy for Kubernetes | SAP BTP Connectivity, Kubernetes and Kyma scenarios | https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/using-transparent-proxy | 2026-07-26 | `Using the Transparent Proxy` | Verified for advisory source guidance | Requires destination configuration, Kubernetes resources, service credentials, and tenant/network approval. No proxy deployment was performed. |
| Connectivity Proxy for Kubernetes | SAP BTP Connectivity, Kubernetes and Kyma scenarios | https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/how-connectivity-proxy-works | 2026-07-26 | `How the Connectivity Proxy Works` | Verified for advisory source guidance | Treat architecture statements as reference only until validated against the selected region, subaccount, Cloud Connector, and network controls. |

Port treatment: the original upstream `last_verified` value is preserved above as copied-source metadata. The Codex port source refresh date for these claim areas is 2026-07-26.
