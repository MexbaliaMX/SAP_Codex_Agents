# Open Validation Items

## Source verification

- Source verification audit completed: `docs/validation/source-verification-audit.md`.
- Preserve upstream `last_verified` metadata; do not advance dates without new evidence.
- Before client-facing use, remediate or explicitly accept the audit findings:
  - 4 technical skills have source metadata older than 180 days.
  - 14 local process/SAP Activate overlay skills have caveat files but no `last_verified` date.
- Release hygiene update on 2026-07-05: the 14 local process/SAP Activate overlay `SKILL.md` files now directly point to `references/verification.md`.
- Upstream repository URL for copied technical skills confirmed on 2026-07-07 as `secondsky/sap-skills`; source ref pinned to commit `45073ee91a2d7fb81401c35199da32aa91e08053`; local `.imports/sap-skills-main.zip` checksum and archive-content comparison are recorded in `docs/governance/third-party-provenance-review.md`. Contributor-rights checkpoint is recorded, but release-owner/legal acceptance remains open.
- Add tenant evidence only after testing in the relevant SAP landscape.

## Live environment tests

- No SAP BTP, Integration Suite, HANA, SAC, Datasphere, S/4HANA, BAS, or Fiori launchpad tenant validation has been performed in this Codex port.
- Treat generated artifacts as locally structured and source-guided until imported or tested in a real tenant.

## Release alignment

- Release tag alignment is resolved locally: tag `sap-codex-deliverables-v0.1.0` points to the final manifest archive source commit `90bf571 Start plugin-safe operating layer packaging`.
- Release archive was regenerated and smoked with the latest validation documentation included; regenerate and smoke again if validation documentation changes before distribution.

## Agent operating layer

- SAP Agent Registry, seven routing playbooks, output profiles, and controlled automation candidates are created for internal advisory use.
- Eight client-ready anonymized sample files exist under `.agents/samples/client-ready`, including `INDEX.md`; adapt them with confirmed client evidence before use.
- Read-only operating-layer validation passes with `scripts/validate-agent-operating-layer.ps1`.
- Release hygiene CI and `scripts/validate-release-hygiene.ps1` now check advisory RC guardrails, including broken reference paths, active Codex runtime config, active hooks, unfinished operating-layer markers, and private artifact filename patterns.
- Plugin-safe packaging has started: generated assets now exist under `plugins/sap-codex-deliverables/skills/sap-deliverable-templates/assets/operating-layer`.
- Refreshed release archive smoke passed after adding operating-layer assets.
- App-level plugin launch and two fresh-thread output confirmations passed in `docs/validation/plugin-operating-layer-app-smoke-report.md`.
- Keep workspace sources authoritative; regenerate plugin assets with `scripts/package-operating-layer-assets.ps1` after editing registry, playbooks, output profiles, samples, or automation candidates.
- Keep the operating layer advisory-only until a future Codex subagent configuration format, MCP/tool activation model, or workflow automation design is explicitly approved.

## Hooks

- Hook trust and Windows execution review is complete.
- Keep lifecycle hooks disabled until Codex hook schema, event names, stdin payload shape, and denial semantics are confirmed.
- Replace Claude path variables and Bash assumptions before any Windows execution.
- Disabled `.codex/hooks.example.json` exists as documentation-only; do not convert it into active hooks until Codex hook runtime behavior is confirmed.

## MCP

- Do not commit secrets or tenant credentials.
- Convert MCP definitions only into project-scoped `.codex/config.toml` templates or Codex plugin bundles after approval.
- Pin package versions and document required environment variables.
- SAC MCP inventory path normalization is fixed in the imported upstream validator, but SAC MCP remains blocked until tenant/security approval and source-install evidence are available.

## Windows compatibility

- Review Bash scripts for Git Bash or WSL assumptions.
- Prefer PowerShell or Node wrappers for local Windows workflows.
- Check paths with spaces, long paths, and `.cmd` binary resolution for Node tooling.

## Licensing

- GPL-3.0-only source release planning is documented in `docs/governance/license-review.md` and `docs/governance/gpl-3-release-plan.md`.
- `LICENSE` contains GNU GPLv3 text downloaded from the Free Software Foundation license URL on 2026-07-05.
- Initial post-RC third-party provenance inventory is documented in `docs/governance/third-party-provenance-review.md` and `THIRD_PARTY_NOTICES.md`.
- SAP documentation excerpt audit is documented in `docs/governance/sap-documentation-excerpt-audit.md`; tracked-source scan found no immediate SAP documentation removal items.
- Distribution posture decision recorded in `docs/governance/external-distribution-decision-record-2026-07-26.md`: public-source advisory release posture is approved, while proprietary client packaging, marketplace distribution, SAP-branded promotion, SAP documentation redistribution, and external/client distribution beyond public source review remain blocked or deferred pending separate qualified approval.
- `THIRD_PARTY_NOTICES.md` remains incomplete and is not legal clearance.

## Skill quality checks

- Validate frontmatter for all migrated skills.
- Check references from `SKILL.md` to copied resource files.
- Run `scripts/validate-agent-operating-layer.ps1` after editing the registry, playbooks, output profiles, automation candidates, or related validation docs.
- Run `scripts/validate-plugin-operating-layer-assets.ps1` after regenerating plugin operating-layer assets.
- Decide whether copied command references should remain under each skill or be consolidated under a shared prompt library.
- Install Git or run status checks from an environment where Git is available before making commits or release tags.
- Keep SAC MCP blocked until source-install provenance, exact commit evidence, tenant/security approval, and least-privilege access are reviewed.
- Complete tenant/security approval before enabling HANA, Datasphere, or SAC MCPs.
- Confirm Codex hook schema, event names, stdin payload shape, and denial semantics before enabling any hooks from `.codex/hooks.example.json`.
- Run disposable-workspace smoke tests for each reviewed hook candidate before enablement.
