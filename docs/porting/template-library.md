# Template Library

The Codex SAP port includes a shared template layer at `.agents/templates`.

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

- Forward-test report: `docs/validation/template-forward-test-report.md`

## Filled Samples

- Sample catalog: `docs/porting/sample-deliverables.md`
- Sample files: `.agents/samples/deliverables`

## Plugin Bundle

- Bundle notes: `docs/porting/plugin-bundle.md`
- Plugin path: `plugins/sap-codex-deliverables`
- Marketplace file: `marketplace.json`
- Fresh smoke test: `docs/validation/plugin-bundle-fresh-smoke-test-report.md`
