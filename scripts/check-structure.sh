#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

REQUIRED_DIRS=(
  ".github/workflows"
  "argocd/projects"
  "argocd/applications"
  "argocd/applicationsets"
  "apps"
  "clusters"
  "docs"
  "policies"
  "scripts"
  "examples"
)

for dir in "${REQUIRED_DIRS[@]}"; do
  if [[ ! -d "$dir" ]]; then
    echo "ERROR: Missing required directory: $dir"
    exit 1
  fi
done

echo "Repository structure check passed."

