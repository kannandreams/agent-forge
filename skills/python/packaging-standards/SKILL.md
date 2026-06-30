---
name: packaging-standards
version: 1.0.0
description: Define a practical packaging baseline for a Python project so that implementation work starts from a consistent structure.
triggers:
  - "package this project"
  - "python packaging"
  - "project structure"
  - "set up packaging"
  - "define project layout"
allowed-tools: [Read, Write]
---

# Python Packaging Standards Skill

## When to invoke this skill

Define a practical packaging baseline for a Python project so that
implementation work starts from a consistent structure.

Do NOT use this for CI/CD pipeline setup or deployment configuration — this
skill covers the source layout, packaging files, and dependency management
rules only. For project initialization with `uv` specifically, see
`uv-project-setup`.

## Inputs

- project type
- CLI or library expectations
- dependency constraints
- testing needs
- release expectations

## Outputs

- recommended project structure
- required packaging files
- dependency management rules
- testing and linting entry points
- file layout guidance

## Rules

- Prefer `pyproject.toml` as the primary package configuration.
- Use `src/` layout for packaged code unless the project has a strong reason not to.
- Keep dependency management reproducible.
- Avoid tool sprawl in v1.
- Separate runtime and development dependencies clearly.

## Default Baseline

- `pyproject.toml`
- `uv.lock`
- `.python-version`
- `src/`
- `tests/`
- `README.md`

## Example Workflow

1. Identify the project type (library, CLI, application) and its packaging needs.
2. Select the minimal set of packaging files based on the baseline.
3. Define dependency management rules: runtime vs dev, lock strategy.
4. Set up testing and linting entry points that run predictably.
5. Document the file layout and developer commands in the project README.

## Acceptance Criteria

The output is acceptable when it:

- defines a small, coherent packaging baseline
- keeps the file layout understandable
- supports testing and command execution cleanly
- avoids premature structure beyond the project need
