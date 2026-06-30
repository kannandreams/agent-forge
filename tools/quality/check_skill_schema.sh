#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

required_frontmatter=(
  "name:"
  "version:"
  "description:"
  "triggers:"
  "allowed-tools:"
)

required_sections=(
  "## When to invoke this skill"
  "## Inputs"
  "## Outputs"
  "## Rules"
  "## Acceptance Criteria"
)

status=0

while IFS= read -r skill_file; do
  if [[ "$(sed -n '1p' "$skill_file")" != "---" ]]; then
    echo "$skill_file: missing opening YAML frontmatter delimiter" >&2
    status=1
  fi

  if ! sed -n '2,40p' "$skill_file" | grep -Fxq -- "---"; then
    echo "$skill_file: missing closing YAML frontmatter delimiter" >&2
    status=1
  fi

  for field in "${required_frontmatter[@]}"; do
    if ! grep -Eq "^${field}" "$skill_file"; then
      echo "$skill_file: missing frontmatter field '$field'" >&2
      status=1
    fi
  done

  for section in "${required_sections[@]}"; do
    if ! grep -Fq "$section" "$skill_file"; then
      echo "$skill_file: missing required section '$section'" >&2
      status=1
    fi
  done
done < <(find skills -path '*/SKILL.md' | sort)

if [[ "$status" -ne 0 ]]; then
  exit "$status"
fi

echo "Skill schema check passed."
