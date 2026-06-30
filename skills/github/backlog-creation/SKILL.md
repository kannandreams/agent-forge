---
name: backlog-creation
version: 1.0.0
description: Turn a project goal, milestone, or feature idea into a simple backlog of actionable items.
triggers:
  - "create a backlog"
  - "break this down into tasks"
  - "plan work items"
  - "what needs to be done"
  - "backlog this"
allowed-tools: [Read, Write]
---

# Backlog Creation Skill

## When to invoke this skill

Turn a project goal, milestone, or feature idea into a lightweight backlog of
actionable items. Use this when you want a planning step that produces work
items without building a full milestone plan.

Do NOT use this for a complete milestone with dates, ownership, and execution
tracking — `project-milestone` handles that. Do NOT use this for breaking down
a single GitHub issue into sub-tasks — `issue-breakdown` handles that.

## Inputs

- project goal or feature goal
- short context
- constraints
- rough priority
- known dependencies
- target outcome

## Outputs

- backlog item list
- short item descriptions
- rough sequencing
- dependency notes
- open questions

## Rules

- Keep items small and actionable.
- Prefer clear verbs and concrete outcomes.
- Avoid deep design detail unless it is needed to make the item usable.
- Capture dependencies only when they affect ordering.
- Leave implementation decisions open unless they are already known.

## Example Workflow

1. Read the goal and context.
2. Identify the smallest useful set of backlog items.
3. Order them by dependency and priority.
4. Add brief descriptions for each item.
5. Note any open questions or assumptions.

## Backlog Item Format

- Title
- Why it matters
- Suggested priority
- Dependencies
- Notes

## Acceptance Criteria

The output is acceptable when it:

- turns the goal into a usable backlog
- keeps items small and ordered
- avoids unnecessary planning overhead
- leaves room for implementation detail to be handled later
