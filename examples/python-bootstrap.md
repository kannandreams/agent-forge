# Python Bootstrap Example

Step-by-step walkthrough of setting up a new Python project using agent-forge
skills and the scaffold tool.

## Scenario

A developer needs to create a new CLI tool called `shipctl` that packages and
publishes release artifacts. They want a clean setup following modern Python
packaging standards.

## Step 1: Scaffold with the tool

Run the scaffold tool from agent-forge:

```bash
./vendor/agent-forge/tools/project/scaffold.sh shipctl --layout src --python 3.12
```

This creates:

```
shipctl/
├── .gitignore
├── .python-version
├── README.md
├── pyproject.toml
├── src/
│   └── shipctl/
│       └── __init__.py
└── tests/
    ├── __init__.py
    └── test_bootstrap.py
```

## Step 2: Verify against packaging standards

Apply the packaging-standards skill to validate the structure:

- `pyproject.toml` is the primary config file
- `src/` layout keeps imports isolated
- Runtime and dev dependencies are separated
- `uv.lock` will be committed for reproducible builds

The layout passes the baseline check. One gap: the project needs a CLI entry
point. Add to `pyproject.toml`:

```toml
[project.scripts]
shipctl = "shipctl.cli:main"
```

## Step 3: Define a test strategy

Apply the test-strategy skill:

**Risk profile:**
- Package creation (medium risk — wrong artifact ships)
- Release validation (high risk — broken release)
- CLI interface (low risk — arg parsing won't corrupt data)

**Test layers:**
- Unit tests for packaging logic
- Integration tests for the full pack-and-publish flow
- Smoke test for CLI help output

Create `tests/test_packaging.py` with the highest-priority tests first.

## Step 4: Init with uv

```bash
cd shipctl
uv venv
uv sync
uv add click requests
uv add --dev pytest pytest-mock
uv run pytest
```

## Step 5: Apply the architecture design workflow (optional)

If `shipctl` integrates with an existing CI system or artifact repository:

- Use `artifact-driven-integration` to consume build artifacts from CI
- Use `service-design` to define the tool's responsibility boundary
- Use `cli-first-tool-design` to validate the batch workflow before adding
  interactive features

## Result

A fully bootstrapped Python project:

- Consistent layout following agent-forge packaging standards
- Test strategy that prioritizes the highest-risk behavior
- Reproducible dependency management with `uv`
- Ready for the full cycle: plan → build → review → ship

## Skills Used

- `uv-project-setup` — project initialization and dependency management
- `packaging-standards` — file layout validation and baseline
- `test-strategy` — risk-based test prioritization

## Tools Used

- `tools/project/scaffold.sh` — project skeleton generation
