# Consuming Agent Forge

Downstream repositories can install individual skills with Tuff or mount the
complete library when they also need workflows, templates, examples, hooks, or
tools.

## Install An Individual Skill

Use Tuff when a project needs one or more skills as managed agent capabilities.
From the consuming repository:

```bash
tuff init
tuff add skill https://github.com/kannandreams/agent-forge code-review \
  --agent open-agents
```

The final argument is the skill's frontmatter `name`, not its repository path.
Choose names from `docs/capabilities_index.md`. Repeat `tuff add skill` for each
skill the project needs.

Tuff records the Git source and resolved revision in the consuming project's
`tuff.lock`. Commit that lockfile and the emitted agent files so developers and
CI use the same capability revision.

## Pull Skill Updates

Inspect upstream state before applying an update:

```bash
tuff outdated
tuff diff code-review --upstream
tuff update code-review --check
```

Apply the reviewed update and validate all tracked capabilities:

```bash
tuff update code-review
tuff check
```

Do not use `--force` as the default update path. A normal update protects local
drift; reconcile intentional local edits before replacing an installed copy.

## Use The Complete Library

Tuff manages installable capabilities. The workflows, templates, examples,
hooks, tools, and repository documentation are also useful as reference
material, but they remain ordinary files in this library. Mount the repository
when a project needs those assets.

There are four practical Git-based layouts:

1. sibling repository
2. git submodule
3. git subtree
4. vendored copy

The recommended default is a git submodule when teams want explicit version
pinning, or a git subtree when they want the files to behave like normal repo
content. Both make the shared files visible inside the consuming repository.

## Recommended Layout

Use an in-repo path such as:

```text
consuming-repo/
  vendor/
    agent-forge/
```

This makes relative references stable for humans, agents, CI, and local tooling.

## Option 1: Sibling Repository

Example layout:

```text
workspace/
  agent-forge/
  consuming-repo/
```

Reference `agent-forge` from the consuming repo with paths like:

```md
- `../agent-forge/docs/capabilities_index.md`
- `../agent-forge/skills/python/uv-project-setup/SKILL.md`
```

Use this only when your agent runtime can read sibling directories. It is simple, but less reliable than mounting inside the repo.

## Option 2: Git Submodule

Use this when you want:

- a stable in-repo path
- independent version pinning
- explicit updates

Add it to the consuming repo:

```bash
git submodule add <agent-forge-repo-url> vendor/agent-forge
git commit -m "Add agent-forge submodule"
```

Clone with submodules:

```bash
git clone --recurse-submodules <consuming-repo-url>
```

Update the mounted version later:

```bash
git submodule update --remote vendor/agent-forge
git add vendor/agent-forge
git commit -m "Update agent-forge"
```

Use this when you want downstream repos to pin a specific `agent-forge` revision and upgrade deliberately.

## Option 3: Git Subtree

Use this when you want:

- the files committed directly into the consuming repo
- no submodule workflow
- simpler cloning for other contributors

Initial add:

```bash
git remote add agent-forge <agent-forge-repo-url>
git subtree add --prefix=vendor/agent-forge agent-forge main --squash
```

Pull updates later:

```bash
git subtree pull --prefix=vendor/agent-forge agent-forge main --squash
```

Use this when you want the mounted content to behave like normal repo files.

## Option 4: Vendored Copy

You can copy selected files or directories into the consuming repo manually.

Use this only when:

- the consuming repo needs a frozen local snapshot
- the team does not want git submodule or subtree workflows

This has the highest maintenance cost because updates are manual.

## Recommended AGENTS.md Pattern

Keep the consuming repo `AGENTS.md` short. Point to `agent-forge`, then list only the relevant topic files.

Example when mounted in `vendor/agent-forge/`:

```md
# Agent Instructions

## Shared Capability Library

Primary reference:
- `vendor/agent-forge/docs/capabilities_index.md`

Use these topic files for this project:
- `vendor/agent-forge/skills/python/uv-project-setup/SKILL.md`
- `vendor/agent-forge/skills/python/packaging-standards/SKILL.md`
- `vendor/agent-forge/skills/architecture/cli-first-tool-design/SKILL.md`
- `vendor/agent-forge/skills/architecture/artifact-driven-integration/SKILL.md`
- `vendor/agent-forge/skills/testing/test-strategy/SKILL.md`

## Project Constraints

- keep v1 simple
- use `target/manifest.json`
- generate outputs into `target/ggsql/`
```

## What Stays Local

Keep these in the consuming repo:

- project-specific paths
- domain-specific constraints
- exact command names
- current milestone scope
- local architecture decisions

Keep these in `agent-forge`:

- reusable engineering policy
- packaging standards
- workflow patterns
- shared tooling conventions
- generic capability definitions

## Decision Guide

Choose the mount strategy by operational need:

| Need | Recommended model |
|------|-------------------|
| Pin exact shared guidance per repo | Git submodule |
| Keep shared files as normal repository content | Git subtree |
| Local experimentation across sibling repos | Sibling repository |
| Frozen snapshot with manual updates | Vendored copy |

## Recommendation

- Use Tuff for individual skills that should be emitted into an agent harness,
  versioned, checked for drift, and updated from upstream.
- Mount `agent-forge` at `vendor/agent-forge/` when the project needs the full
  library, then reference only the relevant entries from
  `docs/capabilities_index.md` in the consuming repository's `AGENTS.md`.

Both approaches keep project-specific decisions local while preserving a clear
update path for shared capability.
