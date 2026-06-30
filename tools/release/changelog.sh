#!/usr/bin/env bash
set -euo pipefail

# Generate a changelog from git tags and merge commits on the default branch.
# Uses the release-management skill output patterns for structured release notes.
#
# Usage: ./changelog.sh [--since <tag>] [--until <tag>] [--format markdown|plain]
# Default: generates changelog since the last semantic version tag.

FORMAT="markdown"
SINCE=""
UNTIL="HEAD"
OUTPUT=""
PREFIX="v"

usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Generate a changelog from git history.

Options:
  --since <ref>      Start from this tag or commit (default: last version tag)
  --until <ref>      End at this tag or commit (default: HEAD)
  --format <type>    Output format: markdown or plain (default: markdown)
  --output <file>    Write to file instead of stdout
  --prefix <str>     Tag prefix to use for version detection (default: v)
  -h, --help         Show this message

Examples:
  $(basename "$0")                             # changelog since last tag
  $(basename "$0") --since v1.2.0              # changelog since v1.2.0
  $(basename "$0") --since v1.0.0 --until v1.2.0  # changelog for a version range
  $(basename "$0") --output CHANGELOG.md        # write to file
EOF
  exit 0
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --since)
      if [[ $# -lt 2 || "$2" == -* ]]; then
        echo "Error: --since requires a ref" >&2
        exit 1
      fi
      SINCE="$2"
      shift 2
      ;;
    --until)
      if [[ $# -lt 2 || "$2" == -* ]]; then
        echo "Error: --until requires a ref" >&2
        exit 1
      fi
      UNTIL="$2"
      shift 2
      ;;
    --format)
      if [[ $# -lt 2 || "$2" == -* ]]; then
        echo "Error: --format requires markdown or plain" >&2
        exit 1
      fi
      FORMAT="$2"
      shift 2
      ;;
    --output)
      if [[ $# -lt 2 || "$2" == -* ]]; then
        echo "Error: --output requires a file path" >&2
        exit 1
      fi
      OUTPUT="$2"
      shift 2
      ;;
    --prefix)
      if [[ $# -lt 2 ]]; then
        echo "Error: --prefix requires a value" >&2
        exit 1
      fi
      PREFIX="$2"
      shift 2
      ;;
    -h|--help) usage ;;
    -*)        echo "Unknown option: $1"; usage ;;
    *)         echo "Unknown argument: $1"; usage ;;
  esac
done

if [[ "$FORMAT" != "markdown" && "$FORMAT" != "plain" ]]; then
  echo "Error: format must be 'markdown' or 'plain'" >&2
  exit 1
fi

# Auto-detect since tag if not specified
if [[ -z "$SINCE" ]]; then
  SINCE=$(git describe --tags --abbrev=0 --match "${PREFIX}*" 2>/dev/null || echo "")
  if [[ -z "$SINCE" ]]; then
    SINCE=$(git rev-list --max-parents=0 HEAD)
  fi
fi

RANGE="${SINCE}..${UNTIL}"

# Collect changes grouped by type
FEATURES=$(git log "$RANGE" --no-merges --pretty=format:"%s" --grep="^feat" 2>/dev/null || echo "")
FIXES=$(git log "$RANGE" --no-merges --pretty=format:"%s" --grep="^fix" 2>/dev/null || echo "")
CHORES=$(git log "$RANGE" --no-merges --pretty=format:"%s" --grep="^chore" 2>/dev/null || echo "")
DOCS=$(git log "$RANGE" --no-merges --pretty=format:"%s" --grep="^docs" 2>/dev/null || echo "")
REFS=$(git log "$RANGE" --no-merges --pretty=format:"%s" --grep="^refactor" 2>/dev/null || echo "")
OTHER=$(git log "$RANGE" --no-merges --pretty=format:"%s" | grep -v "^feat\|^fix\|^chore\|^docs\|^refactor\|^test\|^ci\|^style\|^perf" 2>/dev/null || echo "")

# Get version info
CURRENT_TAG=$(git describe --tags --abbrev=0 --match "${PREFIX}*" 2>/dev/null || echo "unreleased")
DATE=$(date +%Y-%m-%d)

emit_markdown() {
    echo "# Changelog"
    echo ""
    echo "## ${CURRENT_TAG} (${DATE})"
    echo ""

    if [[ -n "$FEATURES" ]]; then
      echo "### Features"
      echo "$FEATURES" | sed -E 's/^feat(\([^)]*\))?!?:[[:space:]]*/- /'
      echo ""
    fi

    if [[ -n "$FIXES" ]]; then
      echo "### Fixes"
      echo "$FIXES" | sed -E 's/^fix(\([^)]*\))?!?:[[:space:]]*/- /'
      echo ""
    fi

    if [[ -n "$REFS" ]]; then
      echo "### Refactoring"
      echo "$REFS" | sed -E 's/^refactor(\([^)]*\))?!?:[[:space:]]*/- /'
      echo ""
    fi

    if [[ -n "$DOCS" ]]; then
      echo "### Documentation"
      echo "$DOCS" | sed -E 's/^docs(\([^)]*\))?!?:[[:space:]]*/- /'
      echo ""
    fi

    if [[ -n "$CHORES" ]]; then
      echo "### Maintenance"
      echo "$CHORES" | sed -E 's/^chore(\([^)]*\))?!?:[[:space:]]*/- /'
      echo ""
    fi

    if [[ -n "$OTHER" ]]; then
      echo "### Other Changes"
      echo "$OTHER" | sed 's/^/- /'
      echo ""
    fi

    echo "---"
    echo "Range: \`${RANGE}\`"
}

emit_plain() {
    echo "Changelog — ${CURRENT_TAG} (${DATE})"
    echo ""

    if [[ -n "$FEATURES" ]]; then
      echo "Features:"
      echo "$FEATURES" | sed -E 's/^feat(\([^)]*\))?!?:[[:space:]]*/  - /'
      echo ""
    fi

    if [[ -n "$FIXES" ]]; then
      echo "Fixes:"
      echo "$FIXES" | sed -E 's/^fix(\([^)]*\))?!?:[[:space:]]*/  - /'
      echo ""
    fi

    if [[ -n "$REFS" ]]; then
      echo "Refactoring:"
      echo "$REFS" | sed -E 's/^refactor(\([^)]*\))?!?:[[:space:]]*/  - /'
      echo ""
    fi

    if [[ -n "$DOCS" ]]; then
      echo "Documentation:"
      echo "$DOCS" | sed -E 's/^docs(\([^)]*\))?!?:[[:space:]]*/  - /'
      echo ""
    fi

    if [[ -n "$CHORES" ]]; then
      echo "Maintenance:"
      echo "$CHORES" | sed -E 's/^chore(\([^)]*\))?!?:[[:space:]]*/  - /'
      echo ""
    fi

    if [[ -n "$OTHER" ]]; then
      echo "Other Changes:"
      echo "$OTHER" | sed 's/^/  - /'
      echo ""
    fi

    echo "Range: ${RANGE}"
}

# Generate output. Do not redirect to /dev/stdout; some restricted runtimes
# allow writing stdout but block opening that device path.
if [[ "$FORMAT" == "markdown" ]]; then
  if [[ -n "$OUTPUT" ]]; then
    emit_markdown > "$OUTPUT"
  else
    emit_markdown
  fi
else
  if [[ -n "$OUTPUT" ]]; then
    emit_plain > "$OUTPUT"
  else
    emit_plain
  fi
fi

echo "Changelog generated for range ${RANGE}" >&2
