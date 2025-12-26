#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <path-to-openapi.json>"
  exit 2
fi

SPEC_PATH="$1"

if [[ ! -f "${SPEC_PATH}" ]]; then
  echo "Spec not found: ${SPEC_PATH}"
  exit 2
fi

if [[ "${SPEC_PATH}" != *.json ]]; then
  echo "Spec must be a .json file."
  exit 2
fi

if ! command -v redocly >/dev/null 2>&1; then
  echo "redocly CLI not found on PATH. Install it before running this script."
  exit 1
fi

redocly lint "${SPEC_PATH}"
