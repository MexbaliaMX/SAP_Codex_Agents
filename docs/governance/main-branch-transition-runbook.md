# Main Branch Transition Runbook

Date: 2026-07-25

Phase: 2 - Establish the target branch model

Status: proposed runbook; not executed

## Objective

Create a controlled path from the current release-governance branch model to a durable `main` integration branch without rewriting public history, moving release tags, deleting branches, or changing GitHub settings before owner approval.

## Preconditions

Before executing this runbook, confirm:

- PR #10, `Normalize repository governance for v0.2.0`, is reviewed and merged or explicitly accepted as the governance baseline.
- `origin/chore/release-hygiene-advisory-rc` remains the approved authoritative release-governance baseline, or the owner selects a different commit.
- No open PR depends on a branch being retired.
- No worktree depends on a branch being retired.
- `sap-codex-deliverables-v0.2.0-rc1` remains reachable.
- The local-only commit `390de4ad192afcb4371557d143a45188716c3484` is either excluded or explicitly approved after reviewing temporary artifacts.

## Owner Approval Gate

Do not execute the remote mutation commands in this runbook until the repository owner approves:

- Source commit for `main`.
- Creation of remote `main`.
- Default branch change.
- Branch protection or ruleset application.
- Legacy branch retirement candidates.

## Proposed Source Commit

Recommended source for `main`:

```text
origin/chore/release-hygiene-advisory-rc
432b1656b4960a45ac6c0f95265aed4ff48e9788
```

Reason:

- Contains current default branch history.
- Contains the v0.2.0-rc1 release acceptance trail.
- Contains tag target `637cad305060134360c655efa455f1a205b923c5` in history.
- Avoids unpublished local commit `390de4ad192afcb4371557d143a45188716c3484`, which includes `tmp/pdfs/` render artifacts pending owner review.

Alternative source:

```text
chore/repository-governance-v0.2.0
ad39ec055de7b9b50e05e777f67a73a1fc5f8369
```

Use this alternative only after PR #10 is approved, because it adds governance controls before creating `main`.

## Read-Only Preflight

Run these commands immediately before execution:

```powershell
git fetch --all --prune --tags
git status --short --branch
git remote -v
git branch --all --verbose
git worktree list
git rev-list --left-right --count origin/codex/sap-agents-framework-rc-roadmap...origin/chore/release-hygiene-advisory-rc
git rev-list --left-right --count origin/chore/release-hygiene-advisory-rc...origin/main
git branch --contains sap-codex-deliverables-v0.2.0-rc1 --all
git rev-parse --verify "sap-codex-deliverables-v0.2.0-rc1^{}"
gh pr list --repo MexbaliaMX/SAP_Codex_Agents --state open
gh release view sap-codex-deliverables-v0.2.0-rc1 --repo MexbaliaMX/SAP_Codex_Agents
gh api repos/MexbaliaMX/SAP_Codex_Agents/rulesets
```

If `origin/main` does not exist, the `rev-list` command against `origin/main` will fail. Record that as expected evidence before creation.

Stop if:

- The working tree is dirty with unrelated changes.
- The approved source commit changed unexpectedly.
- A release tag would become unreachable.
- A branch is used by a worktree in a way that affects retirement.
- Open PRs target or depend on a branch proposed for deletion.
- Secrets, tenant URLs, client data, or credentials are discovered.

## Create `main`

Owner-approved command sequence:

```powershell
git switch --detach 432b1656b4960a45ac6c0f95265aed4ff48e9788
git switch -c main
git push -u origin main
```

If the owner chooses the post-governance baseline after PR #10 is merged, replace the detached commit with the approved merge commit.

Do not force-push. If `main` already exists, stop and compare histories instead of overwriting it.

## Validate `main`

After `main` exists:

```powershell
git switch main
powershell -ExecutionPolicy Bypass -File scripts\validate-agent-operating-layer.ps1
powershell -ExecutionPolicy Bypass -File scripts\validate-plugin-operating-layer-assets.ps1
powershell -ExecutionPolicy Bypass -File scripts\test-authorization-review-packs.ps1
powershell -ExecutionPolicy Bypass -File scripts\validate-release-hygiene.ps1
git diff --check
git status --short
```

Record results in `docs/validation/repository-governance-validation.md` or a follow-up validation note.

## Change Default Branch

Preferred path: GitHub UI by repository owner.

Manual steps:

1. Open repository settings.
2. Navigate to Branches.
3. Change default branch from `codex/sap-agents-framework-rc-roadmap` to `main`.
4. Confirm the change.
5. Record evidence in the validation note.

CLI option, only after owner approval:

```powershell
gh repo edit MexbaliaMX/SAP_Codex_Agents --default-branch main
```

## Apply Branch Protection

After `main` is default and CI check names are confirmed, apply the controls documented in `docs/governance/main-branch-protection-plan.md`.

Do not apply branch protection until:

- `main` exists.
- CI passes on `main`.
- CODEOWNERS is present on `main`.
- Required status check names are known.
- Repository owner confirms whether administrators are included.

## Legacy Branch Treatment

| Branch | Proposed treatment | Approval required |
|---|---|---|
| `codex/sap-agents-framework-rc-roadmap` | Archive temporarily after default branch changes to `main`. | Yes |
| `chore/release-hygiene-advisory-rc` | Retain until v0.2.0 final posture is decided. | Yes |
| `codex/gpl-provenance-review` | Delete after confirming no unique commits, no open PRs, no worktree dependency, and owner approval. | Yes |
| `master` | Keep local/archive only; do not push. | Yes for any remote action |

Deletion commands are intentionally omitted. Write a separate owner-approved retirement checklist before any branch deletion.

## Rollback

If `main` is created but not made default:

- Leave `main` in place and open a follow-up PR or owner decision record.
- Do not delete it automatically.

If `main` is made default and a rollback is required:

1. Owner changes the default branch back to the prior branch through GitHub UI.
2. Disable or adjust branch protection only if it blocks emergency recovery.
3. Record the rollback decision and exact evidence.

Do not use force push or history rewrite as rollback.

## Safety Confirmation Required After Execution

Record:

- No branch history was rewritten.
- No force push was used.
- No release tag was modified.
- No release asset was modified.
- No SAP tenant was accessed.
- No MCP server was enabled.
- No Codex hook was enabled.
- No credentials were added.
- No production action was performed.
