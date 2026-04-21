#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v yamllint >/dev/null 2>&1; then
  echo "ERROR: yamllint not found. Install with: pip install yamllint"
  exit 1
fi

yamllint -c .yamllint.yml .

