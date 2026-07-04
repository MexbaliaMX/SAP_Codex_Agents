# Plugin Operating Layer App Smoke Report

Date: 2026-07-04

## Scope

Manual Codex app plugin smoke for the refreshed repo-local `sap-codex-deliverables` plugin after adding plugin-safe operating-layer assets.

The refreshed archive is:

- `sap-codex-deliverables-v0.1.0.zip`
- SHA256: `27114A99F8B9C43FDFD69BE6A609C86FB032FEAAE2A68D2D0B6CFAEC42FC0660`

## Result

Status: pass.

Confirmed from this Codex session:

- The repo-local plugin URL was opened successfully through the Codex app:
  `codex://plugins/sap-codex-deliverables?marketplacePath=C%3A%5Ccodex%5CSAP%20Agents%5Cmarketplace.json`
- Refreshed archive smoke passed with `scripts/test-release-archive.ps1`.
- Extracted archive plugin operating-layer validation passed.
- Packaged `sap-deliverable-templates` skill validation passed.
- `sap-codex-deliverables` plugin validation passed.
- Fresh Codex thread `019f2e12-ca39-7610-8cb3-c14f4ddec2d0` completed the O2C Mexico Fit-to-Standard prompt and produced `docs/deliverables/o2c-mexico-fit-to-standard-summary.md`.
- Fresh Codex thread `019f2e13-2ede-73d3-ba0c-d609e8060e72` completed the anonymized S/4HANA Mexico go-live readiness prompt and produced `docs/deliverables/anonymized-s4hana-mexico-go-live-readiness-recommendation.md`.

Fresh-thread output confirmation:

- Both fresh threads reported use of `sap-deliverable-templates` and operating-layer assets.
- The O2C output references plugin-local playbook, executive Spanish profile, and fit-to-standard template assets.
- The go-live output references the go-live readiness playbook and `evidence-bound-audit` profile.
- Both outputs separate confirmed facts, assumptions, pending validations, risks, owners, and next actions.
- Mexico fiscal topics are treated as validation items, including CFDI, complementos de pago, Carta Porte, SAT evidence, XML/PDF evidence, cancellation/reissue, reconciliation, and auditability.
- Neither output claims live tenant behavior, legal/tax approval, security approval, licensing approval, go-live approval, or production readiness.
- No active MCP or hook execution was introduced.

## Smoke Prompts

Prompt 1:

```text
Use sap-deliverable-templates to draft an O2C Mexico fit-to-standard summary using the operating-layer playbooks. Mark assumptions and validation gaps.
```

Prompt 2:

```text
Use sap-deliverable-templates and the evidence-bound audit profile to draft a go-live readiness recommendation for an anonymized S/4HANA Mexico release. Mark pending tenant, fiscal/legal, security, and production approval items.
```

## Expected Output Characteristics

The output should:

- Use plugin-local operating-layer concepts from `assets/operating-layer`.
- Avoid stale `.agents/...` path references in user-facing text.
- Separate confirmed facts, assumptions, validation gaps, risks, owners, and next actions.
- Keep CFDI, complementos de pago, Carta Porte, SAT evidence, and Mexico fiscal items as validation topics unless evidence is supplied.
- Avoid claiming live tenant behavior, legal/tax approval, security approval, licensing approval, go-live approval, or production readiness.
- Preserve MCP and hook execution as disabled/pending.

## Caveats

- No live SAP tenant validation was performed.
- No fiscal, legal, security, licensing, or production-readiness approval is implied.
- The fresh-thread outputs are local smoke artifacts, not client-approved deliverables.
- PowerShell console rendering displayed mojibake for accented Spanish in one readback, but UTF-8 file readback confirmed the Markdown content is encoded correctly.

## Recommendation

Treat the refreshed plugin-safe operating layer as app-smoke validated for local workspace use and internal review packaging. Rerun this smoke after changing plugin assets, archive contents, or marketplace/plugin loading behavior.
