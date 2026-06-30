#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

status=0

node_files="$(find bin tools -type f \( -name '*.js' -o -path 'bin/agent-forge' \) | sort)"

while IFS= read -r node_file; do
  [[ -z "$node_file" ]] && continue

  if ! node --check "$node_file"; then
    status=1
  fi
done <<< "$node_files"

if [[ "$status" -ne 0 ]]; then
  exit "$status"
fi

echo "Node check passed."
