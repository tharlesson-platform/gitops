#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

REQUIRED_FILES=(
  "README.md"
  "LICENSE"
  "CONTRIBUTING.md"
  "SECURITY.md"
  "GOVERNANCE.md"
  ".github/PULL_REQUEST_TEMPLATE.md"
  ".github/CODEOWNERS"
  "docs/bootstrap.md"
  "docs/promotion-flow.md"
  "policies/promotion-policy.md"
  "scripts/validate.sh"
)

for file in "${REQUIRED_FILES[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "ERROR: Missing required file: $file"
    exit 1
  fi
done

echo "Required files check passed."

