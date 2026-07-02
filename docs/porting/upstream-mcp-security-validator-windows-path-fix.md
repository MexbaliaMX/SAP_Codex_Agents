# Upstream MCP Security Validator Windows Path Fix

Date: 2026-07-02

## Problem

Running the upstream validator on Windows reported the SAC MCP source entry as both missing and stale:

```text
plugins\sap-sac-scripting\.mcp.json:sac-mcp: local-source MCP server is missing from SAP MCP inventory
SAP MCP inventory source entry is stale or unused: plugins/sap-sac-scripting/.mcp.json:sac-mcp
```

The inventory key is POSIX-style:

```text
plugins/sap-sac-scripting/.mcp.json:sac-mcp
```

The validator used `path.relative(...)` for `.mcp.json` files, which emits backslashes on Windows.

## Local Fix Applied

File patched in imported upstream source:

```text
.imports/sap-skills-main/sap-skills-main/scripts/validate-mcp-security.mjs
```

Patch intent:

```diff
-  const relPath = path.relative(repoRoot, mcpPath);
+  const relMcpPath = relPath(repoRoot, mcpPath);
```

And then use `relMcpPath` for all `.mcp.json` validation labels and inventory lookups in that loop.

The helper `relPath(...)` already exists in `scripts/lib/validation-utils.mjs` and normalizes separators with:

```js
return path.relative(repoRoot, file).replaceAll(path.sep, "/");
```

## Validation

Both upstream checks now pass from `.imports/sap-skills-main/sap-skills-main`:

```text
node scripts\validate-mcp-security.mjs
node scripts\validate-mcp-env-contracts.mjs
```

## Remaining SAC Decision

This fix only resolves validator path normalization. SAC MCP remains disabled because it is source-installed and tenant-connected. Enabling it still requires source-install evidence, exact commit verification, tenant/security approval, least-privilege review, and explicit approval before any mutating or destructive operation.
