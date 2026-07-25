# sap-codex-deliverables v0.2.0-rc1 Manual Install Load Smoke

Date: 2026-07-25

## Scope

Manual install/load smoke evidence for the published GitHub prerelease asset `sap-codex-deliverables-v0.2.0-rc1.zip`.

This report records the automated validation portion and the Codex desktop install/load portion of the manual install/load smoke procedure. Overall app-level status is PASS.

## Release Under Test

| Field | Value |
|---|---|
| Release | `sap-codex-deliverables-v0.2.0-rc1` |
| GitHub release | `https://github.com/MexbaliaMX/SAP_Codex_Agents/releases/tag/sap-codex-deliverables-v0.2.0-rc1` |
| Asset | `sap-codex-deliverables-v0.2.0-rc1.zip` |
| Expected SHA256 | `6BCD9E94BEDA196C149950118AE5B3C4AD794217DB68DBE69F5A4721A8AA053F` |
| Expected size | `1,576,400 bytes` |

## Automated Validation Result

Status: PASS.

| Check | Result | Evidence |
|---|---|---|
| Download | PASS | Downloaded asset size was `1,576,400 bytes` |
| SHA-256 | PASS | Hash matched `6BCD9E94...AA053F` |
| Extraction and required paths | PASS | Required archive paths were present |
| Workspace skills and plugin skill | PASS | All 29 workspace skills and the plugin skill validated |
| Plugin validation | PASS | `sap-codex-deliverables` plugin validation passed |
| Disabled configuration | PASS | Disabled configuration check passed |
| Control-character scan | PASS | No unexpected control characters found |
| GitHub release state | PASS | Release confirmed as a published prerelease |

## Disposable Test Artifacts

The following disposable files remained available for the Codex desktop install/load test at the time of this report:

| Artifact | Path |
|---|---|
| Marketplace | `/tmp/sap-v020-rc1-manual-install-CZqeC89v/marketplace.json` |
| ZIP | `/tmp/sap-v020-rc1-manual-smoke-F0C6KSZV/sap-codex-deliverables-v0.2.0-rc1.zip` |

## Deviation

PowerShell was unavailable in the validation environment. Equivalent substantive validation checks were run with native extraction and `python3`; this deviation is accepted for the automated validation portion because the checks covered download, hash, extraction, required paths, skill validation, plugin validation, disabled configuration, control-character scan, and GitHub prerelease state.

## Remaining Manual Steps

Overall app-level status: PASS.

Completed Codex desktop checks:

- Fresh Codex task: `019f9b20-861d-7f73-b0bd-fdb20ef262f4`.
- Smoke prompt 1: PASS.
- Smoke prompt 2: PASS.
- The installed `sap-codex-deliverables` assets loaded locally.
- The fresh task used `sap-deliverable-templates` and template assets successfully.
- MCP servers, hooks, tenant credentials, live SAP systems, and production actions were not enabled or used.
- Outputs remained advisory and evidence-bound, without live SAP tenant validation, fiscal/legal approval, security approval, licensing approval, go-live approval, or production-readiness claims.

## Desktop Smoke Deviations

- The requested `/tmp/sap-v020-rc1-manual-install-CZqeC89v/marketplace.json` path was not visible from the current Windows/PowerShell environment, though the exact requested `codex://plugins/...` URL was opened successfully.
- The reachable workspace marketplace fallback at `C:\codex\SAP Agents\marketplace.json` was also opened.
- The fresh task confirmed the installed plugin assets loaded locally and completed both smoke prompts.

## Safety Boundaries

- No live SAP tenant validation was performed.
- No fiscal, legal, security, SAP trademark, SAP documentation redistribution, marketplace, client redistribution, or production-readiness approval is implied.
- Tenant-connected MCPs, hooks, production configuration, direct role/user changes, and transport actions remain blocked without separate explicit approval and environment evidence.
