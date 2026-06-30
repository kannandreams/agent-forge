---
name: artifact-driven-integration
version: 1.0.0
description: Integrate with an existing system by consuming its stable artifacts instead of coupling directly to internal runtime behavior.
triggers:
  - "integrate with existing system"
  - "consume artifacts"
  - "artifact-driven integration"
  - "parse generated output"
allowed-tools: [Read, Write]
---

# Artifact-Driven Integration Skill

## When to invoke this skill

Integrate with an existing system by consuming its stable artifacts instead of
coupling directly to internal runtime behavior.

Do NOT use this for live API integration or runtime coupling — this skill is
about offline artifact consumption (generated files, schemas, static exports),
not real-time service calls or message passing.

## Inputs

- target system
- available artifacts
- required outputs
- compatibility constraints
- versioning or schema concerns

## Outputs

- artifact integration plan
- artifact discovery rules
- parsing and validation boundaries
- non-goals for runtime coupling
- testing approach for fixture-based validation

## Rules

- Prefer stable generated artifacts over internal runtime hooks.
- Parse only the data needed for the current use case.
- Keep integration boundaries explicit.
- Treat artifact paths and schema handling as first-class concerns.
- Use fixtures to test artifact loading and resolution logic.

## Example Workflow

1. Identify the authoritative artifact to consume.
2. Define how the artifact is discovered and loaded.
3. Parse the minimum required fields.
4. Resolve references and validate assumptions.
5. Generate downstream output from the parsed model.

## Acceptance Criteria

The output is acceptable when it:

- avoids tight coupling to internal runtime APIs
- defines a clear artifact loading path
- specifies validation and failure behavior
- is testable with checked-in fixtures
