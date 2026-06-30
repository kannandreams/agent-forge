# agent-wrap

`agent-wrap` is a small Python terminal wrapper for `agent-forge`.

It gives users one command for common discovery actions:

- browse available skills
- install a selected skill through `npx skills add`
- view repository Markdown docs in a rendered terminal view
- inspect the command format before running it

## Command

From this repository:

```bash
bin/agent-wrap
```

To make the command available as `agent-wrap`, add the repository `bin/`
directory to `PATH` or symlink it into a user-local bin directory:

```bash
ln -s /path/to/agent-forge/bin/agent-wrap ~/.local/bin/agent-wrap
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
agent-wrap --source your-org/agent-forge
```

Preview install commands without invoking `npx`:

```bash
agent-wrap --dry-run
```

## Documentation View

The docs view renders Markdown directly in the terminal using simple heading
and list formatting. It uses an alternate terminal screen where available, so
returning with `Esc`, `q`, or `Enter` restores the menu.

This keeps the wrapper dependency-light by using only the Python standard
library. A richer renderer can be added later behind the same menu if the
project standardizes on a tool such as `glow`.

## Naming

`agent-wrap` is a good name for a wrapper command: it communicates that the
tool sits around existing commands such as `npx skills add`.

For the project or a long-lived CLI brand, stronger alternatives are:

- `agent-forge`
- `forge`
- `skillforge`
- `capforge`

Keep `agent-wrap` if the command remains an adapter. Prefer `forge` or
`agent-forge` if the CLI becomes the primary product surface.
