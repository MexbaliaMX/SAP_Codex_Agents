# BTP Platform Readiness

Use for SAP BTP subaccount and workload readiness reviews.

## Readiness Status

| Field | Value |
|---|---|
| Global account / subaccount | [Name] |
| Region | [Region] |
| Environments | DEV / QA / PRD |
| Runtime | Cloud Foundry / Kyma / Other |
| Recommendation | Green / Amber / Red |

## Platform Prerequisites

| Category | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| Account model | Directory/subaccount/environment model approved | [Evidence] | [Owner] | Red / Amber / Green |
| Entitlements | Required services, plans, and quotas assigned | [Evidence] | [Owner] | Red / Amber / Green |
| Identity | Trust, groups, role collections, and fallback admin validated | [Evidence] | [Owner] | Red / Amber / Green |
| Connectivity | Cloud Connector, destinations, DNS, firewall, and auth validated | [Evidence] | [Owner] | Red / Amber / Green |
| Deployment | CF org/spaces, pipeline, build, deploy, rollback defined | [Evidence] | [Owner] | Red / Amber / Green |
| Operations | Monitoring, audit, logging, backup, support, FinOps ready | [Evidence] | [Owner] | Red / Amber / Green |

## Workload Acceptance

| Workload | Acceptance criterion | Evidence | Owner | Status |
|---|---|---|---|---|
| CAP | Service deploys, binds to HANA/XSUAA, auth works | [Evidence] | [Owner] | Red / Amber / Green |
| Fiori | App builds and is reachable through target shell/repository | [Evidence] | [Owner] | Red / Amber / Green |
| HANA Cloud | Instance sized, bound, backed up, and access tested | [Evidence] | [Owner] | Red / Amber / Green |
| Integration Suite | Required capability and package deploy tested | [Evidence] | [Owner] | Red / Amber / Green |
| Destinations | S/4HANA destination works with intended authentication | [Evidence] | [Owner] | Red / Amber / Green |
| Transports | DEV to QA transport path is proven before PRD | [Evidence] | [Owner] | Red / Amber / Green |