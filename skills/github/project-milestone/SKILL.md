---
name: project-milestone
version: 1.0.0
description: Plan and structure a project milestone into an executable set of work items with clear ownership, dependencies, and acceptance criteria.
triggers:
  - "plan a milestone"
  - "milestone planning"
  - "scope this phase"
  - "create milestone plan"
  - "plan the next phase"
allowed-tools: [Read, Write]
---

# Project Milestone Skill

## When to invoke this skill

Plan and structure a project milestone so that a team can move from a goal to
an executable set of work items with clear ownership, dependencies, and
acceptance criteria. Use this when a milestone needs to be translated into
concrete work that can be scheduled, tracked, and completed.

Do NOT use this for lightweight backlogs — `backlog-creation` handles that.
Do NOT use this for single-issue breakdowns — `issue-breakdown` handles that.
This skill is for multi-work-stream milestones that span a team.

## Inputs

- milestone goal
- project context
- target date or time window
- scope boundaries
- known dependencies
- constraints or risks
- relevant stakeholders

## Outputs

- milestone summary
- scoped work breakdown
- dependency list
- risk notes
- ownership suggestions
- acceptance criteria
- execution-ready next steps

## Rules

- Keep the milestone outcome specific and testable.
- Break work into small items that can be owned independently.
- Identify dependencies before sequencing work.
- Surface ambiguity rather than guessing.
- Separate planning from execution.
- Avoid overloading the milestone with unrelated work.
- Keep the output reusable across projects and teams.

## Example Workflow

1. Read the milestone goal and project context.
2. Define the desired outcome in one sentence.
3. Break the milestone into a small set of work streams.
4. Identify dependencies and sequence them.
5. Mark risks, assumptions, and open questions.
6. Write acceptance criteria for the milestone.
7. Convert the result into a tracking-friendly structure.

## Acceptance Criteria

The skill is complete when the output:

- states the milestone goal clearly
- identifies a bounded scope
- decomposes work into actionable items
- names dependencies and risks
- includes acceptance criteria that can be checked
- is readable without project-specific jargon

## Notes

This skill should be paired with a workflow when the milestone needs multi-step execution, or with a template when the output must follow a consistent format.
