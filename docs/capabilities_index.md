# Capabilities Index

`agent-forge` is organized as a reusable capability library. This index groups the shared assets by topic so downstream projects can reference only what they need.

## Planning

- `skills/github/backlog-creation/SKILL.md`
- `skills/github/project-milestone/SKILL.md`
- `skills/github/issue-breakdown/SKILL.md`
- `workflows/backlog_creation_workflow.md`
- `workflows/milestone_execution.md`

## Quality

- `skills/github/code-review/SKILL.md`
- `skills/testing/test-strategy/SKILL.md`
- `workflows/code_review_workflow.md`

## Delivery

- `skills/release/release-management/SKILL.md`
- `workflows/release_workflow.md`

## Operations

- `skills/incident/incident-response/SKILL.md`
- `workflows/incident_response_workflow.md`

## Architecture

- `skills/architecture/service-design/SKILL.md`
- `skills/architecture/cli-first-tool-design/SKILL.md`
- `skills/architecture/artifact-driven-integration/SKILL.md`
- `templates/architecture_template.md`

## Python

- `skills/python/uv-project-setup/SKILL.md`
- `skills/python/packaging-standards/SKILL.md`

## GitHub Tooling

- `tools/github/backlog_to_project.sh`

## How To Use

Downstream repos should reference only the relevant topic entries for the task at hand.

Example:

```md
For lightweight planning, use `skills/github/backlog-creation/SKILL.md` and `workflows/backlog_creation_workflow.md`.
For release tasks, use `skills/release/release-management/SKILL.md` and `workflows/release_workflow.md`.
```
