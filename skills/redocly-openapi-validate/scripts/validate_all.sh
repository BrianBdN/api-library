#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

if ! command -v redocly >/dev/null 2>&1; then
  echo "redocly CLI not found on PATH. Install it before running this script."
  exit 1
fi

mapfile -t SPECS < <(find "${ROOT_DIR}/specs" -name "openapi.json" -type f | sort)

if [[ ${#SPECS[@]} -eq 0 ]]; then
  echo "No OpenAPI specs found under ${ROOT_DIR}/specs."
  exit 0
fi

echo "Validating ${#SPECS[@]} OpenAPI spec(s)..."

FAILURES=0
for SPEC in "${SPECS[@]}"; do
  echo " - ${SPEC}"
  if ! redocly lint "${SPEC}"; then
    FAILURES=$((FAILURES + 1))
  fi
done

if [[ ${FAILURES} -gt 0 ]]; then
  echo "Validation failed for ${FAILURES} spec(s)."
  exit 1
fi

echo "All specs validated successfully."
