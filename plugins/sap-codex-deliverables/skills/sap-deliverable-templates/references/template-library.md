# Template Library

This packaged skill includes SAP deliverable templates under `assets/templates`.

## Template Groups

Consulting and Activate:

- `fit-to-standard-delta-log.md`
- `process-diagnostic-summary.md`
- `raid-log.md`
- `go-live-readiness-checklist.md`
- `hypercare-triage-table.md`

Technical readiness:

- `technical-readiness-review.md`
- `integration-transport-readiness.md`
- `btp-platform-readiness.md`
- `ui5-quality-review.md`
- `identity-security-readiness.md`

## Recommended Use

- Use templates as output scaffolds, not as evidence.
- Keep bracketed placeholders until client-specific facts are available.
- Copy only the sections needed for the current deliverable.
- Use the related process skill or role playbook before filling technical templates.
- Keep MCP, hook, tenant, and credential-dependent checks marked pending unless explicitly validated.

## Validation

- Forward-test report: `references/template-forward-test-report.md`

## Filled Samples

- Sample catalog: `references/sample-deliverables.md`
- Sample files: `assets/samples`

## Plugin Bundle

- Plugin manifest: `.codex-plugin/plugin.json`
- Packaged skill: `skills/sap-deliverable-templates`
- Marketplace file: repo-local `marketplace.json`
