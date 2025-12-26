# Agentic Instructions (GitHub Copilot)

## Repository Guidelines

### Project Structure & Module Organization
- `specs/` holds all API specifications and schemas.
  - `specs/common/` contains global shared Types.
  - `specs/<domain>/common/` contains domain-shared Types.
  - `specs/<domain>/<api>/v<version>/openapi.json` is the OpenAPI 3.1 spec.
  - `specs/<domain>/<api>/v<version>/schemas/` holds API-private schemas.
  - `specs/<domain>/<api>/v<version>/examples/` holds externalized examples.
- `skills/` contains agent skills (OpenAPI, JSON Schema, Redocly validation).
- `README.md` summarizes conventions and onboarding.

### Build, Test, and Development Commands
- No build or test scripts are defined yet.
- Optional validation (if installed): `redocly lint specs/<domain>/<api>/v<version>/openapi.json`.
- Optional batch validation: `skills/redocly-openapi-validate/scripts/validate_all.sh`.

### Coding Style & Naming Conventions
- JSON only for specs and schemas (OpenAPI 3.1).
- Use ASCII where possible.
- Shared Types use `_v01` suffix (e.g., `resource-id_v01.json`).
- URIs must follow `/<domain>/v<version>/collection-resource` and
  `/<domain>/v<version>/collection-resource/{resource-id}`.
- OData list parameters: `$top`, `$skip`, `$skiptoken`, `$orderby`, `$filter`, `$count`.
- Examples must be externalized and referenced via `externalValue`.

### Testing Guidelines
- No automated test framework is configured yet.
- Validate specs with Redocly CLI when changing `openapi.json` files.

### Commit & Pull Request Guidelines
- Use Conventional Commits (e.g., `feat: add webhook examples`, `fix: correct $ref paths`).
- PRs should include a short summary, relevant spec paths, and validation notes if run.

### Agent-Specific Instructions
- Keep private schemas within their API folder; move to `specs/common/` or
  `specs/<domain>/common/` when cross-API reuse is needed.
- Update `$ref` paths when moving schemas.
