---
name: release-management
version: 1.0.0
description: Plan and coordinate a software release with enough structure to reduce avoidable release risk.
triggers:
  - "plan a release"
  - "release checklist"
  - "ship this version"
  - "prepare release"
  - "cut a release"
allowed-tools: [Read, Write]
---

# Release Management Skill

## When to invoke this skill

Plan and coordinate a software release with enough structure to reduce
avoidable release risk.

Do NOT use this for ongoing deployment automation or CI pipeline setup — this
skill is about the human planning and coordination around a specific release
event: what goes in, what gets validated, and how to roll back.

## Inputs

- release scope
- target version or tag
- linked work items
- deployment constraints
- rollback considerations
- validation requirements

## Outputs

- release checklist
- validation steps
- release notes outline
- rollback notes
- post-release checks

## Rules

- Keep release scope explicit.
- Verify the release candidate before publishing.
- Include rollback thinking in the plan.
- Avoid mixing release work with unrelated feature work.

## Example Workflow

1. Confirm what is going into the release.
2. Validate that linked work is complete.
3. Prepare release notes and deployment notes.
4. Run required checks.
5. Execute the release.
6. Verify post-release health.
7. Record follow-up items.

## Acceptance Criteria

The release plan is complete when it:

- lists the release scope
- includes validation and rollback notes
- identifies any unresolved release blockers
- provides a post-release verification step
