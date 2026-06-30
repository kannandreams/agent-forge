# Hooks

This repository keeps hook logic in versioned files and installs thin wrappers
into `.git/hooks/` only when a contributor opts in.

## Commands

Run all checks:

```bash
just check
```

Run individual checks:

```bash
just check-skills
just check-index
just check-markdown
just check-shell
```

Install local Git hooks:

```bash
just install-hooks
```

If `just` is not installed, call the scripts directly:

```bash
tools/quality/check_all.sh
hooks/install.sh
```

## Installed Hooks

- `pre-commit` runs the full lightweight repository check.
- `pre-push` runs the same full check before publishing.
- `commit-msg` validates the commit type when the message looks like a normal
  commit. It allows merge, revert, squash, and fixup commits.

The hooks do not replace CI. They catch local drift early and use the same
scripts that CI should call.

## Design Rules

- Keep hook logic in `tools/quality/`, not inside `.git/hooks/`.
- Keep hooks deterministic and fast.
- Avoid network calls in hooks.
- Make checks runnable without installing optional dependencies.
- Use optional tools, such as `shellcheck`, only when already available.
