#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if command -v kustomize >/dev/null 2>&1; then
  KUSTOMIZE_CMD=(kustomize build --load-restrictor=LoadRestrictionsNone)
elif command -v kubectl >/dev/null 2>&1; then
  KUSTOMIZE_CMD=(kubectl kustomize --load-restrictor=LoadRestrictionsNone)
else
  echo "ERROR: kustomize (or kubectl) not found."
  exit 1
fi

mapfile -t KUSTOMIZATION_DIRS < <(find apps clusters argocd -type f \( -name 'kustomization.yaml' -o -name 'kustomization.yml' \) -exec dirname {} \; | sort -u)

if [[ ${#KUSTOMIZATION_DIRS[@]} -eq 0 ]]; then
  echo "No kustomization files found."
  exit 0
fi

for dir in "${KUSTOMIZATION_DIRS[@]}"; do
  echo "Rendering: $dir"
  rendered_file="$(mktemp)"
  "${KUSTOMIZE_CMD[@]}" "$dir" > "$rendered_file"

  if command -v kubeconform >/dev/null 2>&1; then
    kubeconform -strict -ignore-missing-schemas -summary "$rendered_file"
  fi

  rm -f "$rendered_file"
done

echo "Kustomize rendering completed."
