---
name: debugging
version: 1.0.0
description: Systematic approach to debugging issues in development, staging, and production environments.
triggers:
  - "debug this"
  - "why is this failing"
  - "troubleshoot"
  - "debug"
  - "what's wrong with"
  - "investigate this bug"
  - "figure out why"
allowed-tools: [Read, Grep, Glob, Bash]
---

# Debugging Skill

## When to invoke this skill

Debug a specific issue — reproduce, isolate, identify root cause, fix, and
verify. Use this when a bug is reported, a test is failing, a deployment
is behaving unexpectedly, or a user reports incorrect behavior.

Do NOT use this for incident response triage and stabilization —
`incident-response` handles the broader operational response. Do NOT use this
for writing tests or defining test strategy — `test-strategy` handles that.
This skill is for the focused act of finding and fixing a specific defect.

## Inputs

- symptom description
- reproduction steps or lack thereof
- error messages and stack traces
- relevant logs and metrics
- recent changes (commits, config, dependencies, deployments)
- environment differences (dev, staging, prod)

## Outputs

- root cause analysis
- fix or workaround
- verification steps confirming the fix
- regression risk notes
- prevention recommendations

## Rules

- Reproduce before hypothesizing — if reproduction is impossible, document
  exactly what was tried.
- Narrow the problem space before forming theories: isolate the failing
  component, request, or state transition.
- Read error messages completely — do not skim stack traces or log lines.
- Check recent changes first — most regressions come from the last deploy.
- Verify the fix in the same context where the bug was found.
- Do not ship a fix without confirming the original symptom is gone.

## Example Workflow

1. Read the symptom description and any error output thoroughly.
2. Attempt to reproduce the issue in the reported environment.
3. If reproducible, narrow the scope — isolate the failing function, endpoint,
   or component.
4. Inspect the relevant code path, error handling, and state changes.
5. Form a hypothesis and test it with a minimal reproduction or targeted log.
6. Apply the fix and verify the original symptom no longer occurs.
7. Check for regressions — could this fix break anything else?
8. Document the root cause and any prevention steps.

## Debugging Heuristics

| Situation | First Check |
|-----------|------------|
| "It was working and now it's not" | Recent commits, deploys, or config changes |
| Null reference or undefined | Missing null guard — trace the data source |
| Wrong output, no error | Logic error — compare expected vs actual data flow |
| Timeout or hang | Blocking I/O, infinite loop, deadlock |
| Works locally, fails in prod | Environment difference — config, secrets, version |
| Intermittent failure | Race condition, resource exhaustion, flaky test |

## Acceptance Criteria

The debug session is complete when it:

- identifies the root cause with evidence (log, reproduction, code path)
- applies a fix that eliminates the symptom
- verifies the fix does not introduce regressions in the affected code path
- documents any environment-specific factors that contributed
- recommends prevention if the root cause could recur
