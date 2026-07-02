# Sample SAP Delivery RAID Log

Fictional sample for template demonstration only.

## Risks

| ID | Risk | Impact | Probability | Severity | Mitigation | Owner | Due date | Status |
|---|---|---|---|---|---|---|---|---|
| R-001 | Mexico fiscal scenarios are not validated before UAT | UAT defects may block billing signoff | Medium | High | Run CFDI and payment complement sample pack before UAT entry | Tax lead | 2026-07-09 | Open |
| R-002 | Identity group mapping is not aligned with business roles | Users may miss Fiori access in QA | Medium | Medium | Compare IAS groups to role collections before transport | Security lead | 2026-07-10 | Open |

## Assumptions

| ID | Assumption | Impact if false | Validation evidence | Owner | Due date | Status |
|---|---|---|---|---|---|---|
| A-001 | QA tenant configuration will be stable for UAT week 1 | Retesting and schedule slip | Change freeze approval | PMO | 2026-07-08 | Open |
| A-002 | Carrier master data includes required tax identifiers | Carta Porte testing blocked | Master data extract | Logistics lead | 2026-07-09 | Open |

## Issues

| ID | Issue | Impact | Severity | Resolution plan | Owner | Due date | Status |
|---|---|---|---|---|---|---|---|
| I-001 | Payment complement ownership unresolved | AR/tax handoff unclear | High | Confirm RACI and update workshop decision log | AR lead | 2026-07-10 | Open |

## Dependencies

| ID | Dependency | Needed by | Provider | Due date | Risk if late | Status |
|---|---|---|---|---|---|---|
| D-001 | QA role collection export | Security testing | Basis/security team | 2026-07-08 | UAT users cannot validate access | Open |
| D-002 | Integration endpoint allowlist | Integration test cycle | Network team | 2026-07-09 | iFlow connectivity test blocked | Open |