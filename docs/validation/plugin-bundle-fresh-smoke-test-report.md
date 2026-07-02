# Plugin Bundle Fresh Smoke Test Report

Date: 2026-07-02

## Scope

Fresh-session smoke-tested the repo-local `sap-codex-deliverables` plugin bundle from a separate Codex thread.

Tested targets:

- `marketplace.json`
- `plugins/sap-codex-deliverables/.codex-plugin/plugin.json`
- `plugins/sap-codex-deliverables/skills/sap-deliverable-templates`

## Result

PASS with install-surface caveat.

The fresh thread confirmed:

- The marketplace entry for `sap-codex-deliverables` points to `./plugins/sap-codex-deliverables`.
- The plugin manifest declares `skills: "./skills/"`.
- The packaged skill `sap-deliverable-templates` has frontmatter and workflow instructions.
- Bundled go-live readiness template/sample assets are usable for drafting a short readiness checklist excerpt.

## Finding Fixed

The fresh thread found stale path wording in packaged reference files, where copied references still mentioned workspace paths such as `.agents/templates`, `.agents/samples`, and `docs/...`.

Fix applied:

- Updated packaged `references/template-library.md` to use `assets/templates`, `assets/samples`, and plugin-local `references/...`.
- Updated packaged `references/sample-deliverables.md` to use `assets/samples`.
- Updated packaged `references/template-forward-test-report.md` to avoid workspace-only paths.

## Smoke Output Shape

The fresh thread drafted a go-live readiness excerpt with:

- Confirmed facts separated from assumptions.
- Workstream readiness rows for cutover, data, integrations, security, and Mexico fiscal/compliance.
- Pending tenant, fiscal/legal, security, and go/no-go validation explicitly marked.
- Risk statement warning against go-live recommendation without evidence.

## Validation After Fix

- Passed: packaged skill validates with `quick_validate.py`.
- Passed: plugin validates with `validate_plugin.py`.
- Passed: plugin bundle has 11 packaged templates and 11 packaged samples.
- Passed: no stale `.agents/...` or `docs/...` paths remain inside packaged plugin references.

## Caveat

No direct Codex app-level plugin install/load tool was exposed in this session. This test validates the repo-local marketplace/plugin files and fresh-thread use of the packaged skill assets, but not a manual click-through install in the Codex app UI.
