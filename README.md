# agent-forge

`agent-forge` keeps reusable skills and other agent capabilities in one
repository. Projects can reference the files directly or install selected
skills with [Tuff](https://tuffcli.dev/).

The repository contains shared guidance and execution helpers. Project-specific
decisions, paths, and state stay in the project that uses them.

## Skills

Each skill is a standalone capability with its own inputs, outputs, rules, and
acceptance criteria.

### Architecture

- [artifact-driven-integration](skills/architecture/artifact-driven-integration/SKILL.md):
  integrate through stable artifacts instead of internal runtime behavior.
- [cli-first-tool-design](skills/architecture/cli-first-tool-design/SKILL.md):
  prove a tool's core workflow through a command-line interface.
- [service-design](skills/architecture/service-design/SKILL.md): define service
  responsibilities, boundaries, interfaces, data flow, and operations.

### CI/CD

- [ci-cd-pipeline](skills/ci-cd/ci-cd-pipeline/SKILL.md): design a pipeline that
  builds, tests, and deploys software.

### Cloudflare

- [cloudflare-pages-web-analytics-status](skills/cloudflare/cloudflare-pages-web-analytics-status/SKILL.md):
  interpret Pages and Web Analytics deployment status.

### Debugging

- [debugging](skills/debugging/debugging/SKILL.md): diagnose issues in
  development, staging, and production.

### GitHub

- [backlog-creation](skills/github/backlog-creation/SKILL.md): turn a goal or
  feature idea into an actionable backlog.
- [code-review](skills/github/code-review/SKILL.md): review a change for
  correctness, clarity, maintainability, and risk.
- [issue-breakdown](skills/github/issue-breakdown/SKILL.md): split an issue into
  tasks with dependencies and implementation notes.
- [project-milestone](skills/github/project-milestone/SKILL.md): structure a
  milestone into executable work items.
- [pull-request-lifecycle](skills/github/pull-request-lifecycle/SKILL.md): take
  a working-tree change through pull request and merge.

### Incident Management

- [incident-response](skills/incident/incident-response/SKILL.md): handle a
  production incident from detection through follow-up.

### Python

- [packaging-standards](skills/python/packaging-standards/SKILL.md): define a
  consistent Python packaging baseline.
- [uv-project-setup](skills/python/uv-project-setup/SKILL.md): set up a
  reproducible Python project with uv.

### Release

- [release-management](skills/release/release-management/SKILL.md): plan and
  coordinate a software release.

### Security

- [security-review](skills/security/security-review/SKILL.md): review code,
  configuration, and infrastructure for security risks.

### Testing

- [test-strategy](skills/testing/test-strategy/SKILL.md): define a practical
  testing approach for a codebase or change.

### Tooling

- [just-command-orchestration](skills/tooling/just-command-orchestration/SKILL.md):
  centralize project commands in a maintainable Justfile.

### Writing

- [reference-voice](skills/writing/reference-voice/SKILL.md): write concise
  documentation, release notes, and UI copy.

The [capabilities index](docs/capabilities_index.md) groups skills with the
workflows, templates, and tools that support them.

## Other Capabilities

- [Workflows](workflows/) compose skills into repeatable sequences.
- [Templates](templates/) standardize common outputs.
- [Examples](examples/) show the capabilities in use.
- [Hooks](hooks/) provide repository automation samples.
- [Tools](tools/) execute focused actions and quality checks.
- [Documentation](docs/) covers the architecture and consumption models.

## Install A Skill With Tuff

Install the `tuff` command, then initialize Tuff once in the consuming
repository:

```bash
tuff init
```

Install a skill by its name:

```bash
tuff add skill https://github.com/kannandreams/agent-forge code-review \
  --agent open-agents
```

Replace `code-review` with any name from the skill index. The `open-agents`
adapter writes to `.agents/skills/`. Tuff also provides harness-specific
adapters.

Commit the emitted capability files and `tuff.lock`. Tuff uses the lockfile to
track the source revision, local drift, and upstream updates.

Review and apply an update with:

```bash
tuff outdated
tuff diff code-review --upstream
tuff update code-review --check
tuff update code-review
tuff check
```

## Reference The Library Directly

Clone, mount, or vendor the repository when a project needs workflows,
templates, examples, hooks, tools, or several skills as reference material.
Point the project's `AGENTS.md` at the specific files it should use.

See [Consuming Agent Forge](docs/consuming_agent_forge.md) for sibling checkout,
submodule, subtree, and vendored layouts.

## Repository Model

- Skills describe reusable capabilities.
- Workflows sequence skills.
- Tools execute actions.
- Templates standardize outputs.
- Examples demonstrate usage.

Content stays Markdown-first, modular, and independent of a specific model or
agent runtime. New capabilities should extend the smallest relevant layer and
link to shared material instead of duplicating it.
