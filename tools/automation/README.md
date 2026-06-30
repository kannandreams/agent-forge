# Automation Tools

This folder is for automation helpers that are too general for a specific
domain tool folder.

## Acceptance Bar

Add a script here only when it has:

- a clear caller and execution context
- deterministic inputs and outputs
- a dry-run mode when it changes external state
- failure messages that explain what to fix next

Keep reusable process in `skills/` or `workflows/`; keep only execution logic
here.
