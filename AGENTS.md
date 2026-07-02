# Mexbalia SAP Skills for Codex - Project Instructions

Use SAP S/4HANA process language by default: Record-to-Report, Procure-to-Pay, Lead-to-Cash, Order-to-Cash, Source-to-Pay, Plan-to-Produce, Design-to-Operate, and Hire-to-Retire. Use legacy module names such as FI, MM, or SD only when discussing ECC, configuration objects, or client terminology.

Treat all SAP product, API, licensing, roadmap, and tenant behavior claims as evidence-bound. Do not invent SAP capabilities, app names, APIs, edition availability, or licensing terms. Mark assumptions and validation gaps explicitly.

For implementation work, prefer human-in-the-loop recommendations. Do not make direct production configuration, security, integration, or architecture decisions without explicit user approval and environment evidence.

When using skills from `.agents/skills`, preserve their verification caveats. Skills with audit-only, stale, or missing `last_verified` metadata are source-guided references, not live-system proof.

For Mexico-specific SAP scenarios, account for CFDI, complementos de pago, Carta Porte when relevant, tax evidence, approval controls, and auditability. Keep these as local overlays unless the upstream generic skill explicitly covers them.

For client-facing output, use executive Spanish without unnecessary Spanglish. Separate confirmed facts, assumptions, open validation items, risks, and next actions.

Hooks and MCP server definitions from the upstream Claude distribution are not enabled by default in this Codex port. Review them manually before converting or running any lifecycle automation.
