# Plugin Operating Layer App Smoke Report

Date: 2026-07-05

## Scope

Manual Codex app plugin smoke for the refreshed repo-local `sap-codex-deliverables` plugin after adding plugin-safe operating-layer assets, plus release-record reconciliation for the GPL-3.0-only advisory RC branch.

The refreshed archive is:

- `sap-codex-deliverables-v0.1.0.zip`
- Final SHA256 is recorded from the post-build archive smoke output; the in-archive report intentionally avoids a self-referential checksum.

## Result

Status: pass.

Confirmed from this Codex session:

- The repo-local plugin URL was opened successfully through the Codex app:
  `codex://plugins/sap-codex-deliverables?marketplacePath=C%3A%5Ccodex%5CSAP%20Agents%5Cmarketplace.json`
- The repo-local plugin URL was opened again after regenerating the archive with current validation documentation.
- Refreshed archive smoke passed with `scripts/test-release-archive.ps1`.
- Extracted archive plugin operating-layer validation passed.
- Packaged `sap-deliverable-templates` skill validation passed.
- `sap-codex-deliverables` plugin validation passed.
- Fresh Codex thread `019f2e12-ca39-7610-8cb3-c14f4ddec2d0` completed the O2C Mexico Fit-to-Standard prompt and produced `docs/deliverables/o2c-mexico-fit-to-standard-summary.md`.
- Fresh Codex thread `019f2e13-2ede-73d3-ba0c-d609e8060e72` completed the anonymized S/4HANA Mexico go-live readiness prompt and produced `docs/deliverables/anonymized-s4hana-mexico-go-live-readiness-recommendation.md`.
- Fresh Codex thread `019f2e40-4036-7fa1-bc30-a581d1f763e2` completed a go-live readiness rerun after the archive refresh. It confirmed the plugin-local skill/assets were available and used, ran plugin asset validation, and produced an evidence-bound Spanish recommendation without approval claims.
- Fresh Codex thread `019f2e3f-8728-72e0-9e69-9425ce099d05` completed the O2C Mexico rerun after a follow-up to skip additional commands. It confirmed the plugin-local skill/assets were available and used, produced an evidence-bound Spanish O2C summary, and reported plugin asset validation passed. Its in-thread archive smoke timed out, so archive validation is counted from the main-thread `scripts/test-release-archive.ps1` pass instead.
- Fresh Codex thread `019f2e46-e707-7203-a297-7f03050da78a` completed a no-shell delegated O2C rerun, but the delegated MCP resource surface did not expose `sap-deliverable-templates`; it is recorded as a plugin-surface limitation, not a pass.
- GPL-3.0-only release planning changed source governance files only; it did not enable MCP servers, hooks, tenant execution, or plugin runtime behavior.

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
- No fiscal, legal, security, third-party notice, redistribution, or production-readiness approval is implied.
- The fresh-thread outputs are local smoke artifacts, not client-approved deliverables.
- PowerShell console rendering displayed mojibake for accented Spanish in one readback, but UTF-8 file readback confirmed the Markdown content is encoded correctly.

## Recommendation

Treat the refreshed plugin-safe operating layer as app-smoke validated for local workspace use, internal review packaging, and GPL-3.0-only public source advisory RC review based on successful plugin URL launch, archive smoke, plugin validation, and completed go-live output rerun. Rerun app-level smoke after changing plugin assets, marketplace/plugin loading behavior, or enabled runtime behavior, and use the Codex app plugin surface rather than delegated MCP resources when confirming skill exposure.
