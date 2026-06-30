#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

install_hook() {
  local name="$1"
  local source="hooks/$name"
  local target=".git/hooks/$name"

  if [[ ! -f "$source" ]]; then
    echo "Missing hook source: $source" >&2
    exit 1
  fi

  cp "$source" "$target"
  chmod +x "$target"
  echo "Installed $target"
}

install_hook pre-commit
install_hook pre-push
install_hook commit-msg
