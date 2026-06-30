# Philosophy

`agent-forge` is organized around reusable engineering capabilities rather than
isolated prompts or one-off instructions.

## Core Ideas

### Capabilities Over Prompts

Prompts are transient. Capabilities can be versioned, reused, and improved over time.

### Workflows Over Isolated Tasks

A single task can be useful, but durable value comes from repeatable workflows that combine multiple skills into a reliable operating pattern.

### Capability Contracts

Every capability should make its contract obvious:

- when to use it
- when not to use it
- required inputs
- expected outputs
- rules that affect execution
- acceptance criteria that can be checked

### Composable Execution Systems

The repository should be made of small pieces that work together:

- skills define capability
- workflows define orchestration
- templates define structure
- tools define execution

### Human And Agent Use

The system must be readable by humans and precise enough for agents. That means
short files, concrete boundaries, stable paths, and no hidden assumptions about
a specific model, IDE, or runtime.

## What This Means In Practice

- keep reusable process centralized
- keep project state local to the project
- design for reuse instead of one-off completion
- prefer explicit structure over hidden assumptions
- avoid coupling shared assets to a specific model or vendor
- delete or rewrite generic prose that does not change execution
