# Sample Identity Security Readiness

Fictional sample for template demonstration only. No real IAS, IPS, or BTP tenant was accessed.

## Readiness Status

| Field | Value |
|---|---|
| Scope | IAS trust, IPS provisioning, BTP role mapping |
| Protocol | SAML for launchpad, OIDC for CAP service |
| Recommendation | Amber |
| Main risk | Group claim and role collection mapping need proof with affected and unaffected users |

## Findings

| Area | Finding | Impact | Evidence needed | Recommendation | Owner |
|---|---|---|---|---|---|
| Trust | QA subaccount trust points to correct IAS tenant, but fallback admin evidence is missing | Recovery risk during trust changes | Admin assignment screenshot and break-glass procedure | Confirm fallback admin before any certificate or trust change | Security lead |
| Mapping | Business users rely on `MX_BILLING_USERS` group claim | Missing group claim would block Fiori access | Sanitized assertion/token for test user | Validate group release and role collection mapping | Security lead |
| Provisioning | IPS job status reviewed but transformation output not sampled | Incorrect attributes may propagate silently | IPS job log and transformed user sample | Compare affected and unaffected users | Identity admin |
| Certificates | Certificate expiry is beyond go-live but rotation plan is not documented | Future outage risk | Metadata export and rotation calendar | Add certificate rotation owner and rehearsal date | Basis lead |
| Roles | Support role collection appears broader than business role | Excessive access risk | Role collection export | Split support and business access before PRD | Security lead |
| Operations | Support escalation path exists but has not been tested | Delayed incident recovery | Test escalation record | Run one access incident drill | Operations lead |

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
| IdP origin alignment | IAS trust screenshot and subaccount origin | Security lead | Pending |
| Group claim release | Sanitized assertion/token | Security lead | Pending |
| Role collection mapping | Role collection export | Security lead | Pending |
| IPS provisioning result | Job log and transformation output | Identity admin | Pending |
| Certificate expiry and rotation plan | Metadata export and rotation calendar | Basis lead | Pending |