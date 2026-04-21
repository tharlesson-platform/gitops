#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  tracked_paths="$(git ls-files)"
else
  tracked_paths="$(find . -type f | sed 's|^\./||')"
fi

invalid_paths="$(echo "$tracked_paths" | grep -E '[A-Z ]' || true)"
if [[ -n "$invalid_paths" ]]; then
  echo "ERROR: Found paths with uppercase letters or spaces:"
  echo "$invalid_paths"
  exit 1
fi

for dir in apps/*/overlays/*; do
  [[ -d "$dir" ]] || continue
  env_name="$(basename "$dir")"
  case "$env_name" in
    dev|stage|prod) ;;
    *)
      echo "ERROR: Invalid overlay environment name: $dir"
      exit 1
      ;;
  esac
done

for dir in clusters/*; do
  [[ -d "$dir" ]] || continue
  env_name="$(basename "$dir")"
  case "$env_name" in
    dev|stage|prod) ;;
    *)
      echo "ERROR: Invalid cluster environment directory: $dir"
      exit 1
      ;;
  esac
done

echo "Naming convention check passed."
