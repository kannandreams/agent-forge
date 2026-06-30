# Python Bootstrap Workflow

## Purpose

Set up a new Python project from zero to a working, testable state using
consistent packaging standards and `uv`.

Use this workflow when starting a new Python project or bringing an existing
one up to the recommended baseline.

## Sequence

1. Use the uv-project-setup skill to initialize the project —
   `pyproject.toml`, Python version, and dependency management.
2. Use the packaging-standards skill to validate the file layout, dependency
   separation, and entry points.
3. Use the test-strategy skill to define what to test, at what level, and
   with what priority for the initial project scope.
4. Verify the setup with a minimal passing test — confirm the project is
   buildable and testable.
5. Document the developer commands in the project README.

## Rules

- Start minimal — add tools only when they solve a current problem.
- Prefer `src/` layout for packaged projects, flat layout for simple
  applications.
- Keep runtime and development dependencies explicitly separated.
- Run everything through `uv run` for reproducibility.
- Commit `uv.lock` for application projects.

## Expected Result

A bootstrapped project should end with:

- a working `pyproject.toml`
- a clear package or project layout
- at least one passing test
- documented setup and development commands
- a test strategy that prioritizes the highest-risk behavior first
