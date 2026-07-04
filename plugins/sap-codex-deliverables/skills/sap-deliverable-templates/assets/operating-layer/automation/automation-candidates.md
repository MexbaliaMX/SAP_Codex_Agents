# Controlled Automation Candidates

This file records safe automation candidates for the SAP Agents workspace. It does not enable hooks, MCP servers, tenant access, credential use, package execution, or lifecycle automation.

## Current Decision

- MCP servers remain disabled.
- Hooks remain disabled.
- Tenant-connected execution remains blocked pending explicit approval.
- Production-impacting actions remain human-approved.

## Candidate Read-Only Checks

| Candidate | Purpose | Status | Approval needed before activation |
|---|---|---|---|
| Skill frontmatter validation | Confirm local skills keep Codex-compatible `name` and `description` frontmatter | Candidate | Repo maintainer approval |
| Broken reference check | Confirm referenced local Markdown/template paths exist | Candidate | Repo maintainer approval |
| Template placeholder check | Catch unfinished placeholders in templates and generated docs | Candidate | Repo maintainer approval |
| MCP pin policy check | Ensure disabled MCP examples keep exact package pins and no tenant secrets | Candidate | Security/trust approval |
| Playbook count and registry check | Confirm the seven high-value playbooks remain present and registry links resolve | Candidate | Repo maintainer approval |

## Explicitly Blocked Automation

| Blocked item | Reason |
|---|---|
| Tenant-connected MCP execution | Requires credential, package trust, tenant/security, and user approval |
| Hook execution on file writes | Codex hook schema, Windows wrapper behavior, and failure semantics are not confirmed |
| Production configuration or transports | Requires client governance approval and environment evidence |
| Dependency upgrade automation | Requires staged upgrade plan, lockfile review, package trust, and tests |
| Fiscal/legal compliance validation | Must be validated by client fiscal/legal/audit owners |

## Activation Principles

- Start with read-only checks.
- Keep generated examples disabled until reviewed.
- Prefer exact package pins and project-scoped configuration.
- Do not store tenant URLs, passwords, certificates, tokens, or private user identifiers in examples.
- Treat all automation as advisory until a human owner accepts the risk and activation scope.
