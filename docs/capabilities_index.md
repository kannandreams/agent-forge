# Capabilities Index

`agent-forge` is organized as a reusable capability library. This index groups the shared assets by topic so downstream projects can reference only what they need.

## Selection Rules

- Use a skill when one capability is enough.
- Use a workflow when multiple skills need sequencing or handoff.
- Use a template when the output shape matters.
- Use a tool only when execution or external state changes are required.
- Prefer the narrowest matching asset. Do not load a full workflow for a single
  review, checklist, or one-file decision.

## Planning

- `skills/github/backlog-creation/SKILL.md`
- `skills/github/project-milestone/SKILL.md`
- `skills/github/issue-breakdown/SKILL.md`
- `workflows/backlog_creation_workflow.md`
- `workflows/milestone_execution.md`

## Quality

- `skills/github/code-review/SKILL.md`
- `skills/security/security-review/SKILL.md`
- `skills/testing/test-strategy/SKILL.md`
- `workflows/code_review_workflow.md`

## Delivery

- `skills/release/release-management/SKILL.md`
- `skills/ci-cd/ci-cd-pipeline/SKILL.md`
- `workflows/release_workflow.md`

## Tooling

- `skills/tooling/just-command-orchestration/SKILL.md`
- `bin/agent-wrap`
- `tools/quality/check_all.sh`

## Operations

- `skills/incident/incident-response/SKILL.md`
- `skills/debugging/debugging/SKILL.md`
- `workflows/incident_response_workflow.md`

## Cloudflare

- `skills/cloudflare/cloudflare-pages-web-analytics-status/SKILL.md`

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

Downstream repos should reference only the relevant topic entries for the task
at hand and keep project-specific state in the consuming repo.

Example:

```md
For lightweight planning, use `skills/github/backlog-creation/SKILL.md` and `workflows/backlog_creation_workflow.md`.
For release tasks, use `skills/release/release-management/SKILL.md` and `workflows/release_workflow.md`.
```
