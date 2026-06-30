---
name: ci-cd-pipeline
version: 1.0.0
description: Design and configure a CI/CD pipeline that builds, tests, and deploys software with minimal manual intervention.
triggers:
  - "set up ci/cd"
  - "ci/cd pipeline"
  - "github actions"
  - "deployment pipeline"
  - "automate build and deploy"
  - "configure CI"
allowed-tools: [Read, Write]
---

# CI/CD Pipeline Skill

## When to invoke this skill

Design a CI/CD pipeline for a project — build, test, and deploy stages with
clear triggers, environment separation, and rollback paths. Use this when
setting up automation for a new project, migrating an existing one, or adding
a deploy stage to an existing pipeline.

Do NOT use this for one-off deployment scripts or manual release checklists —
`release-management` handles that. Do NOT use this for infrastructure
provisioning or environment setup — this skill covers the pipeline definition,
not the runtime infrastructure.

## Inputs

- project type and language
- build tooling and commands
- test suite structure
- deploy targets (environments, platforms)
- branch and merge strategy
- rollback requirements
- environment variables and secrets
- approval gates or compliance requirements

## Outputs

- pipeline stages with triggers
- build and test commands
- deploy configuration per environment
- rollback strategy
- environment variable and secret handling plan
- pipeline file or configuration outline

## Rules

- Each stage should have a clear pass/fail condition.
- Separate environment-specific configuration from pipeline logic.
- Never hard-code secrets in pipeline files — use the platform's secret store.
- The pipeline should fail fast on build or test failures before reaching deploy.
- Include a rollback path in the deploy stage, not as an afterthought.
- Keep the pipeline definition readable — a new team member should understand
  it in under 10 minutes.

## Example Workflow

1. Identify the project's build command, test command, and deploy target.
2. Define the stage order: build → test → stage (optional) → deploy.
3. Map branch triggers — which branches trigger which stages.
4. Configure environment variables and secrets for each stage.
5. Add the rollback mechanism and post-deploy health check.
6. Write the pipeline file with inline comments for each stage.

## Pipeline Stage Reference

| Stage | Purpose | Typical Trigger |
|-------|---------|-----------------|
| Build | Compile, lint, bundle | Every push |
| Test | Unit, integration, E2E | Every push (after build) |
| Stage | Deploy to staging env | PR merge to main |
| Deploy | Deploy to production | Manual approval or tag push |
| Rollback | Revert to previous deploy | Manual trigger |

## Acceptance Criteria

The pipeline is acceptable when it:

- builds the project reliably on every push
- runs tests and blocks deployment on failure
- deploys to the correct environment with clear triggers
- includes a documented rollback path
- separates secrets from pipeline configuration
- is readable and maintainable by the full team
