---
name: issue-breakdown
version: 1.0.0
description: Turn a GitHub issue into smaller actionable tasks with clear ownership, dependencies, and implementation notes.
triggers:
  - "break down this issue"
  - "task breakdown"
  - "split into tasks"
  - "decompose this issue"
  - "make this issue actionable"
allowed-tools: [Read, Write]
---

# Issue Breakdown Skill

## When to invoke this skill

Turn a GitHub issue into smaller actionable tasks with clear ownership,
dependencies, and implementation notes.

Do NOT use this for milestone-level planning — `project-milestone` handles
that. Do NOT use this for lightweight backlogs from goals or feature ideas —
`backlog-creation` handles that. This skill is for decomposing a single,
well-defined GitHub issue into independently executable work units.

## Inputs

- issue title
- issue body
- acceptance criteria
- labels
- related issues or PRs
- technical context

## Outputs

- task breakdown
- dependency order
- implementation notes
- verification points
- follow-up questions if needed

## Rules

- Prefer small tasks that can be completed independently.
- Preserve the original intent of the issue.
- Call out missing information before inventing scope.
- Keep implementation details minimal unless they are required for clarity.

## Example Workflow

1. Read the issue body, acceptance criteria, and any linked context.
2. Identify the smallest set of independent work units that satisfy the acceptance criteria.
3. Order tasks by dependency — what must happen before what.
4. Write implementation notes for each task: approach, files likely affected, verification check.
5. Review the breakdown against the original issue intent to confirm coverage.

## Acceptance Criteria

The output is acceptable when it:

- breaks the issue into 3-10 small, independently actionable tasks
- preserves the original issue intent and acceptance criteria
- identifies dependency order where it affects sequencing
- includes verification points for each task
- flags missing context as follow-up questions rather than guessing
