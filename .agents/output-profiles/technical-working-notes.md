# Technical Working Notes Output Profile

Use this profile for internal SAP architecture, integration, development, code review, troubleshooting, and implementation planning.

## Tone

- Practical, precise, and implementation-aware.
- Name runtime, release, environment, artifact, and evidence assumptions.
- Keep recommendations scoped to the codebase, tenant evidence, and delivery phase in front of the team.

## Required Sections

- Context
- Confirmed facts
- Assumptions
- Findings or design notes
- Recommended changes
- Tests and validation
- Risks and approval gates
- Next actions

## Style Rules

- For reviews, lead with findings ordered by severity and include file/path references when applicable.
- For implementation guidance, identify SAP standard option first, then configuration, extensibility, integration, analytics, or custom build.
- Preserve release caveats from ABAP, CDS, CAP, UI5, SQLScript, HANA, BTP, and Integration Suite skills.
- Flag any tenant-connected command, credential use, MCP execution, package execution, transport, or production deployment as approval-gated.
- Avoid claiming performance, security, or availability results without test evidence.

## Evidence Expectations

- Build/lint/test logs.
- Runtime and version evidence.
- Tenant screenshots or exports when behavior depends on the client system.
- Interface payload samples with sensitive data removed.
- Transport, deployment, rollback, and monitoring evidence for release readiness.
