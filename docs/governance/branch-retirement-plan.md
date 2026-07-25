# Branch Retirement Plan

Date: 2026-07-25

Status: proposed plan; no branch deletion executed

## Purpose

Define a controlled branch-retirement process after the repository default branch moved to `main`.

This plan does not authorize branch deletion by itself. Every remote branch deletion still requires owner approval immediately before execution.

## Current Confirmed State

| Item | Value |
|---|---|
| GitHub default branch | `main` |
| Remote HEAD | `refs/heads/main` |
| `main` commit | `c95e00c1d06efe34246d19a8d1b2368cf9e3b3e1` |
| `origin/chore/release-hygiene-advisory-rc` | `c95e00c1d06efe34246d19a8d1b2368cf9e3b3e1` |
| Open PRs during assessment | PR #12 from `docs/record-main-branch-transition` to `main` |
| Release tag retained | `sap-codex-deliverables-v0.2.0-rc1` remains reachable from `main` |

Local note: `origin/HEAD` in the local checkout still displayed the former symbolic ref until local remote-head metadata is refreshed. The remote `HEAD` itself resolves to `refs/heads/main`.

## Retirement Principles

- Never rewrite public history.
- Never use force push.
- Do not delete branches with open PRs.
- Do not delete branches referenced by active worktrees.
- Do not delete branches with unique commits unless the owner explicitly accepts abandoning them.
- Preserve release tags and release assets.
- Keep advisory-only boundaries: no SAP tenant access, no MCP activation, no hook activation, no credentials, no production action.
- Prefer a cooldown period after default-branch migration before deleting former default or release branches.

## Branch Inventory And Recommendation

| Branch | Relationship to `main` | Current use | Recommendation |
|---|---|---|---|
| `origin/main` | Current default; authoritative | Protected default branch | Retain. |
| `origin/docs/record-main-branch-transition` | 1 commit ahead of `main` | Open PR #12 | Retain until PR #12 is merged or closed. |
| `origin/chore/repository-governance-v0.2.0` | Fully merged; 4 commits behind `main`, 0 unique | PR #10 source branch | Delete after PR #12 is merged and owner approves normal PR branch cleanup. |
| `origin/chore/main-branch-transition-v0.2.0` | Fully merged; 2 commits behind `main`, 0 unique | PR #11 source branch | Delete after PR #12 is merged and owner approves normal PR branch cleanup. |
| `origin/codex/sap-agents-framework-rc-roadmap` | 12 commits behind `main`, 0 unique | Former default branch | Archive temporarily. Delete only after a cooldown and owner confirmation that no docs, users, or automation still depend on it. |
| `origin/chore/release-hygiene-advisory-rc` | Same commit as `main` | Former release-governance branch | Retain through v0.2.0 final posture decision. Reassess after final release or corrective RC decision. |
| `origin/codex/gpl-provenance-review` | 39 commits behind `main`, 0 unique | Stale provenance branch | Candidate for deletion after license/provenance records are confirmed reachable from `main` and owner approves. |
| local `master` | Merged into `main` | Local-only branch; detached worktrees point at its commit | Retain locally until worktree users confirm it can be removed. No remote action. |
| local `chore/release-hygiene-advisory-rc` | 5 commits behind and 1 commit ahead of `origin/chore/release-hygiene-advisory-rc` | Local-only divergent branch with temporary artifacts | Do not push. Resolve separately before local cleanup. |

## Special Case: Local Divergent Release-Hygiene Branch

Local branch `chore/release-hygiene-advisory-rc` has commit:

```text
390de4ad192afcb4371557d143a45188716c3484 Preserve PowerShell formatting in manual smoke procedure
```

The commit includes a useful-looking documentation change, but also includes temporary render artifacts:

- `sap_codex_agents_qr.png`
- `tmp/pdfs/review-renders/*.png`
- `tmp/pdfs/ts410_review/*.png`

Recommended handling:

1. Do not push the local branch.
2. Review whether `docs/roadmap/eut-kt-future-uses.md` is intentional.
3. If intentional, cherry-pick or recreate only the document change on a fresh branch from `main`.
4. Exclude `tmp/pdfs/` and other temporary render outputs unless the owner explicitly promotes them to validation evidence under `docs/validation/`.
5. After useful content is recovered or explicitly rejected, delete the local branch only with owner approval.

## Proposed Retirement Waves

### Wave 0 - Metadata cleanup only

No branch deletion.

Recommended local-only command:

```powershell
git remote set-head origin -a
```

Purpose: align local `origin/HEAD` metadata with the remote default branch `main`.

### Wave 1 - Merged PR source branches

Eligible after PR #12 is merged or closed:

- `origin/chore/repository-governance-v0.2.0`
- `origin/chore/main-branch-transition-v0.2.0`
- `origin/docs/record-main-branch-transition`, only after PR #12 is merged or closed

Owner-approved deletion commands:

```powershell
git push origin --delete chore/repository-governance-v0.2.0
git push origin --delete chore/main-branch-transition-v0.2.0
git push origin --delete docs/record-main-branch-transition
```

Run only the commands that correspond to owner-approved branches.

### Wave 2 - Stale provenance branch

Candidate:

- `origin/codex/gpl-provenance-review`

Preconditions:

- License, third-party notices, provenance, and GPL records are confirmed present on `main`.
- Issue #2 closure scope remains documented as GPL-3.0-only source and internal advisory RC posture.
- No PR, issue, release record, or worktree depends on the branch.
- Owner approves deletion.

Owner-approved command:

```powershell
git push origin --delete codex/gpl-provenance-review
```

### Wave 3 - Former default branch

Candidate:

- `origin/codex/sap-agents-framework-rc-roadmap`

Recommended treatment:

- Retain for a cooldown period after `main` becomes default and protected.
- Reassess after contributors, local scripts, docs, and automation have adjusted to `main`.
- Delete only after owner confirms no dependency remains.

Owner-approved command, if later approved:

```powershell
git push origin --delete codex/sap-agents-framework-rc-roadmap
```

### Wave 4 - Former release-governance branch

Candidate:

- `origin/chore/release-hygiene-advisory-rc`

Recommended treatment:

- Retain until v0.2.0 final release posture is decided.
- Reassess after final release, corrective RC, or branch model stabilization.

Do not delete this branch during initial branch-retirement cleanup.

## Pre-Deletion Checklist

Run immediately before any remote branch deletion:

```powershell
git fetch --all --prune --tags
git status --short --branch
git branch --all --verbose
git worktree list
git branch --contains sap-codex-deliverables-v0.2.0-rc1 --all
gh pr list --repo MexbaliaMX/SAP_Codex_Agents --state open --json number,title,headRefName,baseRefName,state,url
gh repo view MexbaliaMX/SAP_Codex_Agents --json defaultBranchRef
gh api repos/MexbaliaMX/SAP_Codex_Agents/branches/main --jq '{name,protected,commit:.commit.sha}'
```

For each candidate branch:

```powershell
git rev-list --left-right --count main...origin/<branch-name>
git log --oneline main..origin/<branch-name>
git branch --contains origin/<branch-name> --all
```

Stop if the branch has right-side unique commits, active PR usage, worktree dependency, release dependency, or unclear owner approval.

## Post-Deletion Validation

After any owner-approved deletion:

```powershell
git fetch --all --prune --tags
git ls-remote --heads origin
git branch --all --verbose
git branch --contains sap-codex-deliverables-v0.2.0-rc1 --all
git status --short --branch
```

Record results in `docs/validation/branch-retirement-validation-YYYY-MM-DD.md`.

## Safety Confirmation Required After Each Wave

Record:

- No branch history was rewritten.
- No force push was used.
- No release tag was modified.
- No release asset was modified.
- No unapproved branch was deleted.
- No SAP tenant was accessed.
- No MCP server was enabled.
- No Codex hook was enabled.
- No credentials were added.
- No production action was performed.
