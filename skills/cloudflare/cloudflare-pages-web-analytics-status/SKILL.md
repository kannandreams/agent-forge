---
name: cloudflare-pages-web-analytics-status
version: 1.0.0
description: Interpret Cloudflare Pages and Web Analytics status output to decide whether deployment analytics are present, healthy, and actionable.
triggers:
  - "cloudflare pages analytics"
  - "web analytics status"
  - "cloudflare webanalytics"
  - "pages analytics status"
  - "read webanalytics output"
  - "cloudflare pages status"
allowed-tools: [Read, Bash]
---

# Cloudflare Pages Web Analytics Status Skill

## When to invoke this skill

Read Cloudflare Pages and Web Analytics status output and turn it into an
operational conclusion: analytics available, missing, stale, misconfigured, or
not enough evidence.

Use this when the caller provides CLI output, API output, dashboard-exported
status, GraphQL response data, or logs related to Cloudflare Pages deployments
and Web Analytics.

Do NOT use this for broad Cloudflare account administration, DNS changes,
worker routing, or Pages deployment setup. Those need dedicated skills or
project-specific runbooks.

## Inputs

- Pages project name and environment, if known
- deployment status output
- Web Analytics status or metrics output
- time window used for analytics
- expected hostname or route
- source of the data: dashboard, `wrangler`, GraphQL API, REST API, MCP, or log
- account, zone, and token scope assumptions if live calls are required

## Outputs

- analytics status summary
- evidence table with source, timestamp, and signal
- classification: healthy, no traffic, stale data, not enabled, auth/scope
  issue, deployment issue, or inconclusive
- recommended next check
- MCP/API decision note
- residual risk or missing evidence

## Rules

- Prefer already-captured output when the task is to interpret status.
- Do not require an MCP server for static output review or fixed scripted
  checks.
- Use direct Cloudflare API or GraphQL calls when the query is known, stable,
  and can run with a scoped token.
- Use an MCP server when the agent must discover account context, inspect live
  Cloudflare resources interactively, or adapt GraphQL queries across unknown
  schemas.
- Never print API tokens, account secrets, or full authentication headers.
- Keep the conclusion tied to the time window. Analytics can be healthy and
  still show no traffic for the selected range.
- Distinguish a Pages deployment problem from an analytics instrumentation or
  data-latency problem.

## MCP Decision Guide

| Situation | MCP Needed? | Preferred Path |
|-----------|-------------|----------------|
| User pasted Web Analytics status output | No | Parse the output directly |
| A script has a known GraphQL query and scoped token | No | Call Cloudflare GraphQL/API directly |
| Agent needs to discover accounts, zones, datasets, or schema | Yes, useful | Use Cloudflare GraphQL MCP or equivalent |
| Repeated interactive diagnosis across Cloudflare resources | Yes, useful | Use MCP-backed resource inspection |
| CI health check for one known Pages project | No | Use a deterministic script or API query |

## Example Workflow

1. Identify the data source and time window.
2. Extract Pages deployment state: project, branch, environment, deployment
   time, URL, and latest status.
3. Extract Web Analytics signals: page views, visits, hostname, timestamp,
   dataset/query status, and errors.
4. Compare the analytics hostname and time window against the deployed Pages
   URL or custom domain.
5. Classify the status and state the evidence.
6. Recommend the next check only if the current evidence is insufficient.

## Status Classification

| Classification | Meaning |
|----------------|---------|
| Healthy | Deployment is live and analytics show recent expected signals |
| No traffic | Analytics is available but reports zero traffic for the time window |
| Stale data | Last analytics timestamp is older than the expected freshness window |
| Not enabled | Output indicates Web Analytics is not configured for the site |
| Auth/scope issue | API, GraphQL, or MCP output cannot access the needed data |
| Deployment issue | Pages deployment is failed, missing, or not serving the expected route |
| Inconclusive | Output lacks enough timestamp, hostname, or status evidence |

## Acceptance Criteria

The review is complete when it:

- identifies the source and freshness of the status output
- states whether Web Analytics data is present for the expected Pages site
- separates deployment health from analytics data health
- explains whether MCP is required for the next step
- avoids exposing credentials or sensitive account identifiers
- gives one concrete next check when the result is inconclusive
