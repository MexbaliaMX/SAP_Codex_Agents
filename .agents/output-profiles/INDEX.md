# SAP Output Profiles

Use these profiles to shape SAP agent outputs for different audiences while preserving the same evidence discipline.

## Profiles

| Profile | Use |
|---|---|
| `executive-spanish.md` | Client-facing executive Spanish outputs for decisions, readiness, risks, and next actions |
| `technical-working-notes.md` | Internal technical design, build, review, and troubleshooting notes |
| `evidence-bound-audit.md` | Readiness, compliance-sensitive, security, fiscal, and go-live outputs that require strict evidence separation |

## Common Rules

- Separate confirmed facts, assumptions, open validation items, risks, owners, and next actions.
- Use SAP S/4HANA process language before legacy module names.
- Mark tenant, product, licensing, API, roadmap, fiscal/legal, security, and production-readiness gaps explicitly.
- Do not imply SAP tenant validation, legal/tax approval, security approval, or go-live approval without supplied evidence.
- Keep production-impacting recommendations approval-gated.
