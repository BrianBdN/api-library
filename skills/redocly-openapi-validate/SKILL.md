---
name: redocly-openapi-validate
description: Validate OpenAPI 3.1 JSON specs using the Redocly CLI. Use when checking specs/<domain>/<api>/v<version>/openapi.json for errors, resolving $ref paths, or confirming linting rules before sharing or publishing.
compatibility: Requires the redocly CLI installed and available on PATH.
---

# Redocly OpenAPI Validate

## Overview

Run Redocly CLI validation on OpenAPI 3.1 JSON specs in this repository and interpret results to guide fixes.

## Installation Note

Install Redocly CLI if it is not already available on PATH:

```
npm install -g @redocly/cli
```

Or run via npx without a global install:

```
npx @redocly/cli lint <path-to-openapi.json>
```

## Workflow

1. Identify the target spec file under `specs/<domain>/<api>/v<version>/openapi.json`.
2. Run Redocly validation:

```
redocly lint <path-to-openapi.json>
```

3. If errors reference missing files or invalid `$ref`s, resolve paths relative to the spec file.
4. If schema errors are reported, open the referenced JSON schema and fix structure or constraints.
5. Re-run `redocly lint` until clean or the remaining issues are understood and documented.

## Helper Script

Validate all specs in this repo:

```
scripts/validate_all.sh
```

Validate a single spec:

```
scripts/validate_spec.sh <path-to-openapi.json>
```

## Common Issues and Fixes

- **Unresolved $ref**: Verify relative path from `openapi.json` or schema file, and ensure filename matches exactly.
- **Schema draft mismatch**: Ensure JSON Schemas use `$schema` draft 2020-12 and are valid JSON.
- **Examples format**: Use `externalValue` for external examples and ensure paths exist.
- **OData query params**: Confirm list endpoints use `$top`, `$skip`, `$skiptoken`, `$orderby`, `$filter`, `$count`.
