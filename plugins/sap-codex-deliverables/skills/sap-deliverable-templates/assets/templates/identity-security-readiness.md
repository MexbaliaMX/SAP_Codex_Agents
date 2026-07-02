# Identity Security Readiness

Use for SAP Cloud Identity Services, IAS, IPS, BTP trust, SSO, and role mapping reviews.

## Readiness Status

| Field | Value |
|---|---|
| Scope | IAS / IPS / BTP trust / Role mapping / App auth |
| Protocol | SAML / OIDC / Mixed / Unknown |
| Recommendation | Green / Amber / Red |
| Main risk | [Summary] |

## Findings

| Area | Finding | Impact | Evidence needed | Recommendation | Owner |
|---|---|---|---|---|---|
| Trust | [Finding] | [Impact] | [Evidence] | [Action] | [Owner] |
| Mapping | [Finding] | [Impact] | [Evidence] | [Action] | [Owner] |
| Provisioning | [Finding] | [Impact] | [Evidence] | [Action] | [Owner] |
| Certificates | [Finding] | [Impact] | [Evidence] | [Action] | [Owner] |
| Roles | [Finding] | [Impact] | [Evidence] | [Action] | [Owner] |
| Operations | [Finding] | [Impact] | [Evidence] | [Action] | [Owner] |

## Safe Verification Steps

1. Compare affected and unaffected users without changing configuration.
2. Confirm user and group membership in the identity source.
3. Check IPS job result and transformation output for the same users.
4. Confirm BTP trust origin and role collection group mapping.
5. Inspect sanitized SAML/JWT claims for subject, email, and groups.
6. Validate fallback admin access before certificate or trust changes.
7. Plan certificate rotation with rollback and monitoring.

## Pending Tenant Checks

| Check | Evidence | Owner | Status |
|---|---|---|---|
| IdP origin alignment | [Screenshot/export] | [Owner] | Pending |
| Group claim release | [Sanitized assertion/token] | [Owner] | Pending |
| Role collection mapping | [Export/screenshot] | [Owner] | Pending |
| IPS provisioning result | [Job log] | [Owner] | Pending |
| Certificate expiry and rotation plan | [Metadata/change plan] | [Owner] | Pending |