---
name: json-schema-specs
description: Create or update JSON Schema files used by API specs in this repository. Use when defining request/response schemas, shared Types in specs/common or specs/<domain>/common, or API-private schemas in specs/<domain>/<api>/v<version>/schemas.
---

# JSON Schema Specs

## Overview

Create and maintain JSON Schema files (draft 2020-12) that back OpenAPI components, following the repo’s shared vs domain vs API-private type rules.

## Workflow

1. Determine scope: global shared (`specs/common/`), domain shared (`specs/<domain>/common/`), or API-private (`specs/<domain>/<api>/v<version>/schemas/`).
2. Create or update schema JSON with `$schema` and `$id` fields.
3. Use relative `$ref` paths from the consuming schema or OpenAPI file.
4. Keep schema names and filenames stable; version shared types with `_v01` suffix.
5. Ensure private types are only referenced within their API folder.
6. If a private type is needed elsewhere, move it to shared and update `$ref` paths.

## Required Conventions

- **Draft**: Use JSON Schema `draft/2020-12`.
- **Filename**: Prefer lowercase with hyphens; shared types use `_v01` suffix (e.g., `resource-id_v01.json`).
- **$schema/$id**: Always set both.
- **Objects**: Use `additionalProperties: false` unless there is a strong reason not to.
- **Arrays**: Define `items` explicitly.
- **Enums**: Prefer shared types for reusable enums.
- **ASCII**: Keep files ASCII unless existing content already uses Unicode.

## Placement Rules

- **Global shared**: `specs/common/` for Types used across domains.
- **Domain shared**: `specs/<domain>/common/` for Types used by multiple APIs in a domain.
- **API-private**: `specs/<domain>/<api>/v<version>/schemas/` or `schemas/types/` for types used only by that API.

## Checklist Before Finalizing

- `$schema` and `$id` are present.
- `$ref` paths resolve correctly from the consuming file.
- Shared types are versioned and in the correct common folder.
- Private types are not referenced outside their API folder.

[TODO: 1-2 sentences explaining what this skill enables]

## Structuring This Skill

[TODO: Choose the structure that best fits this skill's purpose. Common patterns:

**1. Workflow-Based** (best for sequential processes)
- Works well when there are clear step-by-step procedures
- Example: DOCX skill with "Workflow Decision Tree" -> "Reading" -> "Creating" -> "Editing"
- Structure: ## Overview -> ## Workflow Decision Tree -> ## Step 1 -> ## Step 2...

**2. Task-Based** (best for tool collections)
- Works well when the skill offers different operations/capabilities
- Example: PDF skill with "Quick Start" -> "Merge PDFs" -> "Split PDFs" -> "Extract Text"
- Structure: ## Overview -> ## Quick Start -> ## Task Category 1 -> ## Task Category 2...

**3. Reference/Guidelines** (best for standards or specifications)
- Works well for brand guidelines, coding standards, or requirements
- Example: Brand styling with "Brand Guidelines" -> "Colors" -> "Typography" -> "Features"
- Structure: ## Overview -> ## Guidelines -> ## Specifications -> ## Usage...

**4. Capabilities-Based** (best for integrated systems)
- Works well when the skill provides multiple interrelated features
- Example: Product Management with "Core Capabilities" -> numbered capability list
- Structure: ## Overview -> ## Core Capabilities -> ### 1. Feature -> ### 2. Feature...

Patterns can be mixed and matched as needed. Most skills combine patterns (e.g., start with task-based, add workflow for complex operations).

Delete this entire "Structuring This Skill" section when done - it's just guidance.]

## [TODO: Replace with the first main section based on chosen structure]

[TODO: Add content here. See examples in existing skills:
- Code samples for technical skills
- Decision trees for complex workflows
- Concrete examples with realistic user requests
- References to scripts/templates/references as needed]

## Resources (optional)

Create only the resource directories this skill actually needs. Delete this section if no resources are required.

### scripts/
Executable code (Python/Bash/etc.) that can be run directly to perform specific operations.

**Examples from other skills:**
- PDF skill: `fill_fillable_fields.py`, `extract_form_field_info.py` - utilities for PDF manipulation
- DOCX skill: `document.py`, `utilities.py` - Python modules for document processing

**Appropriate for:** Python scripts, shell scripts, or any executable code that performs automation, data processing, or specific operations.

**Note:** Scripts may be executed without loading into context, but can still be read by Codex for patching or environment adjustments.

### references/
Documentation and reference material intended to be loaded into context to inform Codex's process and thinking.

**Examples from other skills:**
- Product management: `communication.md`, `context_building.md` - detailed workflow guides
- BigQuery: API reference documentation and query examples
- Finance: Schema documentation, company policies

**Appropriate for:** In-depth documentation, API references, database schemas, comprehensive guides, or any detailed information that Codex should reference while working.

### assets/
Files not intended to be loaded into context, but rather used within the output Codex produces.

**Examples from other skills:**
- Brand styling: PowerPoint template files (.pptx), logo files
- Frontend builder: HTML/React boilerplate project directories
- Typography: Font files (.ttf, .woff2)

**Appropriate for:** Templates, boilerplate code, document templates, images, icons, fonts, or any files meant to be copied or used in the final output.

---

**Not every skill requires all three types of resources.**
