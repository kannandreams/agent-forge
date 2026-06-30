# Architecture

`agent-forge` is a Markdown-first capability library with a simple layered
structure. The layers are deliberately boring: they make it clear where process
definition ends and execution begins.

## Layers

### Skills

Skills are the smallest reusable units. A skill describes a capability with inputs, outputs, rules, and expected behavior.

### Workflows

Workflows orchestrate skills. They define the order of operations for a repeatable task or process.

### Templates

Templates standardize structure. They help projects produce consistent outputs without redefining formatting each time.

### Tools

Tools execute actions. They connect process guidance to shell scripts, APIs, or
local utilities. Tool logic should stay narrow; reusable judgment belongs in
skills and workflows.

### Examples

Examples show how the pieces fit together in practice. They are a bridge between shared capability and project usage.

## Repository Shape

The repository is intentionally shallow:

- domain folders group related skills
- workflow files describe end-to-end processes
- templates provide reusable document shapes
- tool folders hold executable helpers with focused README files
- docs explain the operating model

## Design Constraints

- no framework required initially
- no vendor lock-in
- no assumptions about a single agent runtime
- no hidden coupling between shared assets and project-specific state
- no placeholder directories without a stated owner, purpose, or next action

## Growth Model

Add new capability by extending the smallest relevant layer:

1. add or refine a skill
2. compose it into a workflow if needed
3. add a template if the output should be standardized
4. document the pattern with an example

This keeps the repository easy to understand as it grows.
