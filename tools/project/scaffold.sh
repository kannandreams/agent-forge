#!/usr/bin/env bash
set -euo pipefail

# Scaffold a new Python project following agent-forge packaging standards.
# Follows uv-project-setup and packaging-standards skills.
#
# Usage: ./scaffold.sh <project-name> [options]

PYTHON_VERSION="3.12"
LAYOUT="src"
LICENSE="MIT"
DRY_RUN=false

usage() {
  cat <<EOF
Usage: $(basename "$0") <project-name> [OPTIONS]

Scaffold a new Python project following agent-forge standards.

Options:
  --python <version>    Python version (default: 3.12)
  --layout <type>       Project layout: src or flat (default: src)
  --license <type>      License type (default: MIT)
  --dry-run             Show what would be created without creating files
  -h, --help            Show this message

Examples:
  $(basename "$0") my-project
  $(basename "$0") my-cli --layout flat --python 3.11
  $(basename "$0") my-lib --dry-run
EOF
  exit 0
}

# Parse arguments
PROJECT_NAME=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --python)    PYTHON_VERSION="$2"; shift 2 ;;
    --layout)    LAYOUT="$2"; shift 2 ;;
    --license)   LICENSE="$2"; shift 2 ;;
    --dry-run)   DRY_RUN=true; shift ;;
    -h|--help)   usage ;;
    -*)
      echo "Unknown option: $1"
      usage
      ;;
    *)
      if [[ -z "$PROJECT_NAME" ]]; then
        PROJECT_NAME="$1"
        shift
      else
        echo "Unknown argument: $1"
        usage
      fi
      ;;
  esac
done

if [[ -z "$PROJECT_NAME" ]]; then
  echo "Error: project name is required"
  usage
fi

if [[ "$PROJECT_NAME" =~ [^a-zA-Z0-9_-] ]]; then
  echo "Error: project name must contain only alphanumeric characters, hyphens, and underscores"
  exit 1
fi

if [[ -d "$PROJECT_NAME" ]]; then
  echo "Error: directory '$PROJECT_NAME' already exists"
  exit 1
fi

create_dir() { if $DRY_RUN; then echo "  [dry-run] mkdir -p $1"; else mkdir -p "$1"; fi; }
create_file() {
  local path="$1" content="$2"
  if $DRY_RUN; then
    echo "  [dry-run] write $path"
  else
    cat > "$path" <<< "$content"
  fi
}

echo "Scaffolding Python project: $PROJECT_NAME"
echo "  Python: $PYTHON_VERSION"
echo "  Layout: $LAYOUT"
echo "  License: $LICENSE"
echo ""

# Create directories
create_dir "$PROJECT_NAME"
create_dir "$PROJECT_NAME/tests"

if [[ "$LAYOUT" == "src" ]]; then
  create_dir "$PROJECT_NAME/src/$PROJECT_NAME"
  MODULE_PATH="src/$PROJECT_NAME"
else
  MODULE_PATH="$PROJECT_NAME"
  create_dir "$PROJECT_NAME/$PROJECT_NAME"
fi

# .python-version
create_file "$PROJECT_NAME/.python-version" "$PYTHON_VERSION"

# pyproject.toml
read -rd '' PYPROJECT <<PYEOF || true
[project]
name = "$PROJECT_NAME"
version = "0.1.0"
description = ""
readme = "README.md"
requires-python = ">=$(echo "$PYTHON_VERSION" | cut -d. -f1-2)"
dependencies = []

[project.optional-dependencies]
dev = [
    "pytest>=8",
]

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

[tool.pytest.ini_options]
testpaths = ["tests"]
PYEOF
create_file "$PROJECT_NAME/pyproject.toml" "$PYPROJECT"

# README.md
create_file "$PROJECT_NAME/README.md" "# $PROJECT_NAME"

# .gitignore
read -rd '' GITIGNORE <<GIEOF || true
__pycache__/
*.pyc
*.egg-info/
dist/
build/
.venv/
uv.lock
.pytest_cache/
GIEOF
create_file "$PROJECT_NAME/.gitignore" "$GITIGNORE"

# tests/conftest.py (empty)
create_file "$PROJECT_NAME/tests/__init__.py" ""

# test file
read -rd '' TESTFILE <<TESTEOF || true
def test_project_can_be_imported():
    import $PROJECT_NAME
    assert $PROJECT_NAME is not None
TESTEOF
create_file "$PROJECT_NAME/tests/test_bootstrap.py" "$TESTFILE"

# Module init
if [[ "$LAYOUT" == "src" ]]; then
  create_file "$PROJECT_NAME/src/$PROJECT_NAME/__init__.py" "__version__ = \"0.1.0\""
else
  create_file "$PROJECT_NAME/$PROJECT_NAME/__init__.py" "__version__ = \"0.1.0\""
fi

echo ""
echo "Done. Run these commands to finish:"
echo ""
echo "  cd $PROJECT_NAME"
echo "  uv venv"
echo "  uv sync"
echo "  uv run pytest"
echo ""

if $DRY_RUN; then
  echo "[dry-run] No files were created. Remove --dry-run to scaffold the project."
fi
