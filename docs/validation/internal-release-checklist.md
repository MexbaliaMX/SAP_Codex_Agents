# Internal Release Checklist

Date: 2026-07-02

## Release Decision

Current status: ready for local workspace use, internal review packaging, and GPL-3.0-only public source advisory RC review.

External/client distribution status: blocked pending manual governance checks, third-party notice completion, provenance review, tenant/security approval, and final archive smoke.

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
- [x] Source verification audit completed.
- [x] Repo-local `sap-codex-deliverables` plugin loaded in the Codex app and completed one app-level smoke prompt.
- [x] SAP Agent Registry created at `.agents/AGENT_REGISTRY.md`.
- [x] Seven high-value routing playbooks created under `.agents/playbooks`.
- [x] Output profiles created under `.agents/output-profiles` for executive Spanish, technical working notes, and evidence-bound audit outputs.
- [x] Eight client-ready anonymized sample files created under `.agents/samples/client-ready`, including `INDEX.md`.
- [x] Controlled automation candidates documented in `.agents/automation-candidates.md` with MCPs, hooks, and tenant-connected execution disabled.
- [x] Full agent operating-layer forward-test report completed.
- [x] Read-only operating-layer validation passed with `powershell -ExecutionPolicy Bypass -File scripts\validate-agent-operating-layer.ps1`, including registry, playbooks, output profiles, client-ready samples, automation notes, and template references.
- [x] Release hygiene validation passed with `powershell -ExecutionPolicy Bypass -File scripts\validate-release-hygiene.ps1`.
- [x] Repo-level GPL-3.0-only release plan documented with root `LICENSE`, `docs/governance/license-review.md`, and `docs/governance/gpl-3-release-plan.md`.
- [x] Initial post-RC third-party provenance inventory recorded in `docs/governance/third-party-provenance-review.md` and `THIRD_PARTY_NOTICES.md`.

Required before external/client distribution:

- [x] Run `git status --short` from an environment with Git installed.
- [x] Confirm local release tag state before external/client distribution.
- [x] Resolve release tag alignment: local tag `sap-codex-deliverables-v0.1.0` now points to the manifest-recorded archive source commit `90bf571 Start plugin-safe operating layer packaging`.
- [x] Select GPL-3.0-only as the public source advisory RC release license.
- [x] Pin upstream `sap-skills-main.zip` source URL, commit, and local checksum evidence in `docs/governance/third-party-provenance-review.md`.
- [ ] Complete contributor-rights, SAP documentation terms, trademark, marketplace, and GPL-3.0 redistribution review before proprietary/client packaging, marketplace distribution, or closed redistribution.
- [ ] Remediate or explicitly accept source verification audit findings before client-facing distribution.
- [ ] Decide whether copied command references stay under skills or move to a shared prompt library.
- [x] Complete remaining Phase 2 forward tests: L2C, S2P, P2P, Plan-to-Produce, Design-to-Operate, Hire-to-Retire, Discover, Prepare, Realize.
- [x] Complete remaining Phase 3 role-playbook forward tests: CAP Project Architect, Fiori App Advisor, HANA Database Advisor, SQLScript Analyzer, API Style Reviewer.
- [x] Smoke-test `.codex/config.toml.example` in a disposable workspace before enabling any MCP block.
- [x] Resolve SAC MCP Windows/POSIX inventory key mismatch before considering SAC enablement.
- [ ] Complete SAC MCP source-install provenance, exact commit evidence, tenant/security approval, and least-privilege access review before enablement.
- [ ] Complete tenant/security approval before enabling HANA, Datasphere, or SAC MCPs.
- [x] Create disabled `.codex/hooks.example.json` as documentation-only example.
- [ ] Confirm Codex hook schema, event names, stdin payload shape, and denial semantics before enabling any hooks from `.codex/hooks.example.json`.
- [x] Install or provide `xmllint` before rerunning upstream iFlow XML template validation.
- [x] Start plugin-safe packaging for operating-layer assets under `plugins/sap-codex-deliverables/skills/sap-deliverable-templates/assets/operating-layer`.
- [x] Plugin operating-layer asset validation passed with `scripts\validate-plugin-operating-layer-assets.ps1`.
- [x] Refresh release archive and run archive smoke after GPL-3.0-only release-plan files are committed.
- [x] Rerun app-level plugin smoke after archive regeneration and before external/client distribution.

## Release Safety Notes

- No live SAP tenant validation has been performed.
- No fiscal, legal, security, third-party notice, redistribution, or production-readiness approval is implied.
- Fictional sample deliverables are examples only and must not be reused as client facts.
- Tenant-connected MCPs remain blocked.
- Hooks remain disabled.
- Agent playbooks and output profiles are advisory operating guidance, not autonomous tool-enabled agents.
- Client-ready samples are anonymized examples and must be adapted with confirmed client evidence before use.
- Plugin-safe operating-layer assets are generated copies; edit workspace source files first, then regenerate.
- `.imports` remains source evidence and should not be distributed as client-facing package content.
- GPL-3.0-only source release planning does not make tenant-connected execution, MCP activation, hook activation, proprietary packaging, or client distribution safe without the remaining approvals.

## Recommended Manual Smoke Prompt

Completed app-level smoke prompt:

```text
Use sap-deliverable-templates to draft a brief SAP go-live readiness checklist for an internal demo release. Mark assumptions, evidence gaps, and pending tenant/legal/security validation.
```

Observed result:

- Uses the go-live readiness checklist structure.
- Marks unvalidated claims as pending.
- Does not imply tenant, fiscal/legal, security, or production approval.
