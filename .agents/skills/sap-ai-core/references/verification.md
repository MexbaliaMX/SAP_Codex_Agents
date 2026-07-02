# Verification and Port Caveats

This skill was copied from plugins/sap-ai-core/skills/sap-ai-core in sap-skills-main.zip during the Codex Windows port.

Do not advance last_verified or present the skill as live-tenant validated unless new evidence is added. Treat the content as source-guided SAP implementation guidance until validated in the relevant SAP/BTP/SAC/HANA/S/4HANA environment.

Claude-specific frontmatter keys such as llowed-tools, plugin lifecycle hooks, MCP settings, and slash-command assumptions were not enabled for Codex in this pass. Commands from the source plugin, when copied, are reference material only.

## Original Frontmatter

``yaml
name: sap-ai-core
description: |
  Guides development with SAP AI Core and SAP AI Launchpad for enterprise AI/ML workloads on SAP BTP. Use when: deploying generative AI models, building orchestration workflows with templating/filtering/grounding, implementing RAG with vector databases, managing ML training pipelines with Argo Workflows, configuring content filtering and data masking for PII protection, using the Generative AI Hub for prompt experimentation, managing prompt templates via the Prompt Registry, or integrating AI capabilities into SAP applications. Covers service plans (Free/Standard/Extended), model providers (Azure OpenAI, AWS Bedrock, GCP Vertex AI, Mistral, IBM, Perplexity), orchestration modules, embeddings, tool calling, and structured outputs.
license: GPL-3.0
metadata:
  maintainer: "Eduard Jiglau"
  maintainer_email: "hello@sap-ai-skills.com"
  website: "https://sap-ai-skills.com"
  version: "2.3.2"
  last_verified: "2026-06-12"
  production_tested: "No; documentation-audited only, no live tenant/runtime evidence"
  runtime_verification: "pending tenant evidence"
``