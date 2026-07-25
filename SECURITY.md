# Security Policy

## Supported Scope

This repository is currently supported for internal advisory release-candidate review only. It is not approved for production use, live SAP tenant execution, client distribution, marketplace publication, or proprietary packaging.

## Reporting Security Concerns

Report security concerns through a private repository-owner channel whenever possible. Do not place credentials, tenant URLs, client data, production incident data, user identifiers, or sensitive screenshots in public issues.

If a public issue is necessary, describe the class of issue without including exploitable secrets or client-specific details.

## Advisory-Only Boundary

The repository must not enable SAP tenant connectivity, MCP servers, Codex hooks, credentials, production configuration, role changes, user administration, transports, or production-impacting automation without explicit owner approval and environment evidence.

Examples and templates under `.codex/`, `.agents/`, `docs/`, and `plugins/` are advisory unless a separate approval record states otherwise.

## MCP And Hook Findings

MCP and hook-related vulnerabilities should include:

- Affected file or example.
- Whether the configuration is active or inactive.
- Required permissions.
- Filesystem or network boundary impact.
- Secret-handling impact.
- Prompt-injection or command-injection considerations.
- Proposed disable or rollback procedure.

Keep `.codex/config.toml.example` and `.codex/hooks.example.json` inactive until governance, trust, runtime, and security validation are complete.

## Dependency And Provenance Concerns

Report dependency, license, provenance, SBOM, and redistribution concerns with:

- Package or source name.
- Version, commit, or archive hash.
- Source URL.
- License signal.
- Repository file affected.
- Recommended remediation.

Do not claim legal approval. Repository owner or qualified legal reviewer approval is required for client distribution, marketplace publication, proprietary packaging, SAP documentation redistribution, and SAP trademark decisions.

## Triage Process

The repository owner should triage reports by severity, scope, exploitability, advisory-only boundary impact, and release impact. Response times are not guaranteed by this policy.

Security fixes should be reviewed through pull requests unless an owner-approved private remediation path is required.
