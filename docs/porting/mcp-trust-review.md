# MCP Trust Review

Date: 2026-07-02

## Scope

Reviewed upstream MCP definitions from `.imports/sap-skills-main/sap-skills-main` for Codex-port suitability. No MCP servers were enabled in this workspace.

Reviewed files:

- `.imports/sap-skills-main/sap-skills-main/.mcp.json`
- `.imports/sap-skills-main/sap-skills-main/plugins/sap-cap-capire/.mcp.json`
- `.imports/sap-skills-main/sap-skills-main/plugins/sapui5/.mcp.json`
- `.imports/sap-skills-main/sap-skills-main/plugins/sap-fiori-tools/.mcp.json`
- `.imports/sap-skills-main/sap-skills-main/plugins/sap-hana-cli/.mcp.json`
- `.imports/sap-skills-main/sap-skills-main/plugins/sap-datasphere/.mcp.json`
- `.imports/sap-skills-main/sap-skills-main/plugins/sap-sac-scripting/.mcp.json`

Policy source:

- `.agents/skills/sap-dependency-security/references/sap-mcp-security.md`
- `.agents/skills/sap-dependency-security/references/sap-mcp-inventory.json`
- `.agents/skills/sap-dependency-security/references/sap-dependency-risk-matrix.md`

## Review Rules

- Treat MCP servers as executable dependencies.
- Use exact npm package pins or exact source commit pins.
- Do not enable tenant-connected MCPs without explicit user approval, credential review, and least-privilege role review.
- Keep secrets, service keys, tenant URLs, and OAuth credentials out of committed config.
- Prefer local-only MCPs first.
- Keep mutating/destructive MCP capabilities disabled until tool-level behavior is verified in a non-production tenant.

## Inventory

| Server | Source file | Command | Pin / source | Env vars | Risk class | Decision |
|---|---|---|---|---|---|---|
| `oracle` | root `.mcp.json` | `bun run oracle:mcp` | Root dev dependency `@steipete/oracle` is pinned in upstream `package.json` as `0.14.0` | None in `.mcp.json` | Validation harness / local executable | Do not port to Codex config yet |
| `sap-cap-capire` | `plugins/sap-cap-capire/.mcp.json` | `npx -y @cap-js/mcp-server@0.0.5` | Exact npm pin matches approved inventory | None | Local-only project metadata | Candidate for disabled example config |
| `ui5-tooling` | `plugins/sapui5/.mcp.json` | `npx -y @ui5/mcp-server@0.2.11` | Exact npm pin matches approved inventory | `UI5_MCP_SERVER_RESPONSE_NO_RESOURCES` | Local-only UI5 tooling | Candidate for disabled example config |
| `fiori-tools` | `plugins/sap-fiori-tools/.mcp.json` | `npx --yes @sap-ux/fiori-mcp-server@1.4.0 fiori-mcp` | Exact npm pin matches approved inventory | None | Local-only app generation/tooling | Candidate for disabled example config |
| `hana-mcp-server` | `plugins/sap-hana-cli/.mcp.json` | `npx -y hana-mcp-server@0.3.1` | Exact npm pin matches approved inventory | HANA endpoint/user/password/options | Tenant-connected; may mutate or destroy DB objects depending tools/credentials | Block until explicit HANA tenant approval |
| `sap-datasphere` | `plugins/sap-datasphere/.mcp.json` | `npx -y @mariodefe/sap-datasphere-mcp@1.2.1` | Exact npm pin matches approved inventory; upstream notes later version as upgrade candidate only | Datasphere base URL, OAuth client id/secret, token URL | Tenant-connected; read/mutate/destructive possible | Block until explicit Datasphere tenant approval |
| `sac-mcp` | `plugins/sap-sac-scripting/.mcp.json` | `node ${SAC_MCP_PATH}/build/index.js` | Source commit expected: `2020235505d98111c2889598ab2217c1619b6943`; Windows/POSIX validator path mismatch fixed locally | SAC path, commit, base URL, OAuth client id/secret, token URL | Source-installed tenant-connected; read/mutate/destructive possible | Block until tenant/security approval and source-install evidence |

## Validator Results

Ran in `.imports/sap-skills-main/sap-skills-main`:

- `node scripts/validate-mcp-env-contracts.mjs`: passed.
- `node scripts/validate-mcp-security.mjs`: passed after local upstream validator path-normalization fix.

Security validator path-normalization fix:

- Original finding: `plugins\sap-sac-scripting\.mcp.json:sac-mcp` was reported missing from the SAP MCP inventory while `plugins/sap-sac-scripting/.mcp.json:sac-mcp` was reported stale or unused.
- Root cause: Windows path separators from `path.relative(...)` were compared directly against POSIX-style inventory keys.
- Fix applied in the imported upstream validator: `.mcp.json` paths now use the existing `relPath(...)` helper before inventory lookup.

Assessment: SAC MCP remains blocked because it is tenant-connected and source-installed, not because of an inventory validator mismatch.

## Trust Decisions

Approved for config-template candidates, still disabled by default:

- `sap-cap-capire`
- `ui5-tooling`
- `fiori-tools`

Blocked pending explicit tenant/security approval:

- `hana-mcp-server`
- `sap-datasphere`
- `sac-mcp`

Excluded from SAP Codex client-deliverable config for now:

- `oracle`

## Required Conditions Before Enabling Any MCP

For local-only candidates:

- Confirm Node/npm availability in the target environment.
- Keep exact package pins.
- Prefer reviewed local installation or allow `npx` only after package trust review.
- Run a smoke test in a disposable workspace.

For tenant-connected candidates:

- Confirm package/source trust and exact pin.
- Confirm least-privilege credentials and scope.
- Use non-production tenant first.
- Record owner, environment, approval, rollback path, and tool categories.
- Require explicit approval before any mutating or destructive operation.
- Never commit secrets, service keys, tenant URLs with sensitive paths, or local install records.

For SAC source MCP:

- Verify `SAC_MCP_PATH` points to the trusted `secondsky/sap_analytics_cloud_mcp` checkout.
- Verify `SAC_MCP_COMMIT` equals `2020235505d98111c2889598ab2217c1619b6943`.
- Build with lifecycle-script controls and audit the checkout before use.

## Recommendation

Create `.codex/config.toml.example` only for the three local-only MCP candidates, and keep every server commented or clearly disabled. Tenant-connected MCPs should remain documented as blocked candidates until tenant approval and credential review are complete.
