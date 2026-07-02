# Sample Integration Transport Readiness

Fictional sample for template demonstration only. No real Integration Suite tenant was accessed.

## Readiness Status

| Field | Value |
|---|---|
| Artifact / package | DEMO_MX_Billing_Ack_iFlow |
| Source environment | DEV |
| Target environment | QA |
| Recommendation | Amber |
| Transport decision | Approve with conditions |

## Mandatory Acceptance Checklist

| Area | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| Adapters | Sender and receiver adapter settings reviewed | DEV export and peer review | Integration lead | Green |
| Authentication | Inbound and outbound auth methods approved | Auth design note | Security lead | Green |
| Credentials | Credential aliases exist in target and no secrets are embedded | QA alias checklist | Basis lead | Amber |
| Certificates / known hosts | SFTP known hosts, certificates, or keys validated | Known-host export | Integration lead | Amber |
| Externalized parameters | DEV/QA/PRD values documented | Parameter matrix | Release manager | Green |
| Mapping | Positive and negative mapping tests passed | QA mapping test log | Test manager | Green |
| Error handling | Exception subprocess and error classifications defined | iFlow design screenshot | Integration lead | Green |
| Retry / idempotency | Retry behavior will not duplicate, overwrite, or corrupt output | Negative retry test pending | Integration lead | Amber |
| Observability | MPL properties, correlation ID, alerts, and runbook ready | Monitoring checklist | Operations lead | Amber |
| Transport dependencies | Scripts, mappings, value mappings, and package metadata included | Transport list | Release manager | Green |

## Runtime Checks Pending

| Check | Target environment | Owner | Status |
|---|---|---|---|
| Connectivity test | QA | Integration lead | Pending |
| Failed-message retry test | QA | Integration lead | Pending |
| Alert routing test | QA | Operations lead | Pending |