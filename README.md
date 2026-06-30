# agent-forge

`agent-forge` is a reusable engineering capability library for projects that
want shared operating practices without copying process notes into every repo.

## Purpose

The goal is to keep repeatable engineering judgment in one maintained place:
how to plan, review, test, release, debug, and operate software. Downstream
projects should reference only the pieces they need and keep local decisions in
the local repo.

This repository optimizes for:

- clear ownership boundaries between shared guidance and project-specific state
- small, composable capabilities with explicit inputs and outputs
- vendor-neutral Markdown that works for humans, agents, and CI
- examples that prove usage instead of restating the rules
- tools that automate narrow, well-understood actions

## Philosophy

- Capabilities over prompts.
- Workflows over isolated tasks.
- Contracts over slogans: every reusable asset should name its inputs, outputs,
  boundaries, and verification path.
- Small tools over broad automation.
- Local context stays local.

The core idea is simple: skills define what can be done, workflows define how capabilities are composed, templates define the expected structure, and tools carry out the actual action when needed.

## Repository Structure

```text
agent-forge/
├── README.md
├── AGENTS.md
├── docs/
├── skills/
├── workflows/
├── templates/
├── tools/
├── agents/
├── examples/
└── .gitignore
```

- `docs/` contains repository-level guidance and architecture notes.
- `docs/capabilities_index.md` provides a topic-based index of reusable capabilities.
- `docs/consuming_agent_forge.md` explains how downstream repositories should mount and reference the shared library.
- `skills/` contains reusable capability modules, organized by domain.
- `workflows/` contains repeatable multi-step operating patterns that orchestrate skills.
- `templates/` contains Markdown structures that standardize outputs and inputs.
- `tools/` contains narrow executable helpers and tool-specific guidance.
- `agents/` contains agent-oriented assets and conventions.
- `examples/` contains practical examples of how the system is used in real projects.

## How Projects Use This Repository

Projects should reference this repository as a shared source of truth for
repeatable engineering capability.

Typical usage patterns:

1. Import or mirror a relevant skill into the project’s working context.
2. Follow a workflow when a task needs multiple steps or coordination.
3. Use a template when you want consistent output formatting or handoff structure.
4. Call out to a tool only when the task requires execution, integration, or side effects.

This keeps project repos focused on product code and local decisions while the
shared operating model evolves centrally.

## Example Usage

### Use a skill directly

If a project needs to break down a GitHub issue, it can reference:

`skills/github/issue-breakdown/SKILL.md`

### Use a workflow

If a project needs a milestone delivered end to end, it can follow:

`workflows/milestone_execution.md`

If a project only needs a lightweight backlog from a goal or feature idea, it can follow:

`workflows/backlog_creation_workflow.md`

### Use a template

If a project needs a consistent milestone plan, it can use:

`templates/milestone_template.md`

## Contribution Standard

Additions should be treated like product code:

- name the problem the asset solves
- define the caller, inputs, outputs, and non-goals
- keep the smallest useful surface area
- include verification or acceptance criteria that can be checked
- add an example when the pattern is likely to be reused
- avoid project-specific state, vendor lock-in, and model-specific wording

Do not add broad "best practice" prose unless it changes a decision or action.

## Roadmap

Near-term work:

1. Add validation scripts that check skill frontmatter, broken links, and
   required sections.
2. Add a project health checker that verifies downstream repos reference valid
   capability paths.
3. Add release validation around changelog quality, tag state, and rollback
   notes.
4. Expand the examples only where they exercise real workflows end to end.
5. Add database migration, API integration, and observability capabilities.
