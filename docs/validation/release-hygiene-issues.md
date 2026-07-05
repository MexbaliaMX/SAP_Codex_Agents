# Recommended Release Hygiene Issues

These issues were created in `MexbaliaMX/SAP_Codex_Agents` during the local release-hygiene pass. Labels were not applied because a label discovery tool was not available.

## 1. Refresh stale SAP technical source metadata

GitHub issue: <https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/1>

Scope: SAP BTP, Connectivity, Integration Suite, and HANA CLI source metadata.

Acceptance criteria:

- Refresh source references from authoritative SAP sources.
- Record URLs, access dates, and evidence in each affected `references/verification.md`.
- Do not advance `last_verified` without documented evidence.
- Keep tenant, licensing, roadmap, and production claims evidence-bound.

## 2. Complete GPL-3.0 notices and redistribution review

GitHub issue: <https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/2>

Scope: GPL-3.0-only source release, third-party notices, client packaging, marketplace distribution, and archive release.

Acceptance criteria:

- Confirm repo-level `GPL-3.0-only` release posture with the owner.
- Keep `LICENSE`, `docs/governance/license-review.md`, and `docs/governance/gpl-3-release-plan.md` aligned.
- Complete `THIRD_PARTY_NOTICES.md`.
- Decide whether proprietary packaging, marketplace publication, or external/client distribution is allowed.

## 3. Tenant validation plan

GitHub issue: <https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/3>

Scope: SAP S/4HANA, BTP, Integration Suite, HANA, SAC, Datasphere, BAS, and Fiori launchpad.

Acceptance criteria:

- Define disposable/non-production validation environments.
- Define evidence required for process, integration, security, and operations claims.
- Keep production-impacting actions approval-gated.
- Record validation gaps separately from confirmed facts.

## 4. Codex hooks runtime validation

GitHub issue: <https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/4>

Scope: schema, event names, stdin payload, denial semantics, and Windows behavior.

Acceptance criteria:

- Validate hook behavior in a disposable workspace.
- Confirm Windows command invocation and path handling.
- Keep `.codex/hooks.example.json` disabled until runtime behavior is proven.
- Document approval requirements before any hook enablement.

## 5. MCP activation governance

GitHub issue: <https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/5>

Scope: package pins, source provenance, least privilege, tenant/security approval, and runtime boundaries.

Acceptance criteria:

- Confirm source provenance and package pins before enabling MCP servers.
- Define least-privilege runtime permissions.
- Block tenant-connected MCPs until tenant/security approval is documented.
- Keep `.codex/config.toml.example` as an inactive example until approval.

## 6. Release archive refresh and smoke test

GitHub issue: <https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/6>

Scope: regenerate archive after release-hygiene changes and rerun smoke/app-level plugin validation.

Acceptance criteria:

- Regenerate the release archive from the final advisory RC commit.
- Run archive smoke and plugin operating-layer validation.
- Rerun app-level plugin smoke after archive or marketplace changes.
- Record the final source commit, archive name, checksum, and unresolved blockers.
