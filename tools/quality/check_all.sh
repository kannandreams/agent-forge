#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

tools/quality/check_skill_schema.sh
tools/quality/check_capabilities_index.sh
tools/quality/check_markdown_quality.sh
tools/quality/check_shell.sh

echo "All quality checks passed."
