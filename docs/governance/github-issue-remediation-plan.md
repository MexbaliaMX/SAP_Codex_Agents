# GitHub Issue Remediation Plan

Date: 2026-07-25

## Scope

Convert open governance issues into an executable v0.2.0-final backlog. This document is a proposal only; no GitHub issues, labels, milestones, or assignments were modified while creating it.

## Common Updates For All Open Issues

Recommended common metadata:

- Milestone: `v0.2.0-final`
- Owner: required before work starts
- Priority: explicit `P0`, `P1`, or `P2`
- Labels: `governance`, plus topic labels below
- Dependencies: documented in the issue body
- Acceptance criteria: verifiable and evidence-bound
- Non-goals: explicit
- Definition of done: includes evidence links and reviewer approval

Recommended labels:

- `release-blocker`
- `governance`
- `security`
- `sap-evidence`
- `tenant-validation`
- `mcp`
- `hooks`
- `priority:P0`
- `priority:P1`
- `priority:P2`
- `status:blocked`
- `status:ready`

Create labels and milestones only after owner approval.

## Issue #1 - Refresh stale SAP technical source metadata

Priority: `P1`

Labels: `governance`, `sap-evidence`, `priority:P1`

Proposed workstreams:

- SAP BTP source metadata
- SAP Connectivity and Cloud Connector
- SAP Integration Suite
- SAP HANA CLI
- Final evidence review

Required evidence fields for each technical claim:

- Claim
- Product
- Product edition
- Version or release context
- Authoritative source URL
- Access date
- Relevant source section
- Repository file affected
- Verification status
- Reviewer
- Caveats

Acceptance criteria:

- Every refreshed claim has authoritative evidence.
- No `last_verified` value is advanced without evidence.
- Repository files affected by the refresh are listed.
- SAP roadmap, edition, API, licensing, and tenant behavior claims remain caveated where evidence is incomplete.

Non-goals:

- No live SAP tenant validation.
- No SAP licensing or legal conclusion.
- No production readiness claim.

## Issue #3 - Tenant validation plan

Priority: `P0`

Labels: `release-blocker`, `tenant-validation`, `security`, `priority:P0`

Validation states:

- `UNTESTED`
- `LOCAL-SIMULATED`
- `NONPROD-VALIDATED`
- `PRODUCTION-APPROVED`

Required scope checklist:

- S/4HANA
- BTP
- Integration Suite
- HANA
- SAC
- Datasphere
- BAS
- Fiori launchpad

Required fields:

- Environment owner
- System type
- Non-production confirmation
- Test data policy
- Approved credentials process
- Read-only versus write test
- Evidence artifact
- Cleanup procedure
- Risk owner
- Approval record

Acceptance criteria:

- A tenant validation matrix exists.
- Every environment-dependent claim has a validation state.
- Non-production validation is separated from production approval.
- No real credentials, tenant URLs, user data, or client information are stored in public issues.

Non-goals:

- No immediate tenant access.
- No production execution.
- No transport, role, user, or configuration change.

## Issue #4 - Codex hooks runtime validation

Priority: `P1`

Labels: `governance`, `hooks`, `security`, `priority:P1`

Required validation areas:

- Supported schema
- Valid event names
- stdin payload shape
- Malformed payloads
- Denial semantics
- Fail-open behavior
- Fail-closed behavior
- Timeout behavior
- Windows command invocation
- Quoting
- Path handling
- Path injection
- Recursive hook prevention
- Logging
- Disable procedure
- Rollback procedure

Acceptance criteria:

- `.codex/hooks.example.json` remains inactive.
- Tests cover safe and malformed payload behavior.
- Windows path and quoting behavior are documented.
- Hook enablement remains blocked pending owner and security approval.

Non-goals:

- No active hook installation.
- No automatic lifecycle automation.
- No production-impacting command execution.

## Issue #5 - MCP activation governance

Priority: `P1`

Labels: `governance`, `mcp`, `security`, `priority:P1`

Required deliverables:

- MCP inventory
- Package and version pins
- Source provenance
- SBOM
- Permission matrix
- Least-privilege analysis
- Filesystem access boundaries
- Network access boundaries
- Secret-handling model
- Threat model
- Prompt-injection considerations
- Tenant approval
- Security approval
- Environment-specific activation
- Revocation procedure
- Kill switch
- Evidence retention

Acceptance criteria:

- `.codex/config.toml.example` remains inactive.
- No MCP server is enabled by repository defaults.
- Activation requires environment-specific owner approval.
- Secret handling and revocation are documented before any tenant-connected use.

Non-goals:

- No live MCP activation.
- No tenant credentials.
- No SAP production or non-production tenant action.

## Closed Issue #2 Follow-Up

Issue #2 was closed, but final release posture still requires explicit decision records for:

- External or client distribution.
- Proprietary packaging.
- Marketplace publication.
- SAP documentation redistribution.
- SAP trademark and product-name treatment.

Recommended owner decision:

- Keep issue #2 closed only if its closure is interpreted narrowly as GPL-3.0-only source and internal advisory RC posture.
- Create a new release blocker if external/client distribution or marketplace publication is in scope for v0.2.0.

Do not claim legal approval in issue comments.
