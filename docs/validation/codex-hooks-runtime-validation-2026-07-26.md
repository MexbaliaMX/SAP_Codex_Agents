# Codex Hooks Runtime Validation Record

Date: 2026-07-26

Tracking issue: [#4 Codex hooks runtime validation](https://github.com/MexbaliaMX/SAP_Codex_Agents/issues/4)

Status: validated as inactive and blocked for enablement

## Decision

`.codex/hooks.example.json` remains a documentation-only disabled example. No active `.codex/hooks.json` was created, committed, or used.

Hook enablement remains blocked. The upstream validators and disposable harness behaved safely for the tested stdin payloads, but active Codex lifecycle hook schema, event names, stdin payload shape, denial semantics, fail-open behavior, fail-closed behavior, timeout behavior, and recursive-hook behavior are not approved for use in this repository.

## Evidence Reviewed

- `.codex/hooks.example.json`
- `docs/validation/hooks-example-validation-report.md`
- `docs/porting/hook-trust-windows-review.md`
- `scripts/validate-release-hygiene.ps1`
- Upstream validator tests in `.imports/sap-skills-main/sap-skills-main`
- OpenAI Help Center Codex and plugin documentation search results available on 2026-07-26

No public OpenAI Help Center hook schema reference was identified during this pass.

## Local Codex Runtime Check

| Check | Result | Treatment |
|---|---|---|
| Locate local Codex executable | `C:\Program Files\WindowsApps\OpenAI.Codex_26.721.3404.0_x64__2p2nqsd0c76g0\app\resources\codex.exe` was discoverable through PowerShell | Informational only |
| Run `codex --version` | Failed with `Access is denied` | No runtime hook CLI behavior inferred |
| Official hook schema evidence | Not found in reviewed OpenAI Help Center results | Active hook schema remains unconfirmed |

## Disposable Harness

The disposable harness copied only `.codex/hooks.example.json` into a temporary workspace and did not create `.codex/hooks.json`.

```text
ActiveHooksJsonExists: false
ExampleActivationAllowed: false
ExampleActiveHooksCount: 0
SafePayloadOutput: {}
MalformedPayloadOutput: {}
```

The safe and malformed payload checks were direct validator stdin tests, not active Codex lifecycle hook executions.

## Upstream Validator Test Results

Ran in `.imports/sap-skills-main/sap-skills-main`:

```text
node scripts\test-hooks.mjs
node scripts\test-hook-contracts.mjs
```

Results:

```text
Hook tests passed.
Hook contract tests passed for 8 hook-enabled plugin(s).
```

The tests covered safe payloads, irrelevant payloads, blocking payloads, malformed payload handling, and deny-shaped outputs for upstream Claude-style validators.

## Denial Shape Observation

The dependency-security validator returned a Claude-style denial object for a floating MCP package version:

```text
hookSpecificOutput.permissionDecision: deny
hookSpecificOutput.permissionDecisionReason: Dependency or MCP security risk detected; user confirmation is required before this tool call can proceed.
```

This proves the validator can emit a denial-shaped response. It does not prove that Codex will enforce the response as a lifecycle denial.

## Windows And Path Handling

| Area | Result | Remaining condition |
|---|---|---|
| Windows command invocation | Direct `node <validator.mjs>` invocation worked for upstream tests and disposable stdin checks | Any active hook command must use a reviewed Windows-safe path strategy |
| Quoting | JSON payloads containing nested quotes were accepted by direct stdin execution | Active lifecycle quoting remains unproven |
| Path handling | `.codex/hooks.example.json` uses inert candidate paths only | Replace `.imports` source paths with reviewed package-local or project-local validator paths before any enablement |
| Path injection | No active path-consuming lifecycle hook was enabled | Must be retested if Codex exposes an active hook schema |
| Timeout behavior | Upstream test harness uses bounded validator execution | Codex lifecycle timeout behavior remains unproven |
| Recursive hook prevention | Not applicable because no lifecycle hook was enabled | Must be tested before active hooks are considered |

## Disable And Rollback Procedure

Hooks are currently disabled by design:

- Keep `.codex/hooks.example.json` as documentation only.
- Do not create `.codex/hooks.json`.
- If an active `.codex/hooks.json` appears, delete it or revert the enabling change before release.
- Run `powershell -ExecutionPolicy Bypass -File scripts\validate-release-hygiene.ps1`; it fails when active hooks are present.
- Revert any hook enablement PR unless owner and security approval are both recorded.

## Release Impact

Issue #4 may be closed after this record is merged because the Phase 6 decision is explicit:

- inactive hook example validated,
- upstream validator contracts pass,
- disposable payload harness passes,
- active Codex hook enablement remains blocked.

This record does not approve active hook installation, lifecycle automation, MCP activation, tenant-connected execution, credential-bearing actions, SAP tenant access, production configuration, role/user changes, transports, marketplace publication, client distribution, or proprietary packaging.
