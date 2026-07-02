# Internal Release Checklist

Date: 2026-07-02

## Release Decision

Current status: ready for local workspace use and internal review packaging.

External/client distribution status: blocked pending manual and governance checks.

## Pre-Distribution Checklist

Completed in this workspace:

- [x] 26 workspace skills validate with `quick_validate.py`.
- [x] Packaged `sap-deliverable-templates` skill validates with `quick_validate.py`.
- [x] `sap-codex-deliverables` plugin validates with `validate_plugin.py`.
- [x] Template and sample assets are present in both `.agents` and the plugin bundle.
- [x] Plugin bundle has no stale workspace paths, scaffold text, or unfinished placeholders.
- [x] `.codex/config.toml.example` is disabled/comment-only and parses with no active keys.
- [x] Upstream MCP env contract validation passed.
- [x] Upstream hook tests and hook contract tests passed.
- [x] MCP trust review completed.
- [x] Hook trust and Windows execution review completed.
- [x] Package/release readiness report completed.
- [x] Repo-local `sap-codex-deliverables` plugin loaded in the Codex app and completed one app-level smoke prompt.

Required before external/client distribution:

- [ ] Run `git status --short` and release/tag checks from an environment with Git installed.
- [ ] Review GPL-3.0 redistribution obligations.
- [ ] Decide whether copied command references stay under skills or move to a shared prompt library.
- [x] Complete remaining Phase 2 forward tests: L2C, S2P, P2P, Plan-to-Produce, Design-to-Operate, Hire-to-Retire, Discover, Prepare, Realize.
- [x] Complete remaining Phase 3 role-playbook forward tests: CAP Project Architect, Fiori App Advisor, HANA Database Advisor, SQLScript Analyzer, API Style Reviewer.
- [ ] Smoke-test `.codex/config.toml.example` in a disposable workspace before enabling any MCP block.
- [x] Resolve SAC MCP Windows/POSIX inventory key mismatch before considering SAC enablement.
- [ ] Complete SAC MCP source-install provenance, exact commit evidence, tenant/security approval, and least-privilege access review before enablement.
- [ ] Complete tenant/security approval before enabling HANA, Datasphere, or SAC MCPs.
- [ ] Confirm Codex hook schema, event names, stdin payload shape, and denial semantics before creating `.codex/hooks.example.json`.
- [ ] Install or provide `xmllint` before rerunning upstream iFlow XML template validation.

## Release Safety Notes

- No live SAP tenant validation has been performed.
- No fiscal, legal, security, or production-readiness approval is implied.
- Fictional sample deliverables are examples only and must not be reused as client facts.
- Tenant-connected MCPs remain blocked.
- Hooks remain disabled.
- `.imports` remains source evidence and should not be distributed as client-facing package content.

## Recommended Manual Smoke Prompt

Completed app-level smoke prompt:

```text
Use sap-deliverable-templates to draft a brief SAP go-live readiness checklist for an internal demo release. Mark assumptions, evidence gaps, and pending tenant/legal/security validation.
```

Observed result:

- Uses the go-live readiness checklist structure.
- Marks unvalidated claims as pending.
- Does not imply tenant, fiscal/legal, security, or production approval.
