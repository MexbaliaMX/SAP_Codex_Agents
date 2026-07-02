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