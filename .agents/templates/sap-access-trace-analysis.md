# SAP Access Trace Analysis

Use for SU53, STAUTHTRACE/ST01-style authorization troubleshooting, Fiori app authorization failures, OData authorization errors, and access test evidence reviews.

## Case Summary

| Field | Value |
|---|---|
| Affected user alias | [Alias only] |
| Environment | [DEV / QA / PRD / Unknown] |
| Business task | [Task] |
| App/transaction/service | [Fiori app / SAP GUI transaction / OData service] |
| Expected outcome | [Allowed / denied / restricted] |
| Current outcome | [Observed result] |

## Evidence Received

| Evidence | Source | Timestamp | Sanitized | Notes |
|---|---|---|---|---|
| [SU53/trace/screenshot/log] | [Owner] | [Time] | Yes / No | [Notes] |

## Trace Findings

| Object/service | Field | Value | Activity | Result | Business justification | Recommendation |
|---|---|---|---|---|---|---|
| [Object/service] | [Field] | [Value] | [ACTVT] | Missing / Failed / Passed | [Task link] | [Action] |

## Decision Guardrails

| Question | Answer | Evidence needed |
|---|---|---|
| Is the requested access tied to an approved business task? | Yes / No / Unknown | [Evidence] |
| Is a narrower value possible? | Yes / No / Unknown | [Org/value evidence] |
| Is there a SoD or audit impact? | Yes / No / Unknown | [Control review] |
| Was a negative test performed? | Yes / No / Unknown | [Denied-user evidence] |
| Is transport or production change approval required? | Yes / No / Unknown | [Approval] |

## Recommended Next Actions

| Priority | Action | Owner | Approval required | Validation |
|---|---|---|---|---|
| High / Medium / Low | [Action] | [Owner] | Yes / No | [Retest/evidence] |
