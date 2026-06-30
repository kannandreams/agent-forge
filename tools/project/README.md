# Project Tools

This folder contains project-level tooling that supports reusable execution
patterns.

## Tools

- `scaffold.sh` — scaffold a new Python project following agent-forge
  packaging standards and `uv` conventions.

## Usage

```bash
# Scaffold a new library project
./tools/project/scaffold.sh my-library

# Scaffold a CLI with flat layout
./tools/project/scaffold.sh my-cli --layout flat --python 3.11

# Preview what would be created
./tools/project/scaffold.sh my-project --dry-run
```
