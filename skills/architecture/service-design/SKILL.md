---
name: service-design
version: 1.0.0
description: Define the shape of a service before implementation by clarifying responsibilities, boundaries, interfaces, data flow, and operational concerns.
triggers:
  - "design a service"
  - "service boundary"
  - "define service"
  - "api design"
allowed-tools: [Read, Write]
---

# Service Design Skill

## When to invoke this skill

Define the shape of a service before implementation by clarifying
responsibilities, boundaries, interfaces, data flow, and operational concerns.

Do NOT use this for frontend component design, database schema design, or
infrastructure provisioning — this skill is about service-level architecture:
what the service owns, what it exposes, and how it connects to its
environment.

## Inputs

- service goal
- domain context
- consumers or callers
- data requirements
- scaling or reliability needs
- integration constraints

## Outputs

- service responsibility statement
- interface outline
- data model notes
- dependency map
- operational considerations
- implementation risks

## Rules

- Keep the service boundary narrow.
- Prefer explicit interfaces over implicit behavior.
- Call out operational concerns early.
- Avoid inventing unnecessary layers.
- Define failure modes upfront — what happens when a dependency is unavailable or returns unexpected data.

## Example Workflow

1. Identify the service's domain boundary — what it owns vs what it consumes.
2. Define the interface: inputs, outputs, and failure modes for each call path.
3. Model the data flow through the service, identifying state boundaries.
4. Map dependencies and integration points with upstream and downstream systems.
5. Surface operational concerns: scaling limits, reliability requirements, and monitoring hooks.

## Acceptance Criteria

The output is acceptable when it:

- draws a clear boundary around the service's responsibility
- defines explicit interfaces with expected inputs and outputs
- identifies dependencies and their failure modes
- surfaces at least one operational concern (scaling, monitoring, reliability)
- avoids overdesign — no unnecessary layers or abstractions
