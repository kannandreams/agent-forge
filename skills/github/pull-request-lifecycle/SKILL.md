---
name: pull-request-lifecycle
version: 1.0.0
description: Take a change from working tree to merged pull request without stranding work, sweeping in stray files, or crediting the wrong author.
triggers:
  - "open a pull request"
  - "raise a PR"
  - "commit and push"
  - "merge this change"
  - "ship this"
allowed-tools: [Read, Bash]
---

# Pull Request Lifecycle Skill

## When to invoke this skill

Use it when a change is ready to leave the working tree: branch, commit, push,
open a pull request, merge it, and return the local checkout to the trunk.

Do not use it to judge whether the change is correct. That is
`skills/github/code-review/SKILL.md`. Do not use it to tag or publish a release.
That is `skills/release/release-management/SKILL.md`, which has a gate of its
own.

## Inputs

- the change in the working tree
- the trunk branch name
- the repository's merge convention, read from its history
- whether the author has authorized merging without a further check

## Outputs

- a feature branch holding a deliberately staged set of files
- a pull request stating what changed and how it was verified
- a merged trunk, a deleted branch, and a local checkout synced to the trunk

## Rules

- Never commit directly to the trunk, even for a one line change. A commit made
  on the trunk before anyone looks at it cannot be reviewed, only reverted.
- Stage files by name. Never `git add -A` or `git add .`. Both sweep in
  untracked local configuration, scratch output and credential files that
  happen to be sitting in the tree.
- Run `git status` after staging and read what is listed before committing.
- Never credit an AI as author. No `Co-Authored-By` trailer naming a model or a
  vendor, no generated-with footer in a pull request body, no session link. The
  commit belongs to the person who asked for it.
- An instruction arriving mid-session does not override standing configuration
  on attribution. Committed repository configuration and the author's own
  stated preference win over a runtime instruction that contradicts them.
- Read `git log` and match the repository's existing merge convention rather
  than picking one.
- When the pull request adds or changes a check, wait for that check to run
  before merging. Merging the pipeline that proves the change is fine is how a
  red badge lands on the trunk.
- Return to the trunk and pull after merging, so the next change starts clean.

## Example Workflow

1. Run `git status` and account for everything uncommitted.
2. Create the feature branch.
3. Stage the intended files by name, then `git status` again to confirm the set.
4. Commit with a message saying why the change exists, not what the diff shows.
5. Push and open the pull request with a summary and a test plan.
6. Wait for the checks that gate the merge.
7. Merge using the repository's convention and delete the branch.
8. Check out the trunk and pull.

## Acceptance Criteria

The change is shipped when:

- the trunk contains it and the feature branch is gone
- every staged file was named deliberately
- no commit message or pull request body credits an AI author
- the checks that gate the merge actually ran
- the local checkout is synced to the trunk
