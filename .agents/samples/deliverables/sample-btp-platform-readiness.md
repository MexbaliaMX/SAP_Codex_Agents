# Sample BTP Platform Readiness

Fictional sample for template demonstration only. No real BTP tenant was accessed.

## Readiness Status

| Field | Value |
|---|---|
| Global account / subaccount | DemoCorp MX / demo-mx-qa |
| Region | us10 |
| Environments | DEV / QA |
| Runtime | Cloud Foundry |
| Recommendation | Amber |

## Platform Prerequisites

| Category | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| Account model | Directory/subaccount/environment model approved | Architecture note | Platform owner | Green |
| Entitlements | Required services, plans, and quotas assigned | Entitlement export | Platform owner | Green |
| Identity | Trust, groups, role collections, and fallback admin validated | IAS trust screenshot | Security lead | Amber |
| Connectivity | Cloud Connector, destinations, DNS, firewall, and auth validated | Destination test list | Connectivity lead | Amber |
| Deployment | CF org/spaces, pipeline, build, deploy, rollback defined | Pipeline run log | DevOps lead | Green |
| Operations | Monitoring, audit, logging, backup, support, FinOps ready | Operations checklist | Operations lead | Amber |

## Workload Acceptance

| Workload | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| CAP | Service deploys, binds to HANA/XSUAA, auth works | QA deploy log | CAP lead | Green |
| Fiori | App builds and is reachable through target shell/repository | Launchpad screenshot | Fiori lead | Green |
| HANA Cloud | Instance sized, bound, backed up, and access tested | Instance and backup evidence | DBA lead | Amber |
| Integration Suite | Required capability and package deploy tested | Package import log | Integration lead | Amber |
| Destinations | S/4HANA destination works with intended authentication | Destination check result | Connectivity lead | Amber |
| Transports | DEV to QA transport path is proven before PRD | Transport log | Release manager | Green |