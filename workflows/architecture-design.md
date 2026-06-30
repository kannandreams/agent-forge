# Architecture Design Workflow

## Purpose

Design a system or service from concept through implementation plan using
reusable architecture skills and templates.

Use this workflow when starting a new service, integrating with an existing
system, or designing a CLI-first tool.

## Sequence

1. Use the artifact-driven-integration skill to identify stable inputs and
   output artifacts from any existing systems the design must consume.
2. Use the service-design skill to define the service boundary, interface,
   data flow, and operational concerns.
3. Use the cli-first-tool-design skill if the design includes a CLI surface —
   validate the batch workflow before adding richer interfaces.
4. Use the architecture template to standardize the design output into a
   consistent format.
5. Review the complete design against the acceptance criteria from each skill.

## Rules

- Start from artifacts and boundaries, not from implementation choices.
- Keep the service boundary narrow — add new capabilities later.
- Prove the core data flow before committing to interface details.
- Surface operational concerns (scaling, reliability, monitoring) before
  implementation begins.
- Use the template to keep output consistent, not to fill in blanks with
  guesses.

## Expected Result

An architecture design should end with:

- a clear service boundary and responsibility statement
- explicit interfaces with inputs, outputs, and failure modes
- an artifact integration plan for any external systems
- operational notes (scaling, monitoring, deployment concerns)
- a template-structured document ready for review and implementation
