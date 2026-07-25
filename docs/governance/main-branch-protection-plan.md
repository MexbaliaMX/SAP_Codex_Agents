# Main Branch Protection Plan

Date: 2026-07-25

## Scope

This document defines the recommended protection for the future `main` branch. It is a plan only; no GitHub settings were changed while creating it.

## Current Evidence

- Current default branch: `codex/sap-agents-framework-rc-roadmap`.
- Branch protection API result for current default branch: not protected.
- Repository rulesets API result: empty list.
- No local or remote `main` branch existed during the assessment.

## Required Protection Rules

Apply these controls to `main` after it exists remotely and CI passes:

- Require a pull request before merge.
- Require at least one approval.
- Dismiss stale approvals when new commits are pushed.
- Require CODEOWNERS review for protected paths.
- Require all conversations to be resolved before merge.
- Require the `Release Hygiene` status check.
- Require the branch to be up to date before merge.
- Block force pushes.
- Block deletion.
- Prevent direct pushes.
- Apply rules to administrators where organizationally acceptable.

Signed commits are recommended but should not be mandatory unless the repository owner confirms signing readiness for all maintainers and automation.

## Required Status Checks

Required check:

- `Release Hygiene`

Before making it required, confirm the workflow name and check name in GitHub after the first successful run on `main`.

## CODEOWNERS Dependency

Branch protection should require CODEOWNERS review after `.github/CODEOWNERS` is merged. The current CODEOWNERS uses `@MexbaliaMX` as the available repository owner placeholder. Create dedicated reviewer teams later, for example:

- `@MexbaliaMX/release-governance`
- `@MexbaliaMX/security-reviewers`
- `@MexbaliaMX/sap-evidence-reviewers`

Do not invent or reference those teams in active CODEOWNERS until they exist.

## Manual GitHub UI Steps

1. Open the repository settings.
2. Go to Branches or Rulesets, depending on the GitHub UI available to the owner.
3. Create a rule for branch name pattern `main`.
4. Enable pull request requirement with one approval.
5. Enable stale approval dismissal.
6. Enable CODEOWNERS review requirement.
7. Enable conversation resolution requirement.
8. Add required status check `Release Hygiene` after confirming the exact check name.
9. Enable up-to-date branch requirement if it does not block urgent owner-approved hotfixes.
10. Disable force pushes and branch deletion.
11. Restrict direct pushes.
12. Decide whether administrators are included.
13. Save the rule and record the setting change in `docs/validation/repository-governance-validation.md`.

## Validation After Configuration

After owner applies protection:

```powershell
gh api repos/MexbaliaMX/SAP_Codex_Agents/branches/main/protection
gh api repos/MexbaliaMX/SAP_Codex_Agents/rulesets
```

Record the exact output or screenshots in the governance validation record. Do not report protection as active until GitHub evidence confirms it.
