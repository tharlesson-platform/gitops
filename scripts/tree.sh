#!/usr/bin/env bash
set -euo pipefail

if command -v tree >/dev/null 2>&1; then
  tree -a -I '.git|.github/actions-cache|node_modules|.idea|.vscode'
else
  find . -mindepth 1 -maxdepth 6 | sort
fi

