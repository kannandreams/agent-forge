#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

status=0
python_bin="${PYTHON:-python3}"

python_files="$(find bin tools -type f \( -name '*.py' -o -path 'bin/agent-wrap' \) | sort)"

while IFS= read -r python_file; do
  [[ -z "$python_file" ]] && continue

  if ! "$python_bin" -c 'import ast, pathlib, sys; ast.parse(pathlib.Path(sys.argv[1]).read_text(encoding="utf-8"), filename=sys.argv[1])' "$python_file"; then
    status=1
  fi
done <<< "$python_files"

if [[ "$status" -ne 0 ]]; then
  exit "$status"
fi

echo "Python check passed."
