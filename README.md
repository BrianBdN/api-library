# API Documentation Library

Design-first API documentation repository using OpenAPI 3.1 (JSON) and JSON Schema.

## Goals

- Define API contracts before implementation.
- Keep reusable Types centralized.
- Provide consistent URI, pagination, filtering, and response conventions.

## Repository Layout

```
specs/
  common/                    # Global shared Types
  <domain>/
    common/                  # Domain shared Types
    <api>/
      v<version>/
        openapi.json         # OpenAPI 3.1 spec (JSON)
        schemas/             # API-private schemas
        schemas/types/       # API-private types
        examples/            # Externalized examples
skills/                      # Agent skills for spec work
```

## Getting Started

- Use the template spec at `specs/core/api-template/v1/openapi.json`.
- Copy that folder to a new API location under `specs/<domain>/<api>/v<version>/`.
- Update paths, schemas, and examples for your API.

## URI Standards

- Collection: `/<domain>/v<version>/<collection-resource>`
- Instance: `/<domain>/v<version>/<collection-resource>/{resource-id}`

## OData Query Conventions (Collection Endpoints)

Use the latest OData parameters on list endpoints:

- `$top`
- `$skip`
- `$skiptoken`
- `$orderby`
- `$filter`
- `$count`

## OData List Response Shape

List responses use:

- `value` (array of resources)
- `@odata.context` (optional)
- `@odata.nextLink` (optional)
- `@odata.count` (optional)

## Schema and Type Rules

- Global shared Types go in `specs/common/`.
- Domain shared Types go in `specs/<domain>/common/`.
- API-private schemas live in `specs/<domain>/<api>/v<version>/schemas/`.
- API-private types must not be referenced outside their API folder.
- If another API needs a private type, move it into a shared common folder and update `$ref`s.

## Examples

All examples are externalized into `examples/` and referenced from OpenAPI using `externalValue`.

## Skills

This repo includes skills for agentic work:

- `skills/openapi-specs` for OpenAPI creation and updates.
- `skills/json-schema-specs` for JSON Schema creation and updates.
- `skills/redocly-openapi-validate` for Redocly validation.
