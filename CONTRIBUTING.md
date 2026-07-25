# Contributing

## Release Boundary

This repository is advisory by default. Do not add credentials, client data, tenant URLs, production configuration, role changes, user administration, transports, enabled MCP servers, enabled Codex hooks, or production-impacting automation.

## Branch Naming

Use focused branches:

- `feature/<short-name>`
- `fix/<short-name>`
- `docs/<short-name>`
- `chore/<short-name>`
- `release/<short-name>`

The durable integration branch is planned to be `main` after owner approval. Do not create, delete, rename, or change protected branches without owner approval.

## Commit Style

Use concise imperative commits, for example:

- `docs: record repository governance assessment`
- `chore: add repository contribution controls`
- `ci: harden release hygiene workflow`

## Pull Request Size

Prefer small, reviewable pull requests:

- Target fewer than 30 changed files.
- Target fewer than 1,000 net lines.
- Split capability, governance, CI, validation, and release changes.
- Add an exception note when thresholds are exceeded.

## Required PR Evidence

Every PR should describe:

- Purpose and scope.
- Linked issue or owner-approved reason.
- Security impact.
- SAP claim impact.
- Tenant-connectivity impact.
- Licensing and provenance impact.
- Tests run and exact results.
- Documentation impact.
- Rollback plan.

Do not report a test as passed unless the command completed successfully.

## SAP Evidence Standards

Treat SAP product, API, roadmap, licensing, edition availability, tenant behavior, fiscal/legal, security, and production readiness claims as evidence-bound.

For Mexico-specific SAP scenarios, account for CFDI, complementos de pago, Carta Porte, tax evidence, approval controls, and auditability where relevant. Keep these as local overlays unless upstream skill evidence covers them.

Never advance `last_verified` metadata without authoritative evidence.

## Generated Artifacts

Generated artifacts must be reproducible or explicitly documented as evidence. Do not commit temporary files under `tmp/` unless the owner approves them and they are moved or referenced as intentional validation evidence.

## Secrets And Client Data

Do not commit:

- Passwords, tokens, API keys, certificates, or private keys.
- Tenant URLs or tenant-specific identifiers.
- Client data or user data.
- Production incident details.
- Real fiscal XML or sensitive tax evidence.

Use placeholders and sanitized examples.

## Release Process

Before final release:

- Complete governance assessment.
- Confirm branch model and branch protection.
- Resolve release-blocking issues.
- Run validation scripts.
- Confirm license, provenance, SAP documentation, and trademark posture.
- Preserve advisory-only boundaries unless separately approved.
