#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

status=0

check_local_link() {
  local file="$1"
  local raw_target="$2"
  local target path base

  target="${raw_target#<}"
  target="${target%>}"

  case "$target" in
    ""|\#*|http://*|https://*|mailto:*|app://*)
      return 0
      ;;
  esac

  path="${target%%#*}"

  if [[ "$path" == /* ]]; then
    return 0
  fi

  base="$(dirname "$file")"

  if [[ ! -e "$base/$path" ]]; then
    echo "$file: broken local markdown link '$raw_target'" >&2
    status=1
  fi
}

while IFS= read -r file; do
  if [[ -s "$file" ]]; then
    last_byte="$(tail -c 1 "$file" | od -An -t x1 | tr -d '[:space:]')"
    if [[ "$last_byte" != "0a" ]]; then
      echo "$file: missing newline at EOF" >&2
      status=1
    fi
  fi

  if grep -Eiq '\b(TBD|coming soon|future content|reserved for)\b|TODO:' "$file"; then
    echo "$file: contains placeholder language" >&2
    status=1
  fi

  links="$(grep -Eoh '\[[^]]+\]\([^)]+\)' "$file" || true)"
  while IFS= read -r link; do
    [[ -z "$link" ]] && continue
    target="${link#*\(}"
    target="${target%\)}"
    check_local_link "$file" "$target"
  done <<< "$links"
done < <(find . -path './.git' -prune -o -name '*.md' -print | sort)

if [[ "$status" -ne 0 ]]; then
  exit "$status"
fi

echo "Markdown quality check passed."
