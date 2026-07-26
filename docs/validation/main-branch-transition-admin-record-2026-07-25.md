# Main Branch Transition Admin Record

Date: 2026-07-25

Repository: `MexbaliaMX/SAP_Codex_Agents`

## Executive Result

The repository now has `main` as the default branch and `main` is protected.

This record documents administrative actions that were executed after the Phase 2 runbook was reviewed and merged. It does not approve branch retirement, client distribution, marketplace publication, SAP tenant execution, production use, MCP activation, or Codex hook activation.

## Confirmed Branch State

| Item | Value |
|---|---|
| Default branch | `main` |
| Remote HEAD | `refs/heads/main` |
| `main` commit | `c95e00c1d06efe34246d19a8d1b2368cf9e3b3e1` |
| Matching branch | `origin/chore/release-hygiene-advisory-rc` at `c95e00c1d06efe34246d19a8d1b2368cf9e3b3e1` |
| Previous default branch | `codex/sap-agents-framework-rc-roadmap` |

## Admin Actions Completed

- Created local `main` from `c95e00c1d06efe34246d19a8d1b2368cf9e3b3e1`.
- Pushed remote `origin/main`.
- Changed GitHub default branch from `codex/sap-agents-framework-rc-roadmap` to `main`.
- Applied branch protection to `main`.

## Branch Protection Confirmed

GitHub reports `main` as protected.

Configured controls:

- Pull request required before merge.
- One approving review required.
- Stale approvals dismissed after new commits.
- CODEOWNERS review required.
- Conversations must be resolved.
- Required status check: `release-hygiene`.
- Required status checks are strict, requiring the branch to be up to date.
- Admin enforcement enabled.
- Force pushes disabled.
- Branch deletion disabled.

## Validation Evidence

| Check | Result | Evidence |
|---|---|---|
| `git diff --check` on `main` | PASS | No whitespace errors. |
| `scripts\validate-agent-operating-layer.ps1` on `main` | PASS | Agent operating-layer validation passed. |
| `scripts\validate-plugin-operating-layer-assets.ps1` on `main` | PASS | Plugin operating-layer asset validation passed. |
| `scripts\test-authorization-review-packs.ps1` on `main` | PASS | SAP authorization review-pack regression passed. |
| `scripts\validate-release-hygiene.ps1` on `main` | PASS | Release hygiene validation passed. |
| GitHub Actions `Release Hygiene` on `main` | PASS | Run `30178021844`, head SHA `c95e00c1d06efe34246d19a8d1b2368cf9e3b3e1`. |

## Commands Used For Evidence

```powershell
git fetch --all --prune --tags
git status --short --branch
git branch --all --verbose
git worktree list
git show-ref --verify refs/heads/main
git show-ref --verify refs/remotes/origin/main
git rev-list --left-right --count origin/codex/sap-agents-framework-rc-roadmap...origin/chore/release-hygiene-advisory-rc
git branch --contains sap-codex-deliverables-v0.2.0-rc1 --all
git rev-parse --verify 'sap-codex-deliverables-v0.2.0-rc1^{}'
gh pr list --repo MexbaliaMX/SAP_Codex_Agents --state open --json number,title,headRefName,baseRefName,state,url
gh release view sap-codex-deliverables-v0.2.0-rc1 --repo MexbaliaMX/SAP_Codex_Agents --json tagName,name,isDraft,isPrerelease,targetCommitish,assets,url
gh api repos/MexbaliaMX/SAP_Codex_Agents/rulesets
git switch -c main c95e00c1d06efe34246d19a8d1b2368cf9e3b3e1
git push -u origin main
powershell -ExecutionPolicy Bypass -File scripts\validate-agent-operating-layer.ps1
powershell -ExecutionPolicy Bypass -File scripts\validate-plugin-operating-layer-assets.ps1
powershell -ExecutionPolicy Bypass -File scripts\test-authorization-review-packs.ps1
powershell -ExecutionPolicy Bypass -File scripts\validate-release-hygiene.ps1
gh repo edit MexbaliaMX/SAP_Codex_Agents --default-branch main
gh api --method PUT repos/MexbaliaMX/SAP_Codex_Agents/branches/main/protection ...
gh repo view MexbaliaMX/SAP_Codex_Agents --json defaultBranchRef,nameWithOwner,url
gh api repos/MexbaliaMX/SAP_Codex_Agents/branches/main --jq '{name,protected,commit:.commit.sha}'
gh api repos/MexbaliaMX/SAP_Codex_Agents/branches/main/protection
gh run list --repo MexbaliaMX/SAP_Codex_Agents --branch main --workflow "Release Hygiene" --json databaseId,name,status,conclusion,headSha,event,createdAt,updatedAt,url --limit 3
```

## Deferred Actions

- Do not delete legacy branches yet.
- Do not retire `codex/sap-agents-framework-rc-roadmap` until a separate owner-approved branch-retirement checklist is complete.
- Retain `chore/release-hygiene-advisory-rc` until v0.2.0 final posture is decided.
- Treat `codex/gpl-provenance-review` as a branch-retirement candidate only after checklist validation.
- Resolve the local divergent `chore/release-hygiene-advisory-rc` branch carefully because it contains an unpublished commit with temporary render artifacts.
- Convert issues #1, #3, #4, and #5 into the executable backlog in a separate owner-approved issue update pass.

## Safety Confirmation

- No branch history was rewritten.
- No force push was used.
- No release tag was modified.
- No release asset was modified.
- No branch was deleted.
- No SAP tenant was accessed.
- No MCP server was enabled.
- No Codex hook was enabled.
- No credentials were added.
- No production action was performed.
