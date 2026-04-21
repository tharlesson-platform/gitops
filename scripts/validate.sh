#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[1/6] YAML lint"
./scripts/check-yaml.sh

echo "[2/6] Repository structure"
./scripts/check-structure.sh

echo "[3/6] Required files"
./scripts/check-required-files.sh

echo "[4/6] Naming conventions"
./scripts/check-naming.sh

echo "[5/6] Kustomize render"
./scripts/render-kustomize.sh

echo "[6/6] Argo CD manifests"
./scripts/validate-argocd.sh

echo "All validations completed successfully."

