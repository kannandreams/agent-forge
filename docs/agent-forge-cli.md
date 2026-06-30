# agent-forge CLI

`agent-forge` is a small Node.js terminal wrapper for this repository.

It gives users one command for common discovery actions:

- browse available skills
- install a selected skill through `npx skills add`
- view repository Markdown docs in a rendered terminal view
- inspect the command format before running it

## Command

Run the CLI directly from GitHub with `npx`:

```bash
npx github:kannandreams/agent-forge
```

For development from this repository:

```bash
bin/agent-forge
```

To create a persistent local command from a checkout:

```bash
npm link
```

Then run:

```bash
agent-forge
```

To make the command available as `agent-forge`, add the repository `bin/`
directory to `PATH` or symlink it into a user-local bin directory:

```bash
ln -s /path/to/agent-forge/bin/agent-forge ~/.local/bin/agent-forge
```

If the installed command cannot locate this checkout, set:

```bash
export AGENT_FORGE_HOME=/path/to/agent-forge
```

## Skill Installation

The wrapper calls:

```bash
npx skills add <source> <skill-path>
```

The default source is:

```text
kannandreams/agent-forge
```

Override it when needed:

```bash
agent-forge --source your-org/agent-forge
```

Preview install commands without invoking `npx`:

```bash
agent-forge --dry-run
```

## Documentation View

The docs view renders Markdown directly in the terminal using simple heading
and list formatting. It uses an alternate terminal screen where available, so
returning with `Esc`, `q`, or `Enter` restores the menu.

This keeps the wrapper dependency-light by using only built-in Node.js APIs. A
richer renderer can be added later behind the same menu if the project
standardizes on a tool such as `glow`.
