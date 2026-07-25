# sap-codex-deliverables v0.2.0-rc1 Manual Install Load Smoke

Date: 2026-07-25

## Scope

Manual install/load smoke evidence for the published GitHub prerelease asset `sap-codex-deliverables-v0.2.0-rc1.zip`.

This report records the automated validation portion of the manual install/load smoke procedure. Overall app-level status remains pending until Codex desktop plugin installation and fresh-task checks are completed.

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

Overall app-level status: PENDING.

Pending checks:

- Open the extracted marketplace in Codex desktop.
- Install or load `sap-codex-deliverables` from the extracted marketplace.
- Create a fresh Codex task after install/load.
- Confirm the fresh task can use the installed plugin skill or plugin assets.
- Run the go-live readiness smoke prompt from `docs/validation/v0.2.0-rc1-manual-install-load-smoke-procedure.md`.
- Run the authorization review-pack smoke prompt from `docs/validation/v0.2.0-rc1-manual-install-load-smoke-procedure.md`.
- Confirm outputs remain advisory, evidence-bound, and do not claim live SAP tenant validation, fiscal/legal approval, security approval, licensing approval, go-live approval, or production readiness.

## Safety Boundaries

- No live SAP tenant validation was performed.
- No fiscal, legal, security, SAP trademark, SAP documentation redistribution, marketplace, client redistribution, or production-readiness approval is implied.
- Tenant-connected MCPs, hooks, production configuration, direct role/user changes, and transport actions remain blocked without separate explicit approval and environment evidence.
