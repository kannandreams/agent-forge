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
- `bin/` contains the `agent-forge` CLI wrapper.
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

### Use the CLI wrapper

To browse skills, view docs, or install a skill through `npx skills add`, run:

`bin/agent-forge`

## CLI Usage

`agent-forge` is the local command for browsing this capability library. You can
run it directly from this GitHub repo with `npx`:

```bash
npx github:kannandreams/agent-forge
```

For development inside this repository, the local executable also works:

```bash
bin/agent-forge
```

If you want a persistent local command from a checkout:

```bash
npm link
```

You can also symlink the executable into your `PATH`:

```bash
ln -s /path/to/agent-forge/bin/agent-forge ~/.local/bin/agent-forge
```

Use `--dry-run` when you want to preview the `npx skills add` command without
installing anything. The actual install command stays:

```bash
npx skills add kannandreams/agent-forge <skill-path>
```

If the command is installed outside this checkout and cannot locate the
capability files, point it at this repository:

```bash
export AGENT_FORGE_HOME=/path/to/agent-forge
```

### Help output

Command:

```bash
bin/agent-forge --help
```

Captured output:

```text
usage: agent-forge [-h] [--source SOURCE] [--npx-package NPX_PACKAGE]
                   [--dry-run] [--list-skills]

TUI wrapper for browsing agent-forge capabilities, viewing Markdown docs, and
installing skills through npx.

options:
  -h, --help            show this help message and exit
  --source SOURCE       skill source repo (default: kannandreams/agent-forge)
  --npx-package NPX_PACKAGE
                        npx package name for the skills CLI (default: skills)
  --dry-run             print install commands instead of running them
  --list-skills         print available skills and exit
```

### List skills

Command:

```bash
bin/agent-forge --list-skills
```

Captured output excerpt:

```text
 1. artifact-driven-integration                Integrate with an existing system by consuming its stable artifacts instead of coupling directly to internal runtime behavior.
 2. cli-first-tool-design                      Design an engineering tool to prove its core workflow through a command-line interface before adding richer interfaces.
 3. service-design                             Define the shape of a service before implementation by clarifying responsibilities, boundaries, interfaces, data flow, and operational concerns.
 4. ci-cd-pipeline                             Design and configure a CI/CD pipeline that builds, tests, and deploys software with minimal manual intervention.
 5. cloudflare-pages-web-analytics-status      Interpret Cloudflare Pages and Web Analytics status output to decide whether deployment analytics are present, healthy, and actionable.
...
17. just-command-orchestration                 Design a Justfile that centralizes project command wrappers and execution orchestration without hiding business logic.
```

### Preview skill installation

Command:

```bash
printf '1\n8\n\n0\n0\n' | bin/agent-forge --dry-run
```

Captured output excerpt:

```text
agent-forge
==========

Install skill: code-review

Source: kannandreams/agent-forge
Path:   skills/github/code-review/SKILL.md

Dry run command:
  npx skills add kannandreams/agent-forge skills/github/code-review/SKILL.md
```

### View rendered docs

Command:

```bash
printf '2\n1\nq\n0\n0\n' | bin/agent-forge --dry-run
```

Captured output excerpt:

```text
agent-forge
==========

View Markdown docs

 1. README.md
 2. AGENTS.md
 3. CHANGELOG.md
 4. TODO.md
 5. docs/agent-forge-cli.md
...

Viewing README.md
Press Esc, q, or Enter to return.
----------------------------------------

agent-forge

`agent-forge` is a reusable engineering capability library for projects that
want shared operating practices without copying process notes into every repo.
```

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
