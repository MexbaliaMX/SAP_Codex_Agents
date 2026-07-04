# Plugin-Safe Operating Layer Packaging

## Decision

The SAP Agent operating layer has been started as a plugin-safe asset set inside the repo-local `sap-codex-deliverables` plugin.

The workspace source remains authoritative for editing:

- `.agents/AGENT_REGISTRY.md`
- `.agents/playbooks`
- `.agents/output-profiles`
- `.agents/samples/client-ready`
- `.agents/automation-candidates.md`

The plugin copy is generated into:

- `plugins/sap-codex-deliverables/skills/sap-deliverable-templates/assets/operating-layer`

## Generation

Run:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\package-operating-layer-assets.ps1
```

The generator copies the workspace operating layer into plugin-local paths and rewrites references such as `.agents/playbooks` to `assets/operating-layer/playbooks`.

## Validation

Run:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\validate-plugin-operating-layer-assets.ps1
```

The validator checks:

- Plugin-local registry exists.
- Seven playbooks exist.
- Four output profile files exist.
- Eight client-ready sample files exist.
- Coverage and forward-test references exist.
- No stale `.agents/...` paths remain in plugin operating-layer assets.
- No TODO/TBD/FIXME markers or control characters remain.

## Safety Boundary

The packaged operating layer is advisory. It does not enable MCP servers, hooks, tenant access, credentials, package execution, production transports, fiscal/legal approval, security approval, or production-readiness approval.

Client-ready samples remain anonymized examples. Replace all assumptions, dates, owners, evidence, system details, and recommendations with confirmed client facts before use.
