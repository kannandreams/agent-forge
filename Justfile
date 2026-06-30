set shell := ["bash", "-euo", "pipefail", "-c"]

default:
    just --list

agent-forge:
    bin/agent-forge

check: check-skills check-index check-markdown check-shell check-node

check-skills:
    tools/quality/check_skill_schema.sh

check-index:
    tools/quality/check_capabilities_index.sh

check-markdown:
    tools/quality/check_markdown_quality.sh

check-shell:
    tools/quality/check_shell.sh

check-node:
    tools/quality/check_node.sh

install-hooks:
    hooks/install.sh
