set shell := ["bash", "-euo", "pipefail", "-c"]

default:
    just --list

agent-wrap:
    bin/agent-wrap

check: check-skills check-index check-markdown check-shell check-python

check-skills:
    tools/quality/check_skill_schema.sh

check-index:
    tools/quality/check_capabilities_index.sh

check-markdown:
    tools/quality/check_markdown_quality.sh

check-shell:
    tools/quality/check_shell.sh

check-python:
    tools/quality/check_python.sh

install-hooks:
    hooks/install.sh
