#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v kubeconform >/dev/null 2>&1; then
  echo "ERROR: kubeconform not found."
  exit 1
fi

mapfile -t ARGOCD_FILES < <(find argocd -type f \( -name '*.yaml' -o -name '*.yml' \) | sort)

if [[ ${#ARGOCD_FILES[@]} -eq 0 ]]; then
  echo "No Argo CD manifests found."
  exit 0
fi

kubeconform -strict -ignore-missing-schemas -summary "${ARGOCD_FILES[@]}"

