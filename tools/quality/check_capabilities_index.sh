#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

index_file="docs/capabilities_index.md"
status=0

if [[ ! -f "$index_file" ]]; then
  echo "Missing capabilities index: $index_file" >&2
  exit 1
fi

while IFS= read -r skill_file; do
  if ! grep -Fq "$skill_file" "$index_file"; then
    echo "$index_file: missing skill path '$skill_file'" >&2
    status=1
  fi
done < <(find skills -path '*/SKILL.md' | sort)

listed_paths="$(grep -Eo 'skills/[^`) ]+/[^`) ]+/SKILL.md' "$index_file" || true)"

while IFS= read -r listed_path; do
  [[ -z "$listed_path" ]] && continue

  if [[ ! -f "$listed_path" ]]; then
    echo "$index_file: listed skill does not exist '$listed_path'" >&2
    status=1
  fi
done <<< "$listed_paths"

if [[ "$status" -ne 0 ]]; then
  exit "$status"
fi

echo "Capabilities index check passed."
