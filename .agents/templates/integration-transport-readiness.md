# Integration Transport Readiness

Use for SAP Integration Suite iFlow/API/Event transport readiness.

## Readiness Status

| Field | Value |
|---|---|
| Artifact / package | [Name] |
| Source environment | [DEV / QA] |
| Target environment | [QA / PRD] |
| Recommendation | Green / Amber / Red |
| Transport decision | Approve / Approve with conditions / Block |

## Mandatory Acceptance Checklist

| Area | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| Adapters | Sender and receiver adapter settings reviewed | [Export / screenshot] | [Owner] | Red / Amber / Green |
| Authentication | Inbound and outbound auth methods approved | [Evidence] | [Owner] | Red / Amber / Green |
| Credentials | Credential aliases exist in target and no secrets are embedded | [Evidence] | [Owner] | Red / Amber / Green |
| Certificates / known hosts | SFTP known hosts, certificates, or keys validated | [Evidence] | [Owner] | Red / Amber / Green |
| Externalized parameters | DEV/QA/PRD values documented | [Matrix] | [Owner] | Red / Amber / Green |
| Mapping | Positive and negative mapping tests passed | [Test log] | [Owner] | Red / Amber / Green |
| Error handling | Exception subprocess and error classifications defined | [Design / test] | [Owner] | Red / Amber / Green |
| Retry / idempotency | Retry behavior will not duplicate, overwrite, or corrupt output | [Test] | [Owner] | Red / Amber / Green |
| Observability | MPL properties, correlation ID, alerts, and runbook ready | [Evidence] | [Owner] | Red / Amber / Green |
| Transport dependencies | Scripts, mappings, value mappings, and package metadata included | [Transport list] | [Owner] | Red / Amber / Green |

## Runtime Checks Pending

| Check | Target environment | Owner | Status |
|---|---|---|---|
| Connectivity test | [QA / PRD] | [Owner] | Pending |
| Failed-message retry test | [QA / PRD] | [Owner] | Pending |
| Alert routing test | [QA / PRD] | [Owner] | Pending |