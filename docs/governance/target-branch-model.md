# Target Branch Model

Date: 2026-07-25

## Purpose

Define the target branch model for the v0.2.0 governance work without rewriting public history or deleting existing branches.

## Confirmed Current State

| Ref | Commit | Treatment |
|---|---|---|
| `origin/codex/sap-agents-framework-rc-roadmap` | `f6cdd5ef5a5b2e5c0f9da5e87d1c811ec46a417b` | Current GitHub default branch. Retain until `main` exists, CI passes, protection is applied, and owner approves retirement. |
| `origin/chore/release-hygiene-advisory-rc` | `432b1656b4960a45ac6c0f95265aed4ff48e9788` | Authoritative remote release-governance baseline for v0.2.0 governance work. |
| `origin/codex/gpl-provenance-review` | `7a914666f8517d7c6c785c2f73798bd53d6623e1` | Stale provenance branch. Candidate for deletion only after owner approval. |
| `master` | `04cc845ca57afb3dd3d4ad91f0f0e4c6e952f473` | Local-only ancestor of release-hygiene branch. Do not push without owner approval. |
| `chore/release-hygiene-advisory-rc` | `390de4ad192afcb4371557d143a45188716c3484` | Local branch one commit ahead of remote. Review temporary artifacts before promotion. |

No local or remote `main` branch existed during the assessment.

## Target State

```text
main
 ├─ feature/*
 ├─ fix/*
 ├─ docs/*
 ├─ chore/*
 └─ release/*
```

`main` should become the durable integration branch after owner approval. Existing public branches must not be rewritten.

## Migration Recommendation

1. Use `origin/chore/release-hygiene-advisory-rc` at `432b1656b4960a45ac6c0f95265aed4ff48e9788` as the proposed source for `main`.
2. Do not include local commit `390de4ad192afcb4371557d143a45188716c3484` unless the owner approves its non-temporary files and excludes or relocates temporary render artifacts.
3. Create `main` from the approved baseline with a normal push. Do not force-push.
4. Run release hygiene validation on `main`.
5. Apply branch protection after CI is green.
6. Change GitHub default branch to `main` only after owner approval.
7. Retain legacy branches until all retirement criteria are met.

## Branch Retirement Criteria

A legacy branch may be deleted only after all of the following are true:

- `main` exists remotely.
- CI passes on `main`.
- Release tags remain reachable.
- No open PR targets or depends on the branch.
- No worktree depends on the branch.
- No unique commits remain, or the owner explicitly accepts abandoning them.
- The repository owner approves deletion.

## Branch Classifications

| Branch | Classification | Reason |
|---|---|---|
| `codex/sap-agents-framework-rc-roadmap` | Archive temporarily | Current default branch; keep until `main` migration is complete. |
| `chore/release-hygiene-advisory-rc` | Merge/source for `main` | Contains v0.2.0-rc1 acceptance and release-governance state. |
| `codex/gpl-provenance-review` | Delete after approval | Fully contained in later history; no unique remote commits vs current default line. |
| `master` | Retain local/archive | Local-only ancestor; no remote action unless owner requests it. |

## Owner Approval Required

- Creating remote `main`.
- Changing default branch.
- Applying branch protection.
- Deleting or archiving any branch.
- Pushing local-only branch contents.
- Promoting local unpushed commit `390de4ad192afcb4371557d143a45188716c3484`.
