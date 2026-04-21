#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v git >/dev/null 2>&1 || ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "git repository not detected. Skipping critical path diff."
  exit 0
fi

if [[ $# -ge 2 ]]; then
  BASE_SHA="$1"
  HEAD_SHA="$2"
else
  if git rev-parse --verify origin/main >/dev/null 2>&1; then
    BASE_SHA="$(git merge-base HEAD origin/main)"
  else
    BASE_SHA="$(git rev-list --max-parents=0 HEAD | tail -n 1)"
  fi
  HEAD_SHA="HEAD"
fi

CHANGED_FILES="$(git diff --name-only "$BASE_SHA" "$HEAD_SHA")"

if [[ -z "$CHANGED_FILES" ]]; then
  echo "No changed files detected between $BASE_SHA and $HEAD_SHA."
  exit 0
fi

echo "Changed files in range $BASE_SHA..$HEAD_SHA:"
echo "$CHANGED_FILES"

CRITICAL_CHANGES="$(echo "$CHANGED_FILES" | grep -E '^(\.github/workflows/|argocd/|clusters/prod/|policies/)' || true)"
if [[ -n "$CRITICAL_CHANGES" ]]; then
  echo "Critical paths changed:"
  echo "$CRITICAL_CHANGES"
fi

if echo "$CHANGED_FILES" | grep -q '^clusters/prod/'; then
  echo "Production paths changed. Human approval is required by policy."
fi
