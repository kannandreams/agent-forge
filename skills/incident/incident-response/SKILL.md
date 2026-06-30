---
name: incident-response
version: 1.0.0
description: Guide the handling of a production incident from detection through stabilization and follow-up.
triggers:
  - "incident"
  - "production issue"
  - "outage"
  - "handle incident"
  - "incident response"
  - "something is down"
allowed-tools: [Read, Bash]
---

# Incident Response Skill

## When to invoke this skill

Guide the handling of a production incident from detection through
stabilization and follow-up.

Do NOT use this for postmortem writing or root cause analysis — those come
after stabilization and investigation. This skill is for the active response
phase: contain, mitigate, communicate, and preserve context for later
analysis.

## Inputs

- incident symptoms
- affected systems
- severity
- timestamps
- known recent changes
- available responders

## Outputs

- immediate containment actions
- investigation notes
- mitigation steps
- communication points
- follow-up tasks
- post-incident learning items

## Rules

- Stabilize first, analyze second.
- Keep actions explicit and time-stamped.
- Separate mitigation from long-term remediation.
- Preserve evidence where possible.
- Communicate clearly and briefly.

## Example Workflow

1. Confirm the incident and scope.
2. Contain impact if possible.
3. Gather the smallest useful set of facts.
4. Apply mitigation or rollback if needed.
5. Record the timeline and decisions.
6. Create follow-up work for root cause and prevention.

## Acceptance Criteria

The output is acceptable when it:

- states the incident scope clearly
- identifies the immediate mitigation path
- captures key timestamps and actions
- creates concrete follow-up work
- preserves enough context for a later postmortem
