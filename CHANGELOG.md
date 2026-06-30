# Changelog

## 1.0.0 (2026-06-30)

### Added

- 12 production-grade skills across 6 domains (architecture, github, incident,
  python, release, testing) with YAML frontmatter, triggers, and
  `allowed-tools`.
- `npx skills add` compatibility — all skills structured as
  `skills/<domain>/<name>/SKILL.md` directories.
- `version` and `triggers` frontmatter fields on all skills.
- `## When to invoke this skill` section with anti-trigger guidance on all
  skills.
- `allowed-tools` declarations on all skills.
- 4 underdefined skills completed with Example Workflow and Acceptance
  Criteria: `service-design`, `issue-breakdown`, `packaging-standards`,
  `uv-project-setup`.
- 2 new workflows: `architecture-design`, `python-bootstrap`.
- 2 new tools: `tools/release/changelog.sh`, `tools/project/scaffold.sh`.
- 2 new examples: `full-cycle.md`, `python-bootstrap.md`.
- 5 existing workflows: `backlog_creation_workflow`, `code_review_workflow`,
  `milestone_execution`, `release_workflow`, `incident_response_workflow`.
- 2 templates: `architecture_template`, `milestone_template`.
- 1 tool: `tools/github/backlog_to_project.sh`.

### Changed

- Restructured skills from flat `skills/<domain>/<name>.md` to
  `skills/<domain>/<name>/SKILL.md` with YAML frontmatter.
- Updated all docs, examples, and cross-references to new `SKILL.md` paths.
- Folded `## Purpose` into `## When to invoke this skill` on all skills.

### Removed

- 12 old flat skill `.md` files (replaced by directory-structured `SKILL.md`).
