# Plugin Bundle

The SAP deliverable template and sample layer is packaged as a repo-local Codex plugin bundle.

## Bundle

| Field | Value |
|---|---|
| Plugin name | `sap-codex-deliverables` |
| Plugin path | `plugins/sap-codex-deliverables` |
| Marketplace file | `marketplace.json` |
| Packaged skill | `sap-deliverable-templates` |

## Contents

- `.codex-plugin/plugin.json` defines the plugin manifest.
- `skills/sap-deliverable-templates/SKILL.md` provides usage instructions and safety rules.
- `skills/sap-deliverable-templates/assets/templates` contains blank Markdown templates.
- `skills/sap-deliverable-templates/assets/samples` contains fictional filled sample deliverables.
- `skills/sap-deliverable-templates/references` contains the template catalog, sample catalog, and forward-test report.
- `skills/sap-deliverable-templates/scripts` carries the generation scripts used by the workspace port.

## Installation Notes

This bundle uses a repo-local marketplace file at `marketplace.json`. The marketplace entry points to `./plugins/sap-codex-deliverables`, so the marketplace root is the repository root.

For non-default marketplace installation, add the repository root as the marketplace root in Codex. Do not move `marketplace.json` into a subfolder unless the plugin source path is updated at the same time.

## Validation

- `quick_validate.py` passed for the packaged `sap-deliverable-templates` skill.
- `validate_plugin.py` passed for `plugins/sap-codex-deliverables`.
- No scaffold placeholder text remains in the plugin manifest or skill.
- Fresh-session smoke test report: `docs/validation/plugin-bundle-fresh-smoke-test-report.md`
