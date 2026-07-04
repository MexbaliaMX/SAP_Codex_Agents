# Process Diagnostic Playbook

Use this playbook when the user needs to diagnose pain points, process failures, controls, data issues, adoption gaps, reporting gaps, or improvement opportunities in an SAP business process.

## Routing

1. Start with the relevant process skill.
2. Add an SAP Activate phase skill when the diagnostic must feed project governance:
   - Discover for pre-project opportunity and feasibility.
   - Prepare for readiness and setup.
   - Explore for fit/gap and backlog.
   - Realize for build/test defects.
   - Deploy for go-live risks.
   - Run for incidents and continuous improvement.
3. Add technical skills only after process, data, integration, control, and reporting impacts are clear.
4. Use `assets/templates/process-diagnostic-summary.md` for the output.

## Required Inputs

- Business outcome and pain point.
- Current and target process boundary.
- Legal entity, country, and organization scope.
- Trigger, documents, approvals, master data, handoffs, reports, and controls.
- Integration points and known failure modes.
- Available evidence: screenshots, logs, extracts, workshop notes, test defects, incidents, or configuration exports.

## Diagnostic Flow

1. State confirmed facts and missing evidence.
2. Map trigger to outcome, including documents, approvals, handoffs, controls, and audit evidence.
3. Classify issues as process, data, integration, control, adoption, reporting, governance, or technical.
4. Identify SAP standard capability candidates before extension or custom build.
5. For Mexico scenarios, identify fiscal evidence and audit chain implications.
6. Convert findings into decisions, risks, validation steps, and backlog items.

## Approval Gates

- Process redesign decisions.
- Control or segregation-of-duties changes.
- Fiscal/legal conclusions.
- Production configuration, integration, or security changes.
- Custom build recommendation.

## Output Shape

- Executive summary.
- Confirmed facts.
- Assumptions and scope boundary.
- Current-state and target-state process summary.
- Findings by category.
- Risks and controls.
- SAP standard candidates and technical follow-ups.
- Validation steps, owners, and next actions.
