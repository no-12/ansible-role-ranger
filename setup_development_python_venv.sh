#!/usr/bin/env bash
set -eu -o pipefail

cd "$(dirname "$0")"
if [[ ! -d ".py_venv" || ${1:-} == 'force' ]]; then
    rm -rf ".py_venv"
    python3 -m venv .py_venv
    source ".py_venv/bin/activate"
    pip install -U pip pylint autopep8 ranger-fm ansible ansible-lint molecule 'molecule[docker]' docker
    deactivate
fi
