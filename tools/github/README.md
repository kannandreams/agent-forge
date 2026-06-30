# GitHub Tools

This folder contains GitHub-focused execution helpers. These tools should stay
thin: parse input, call the GitHub CLI or API, and report what changed.

## Current Tool

- `backlog_to_project.sh` - create GitHub Project draft items from a markdown backlog file

## Usage

```bash
./tools/github/backlog_to_project.sh \
  --owner my-org \
  --project 1 \
  --input examples/backlog_input.md
```

The script uses `gh project item-create`, so GitHub CLI authentication must include the `project` scope.
