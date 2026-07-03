# UI5 and CAP Development Review Notes

Playbook: `.agents/playbooks/development-code-review.md`  
Output profile: `.agents/output-profiles/technical-working-notes.md`

## Context

| Field | Value |
|---|---|
| Workload | CAP service with SAPUI5 freestyle application |
| Process | Procure-to-Pay exception dashboard |
| Runtime assumption | CAP Node.js on BTP Cloud Foundry; SAPUI5 version to be confirmed from `package.json` and runtime |
| Evidence reviewed | Repository structure summary, service contract draft, UI route map, test plan |
| Evidence not reviewed | Live build output, dependency lockfile, tenant destination tests, security scan |

## Confirmed facts

- The application exposes supplier invoice exception data through a CAP service.
- UI routing includes list, object detail, and exception action flows.
- No package execution, MCP execution, or tenant-connected test was performed in this review.

## Assumptions

- Authorization must distinguish viewer, processor, and supervisor roles.
- The UI consumes OData from the CAP service through destination or approuter configuration.
- Production deployment is not approved until build, test, security, and transport evidence is provided.

## Findings

| Priority | Finding | Impact | Recommendation | Evidence needed |
|---|---|---|---|---|
| High | Authorization model is described functionally but not tied to technical scopes/roles | Users may see or act on exceptions outside responsibility | Map business roles to CAP scopes and UI action visibility | `xs-security.json`, role matrix, test user evidence |
| High | Error handling for exception action is not fully specified | Failed updates may create unclear business status | Define CAP service errors, UI messages, retry behavior, and audit log entry | Service handler code and negative test |
| Medium | UI route names and object identifiers need stable convention | Harder support and deep-link troubleshooting | Align route names, object keys, and page titles with process terms | Manifest and routing review |
| Medium | Test plan lacks accessibility and regression coverage | Quality gap before user acceptance | Add keyboard navigation, screen-reader labels, and regression tests for critical flows | Test report |

## Recommended changes

1. Add a role/scope mapping table covering viewer, processor, supervisor, and support roles.
2. Define negative-path behavior for failed exception updates, including message text and audit evidence.
3. Confirm destination/approuter pattern with BTP and security owners before QA deployment.
4. Add UI quality checks for routing, binding errors, empty states, accessibility, and performance on large exception lists.

## Tests and validation

| Test | Owner | Status |
|---|---|---|
| CAP unit tests for service validation | Development lead | Pending |
| UI integration test for exception action | UI lead | Pending |
| Authorization test with three user profiles | Security lead | Pending |
| Build/lint output captured in CI | DevOps lead | Pending |
| Destination connectivity test in QA | BTP owner | Pending |

## Risks and approval gates

- Do not deploy to QA until build/lint/test evidence is captured.
- Do not deploy to production until security role mapping and operations handoff are approved.
- Do not run package upgrades or MCP servers without supply-chain and credential review.

## Next actions

| Action | Owner | Date |
|---|---|---|
| Provide `package.json`, lockfile, and build log | Development lead | 2026-07-18 |
| Complete role/scope mapping | Security lead | 2026-07-19 |
| Add negative tests for exception action | CAP developer | 2026-07-22 |
| Run UI accessibility checklist | UI lead | 2026-07-23 |
