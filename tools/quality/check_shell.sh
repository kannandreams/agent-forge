#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

status=0

shell_files="$(find tools hooks -type f \( -name '*.sh' -o -path 'hooks/pre-commit' -o -path 'hooks/pre-push' -o -path 'hooks/commit-msg' \) | sort)"

while IFS= read -r shell_file; do
  [[ -z "$shell_file" ]] && continue

  if ! bash -n "$shell_file"; then
    status=1
  fi
done <<< "$shell_files"

if command -v shellcheck >/dev/null 2>&1; then
  while IFS= read -r shell_file; do
    [[ -z "$shell_file" ]] && continue

    if ! shellcheck "$shell_file"; then
      status=1
    fi
  done <<< "$shell_files"
else
  echo "shellcheck not found; skipped optional shell lint."
fi

if [[ "$status" -ne 0 ]]; then
  exit "$status"
fi

echo "Shell check passed."
