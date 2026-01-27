# proj-spec Integration

`tucker-protocol` and `proj-spec` are complementary frameworks that work together. tucker-protocol defines how AI agents should work. proj-spec helps define what should be built.

## What is proj-spec?

proj-spec is a tool that helps turn a rough project idea into a structured specification package for AI coding agents. It focuses on producing standard documents (such as requirements, design, tasks, project brain, and README) that downstream agents and developers can rely on.

## How tucker-protocol and proj-spec Integrate

- **proj-spec** defines what to build by generating a complete specification package.
- **tucker-protocol** defines how to build it via workflows, skills, and process standards.

Projects that originate from proj-spec should use tucker-protocol as the execution layer for implementation.

## Detecting and Assessing Documentation

Before starting any greenfield work, assess documentation state:

**Document locations:**

- `README.md`: root only.
- `AGENTS.md`: root only.
- `Requirements.md`: root first, then `/docs`.
- `Design.md`: root first, then `/docs`.
- `Tasks.md`: root first, then `/docs`.

If a spec document exists in both locations, prefer the root version and do not move files.

For each of `Requirements.md`, `Design.md`, and `Tasks.md`, assess:

- **Complete**: All required sections are present with real, project-specific content.
- **Incomplete**: The document exists but is missing sections or contains placeholder content.
- **Missing**: The document does not exist.

### Assessment Outcomes

- All three complete: verify understanding and proceed to the approval gate.
- Some incomplete: use the planner skill to augment gaps.
- Some missing: use the planner skill to generate missing documents.
- None exist: use the planner skill for full discovery and generation.

Note: `AGENTS.md` and `README.md` are generated after the three core documents are complete, according to `system-prompts/agents-md-instructions.md` and `system-prompts/readme-structure.md`.

## Scenario A: All Documents Complete

When `Requirements.md`, `Design.md`, and `Tasks.md` are all complete:

1. Read all documents to understand the full specification.
2. Verify with the developer that the documents reflect current intent.
3. Follow `Tasks.md` as the authoritative implementation plan.
4. Reference `Design.md` for architecture and implementation details.
5. Reference `Requirements.md` for scope and acceptance criteria.
6. Create or verify `AGENTS.md` per `system-prompts/agents-md-instructions.md`.
7. Apply tucker-protocol workflows, skills, and review processes.

## Scenario B: Documents Incomplete or Partially Missing

When some documents exist but have gaps:

1. Assess gaps using the planner skill.
2. Conduct focused discovery to gather only the missing information.
3. Augment incomplete documents using planner templates.
4. Generate any missing documents.
5. Create or update `AGENTS.md`.
6. Apply tucker-protocol workflows from the greenfield Path B.

## Scenario C: No Documents Exist

When no specification documents are present:

1. Use the planner skill for comprehensive requirements discovery.
2. Generate `Requirements.md`, `Design.md`, and `Tasks.md` using planner templates.
3. Create `AGENTS.md` and, if appropriate, `README.md` using system prompt instructions.
4. Apply the greenfield workflow for projects without prior documentation.

## Workflow Alignment

### Greenfield – Complete Docs

1. Read specification documents.
2. Verify understanding with the developer.
3. Create or validate `AGENTS.md`.
4. Pass the approval gate.
5. Implement per `Tasks.md`.
6. Run double code review.
7. Deliver changes and await push permission.

### Greenfield – Incomplete or Missing Docs

1. Assess documentation gaps.
2. Use planner skill to augment or generate docs.
3. Create or update `AGENTS.md`.
4. Pass the approval gate.
5. Implement per `Tasks.md`.
6. Run double code review.
7. Deliver.

### Brownfield – Spec Docs Exist

1. Read existing spec documents.
2. Audit the current codebase against documentation.
3. Identify drift and needed updates.
4. Pass the approval gate.
5. Implement changes.
6. Run double code review.
7. Deliver.

### Brownfield – No Spec Docs

1. Audit the existing codebase.
2. Create or update `AGENTS.md`.
3. Conduct discovery with the developer.
4. Pass the approval gate.
5. Implement changes.
6. Run double code review.
7. Deliver.

## Key Principles

- The planner skill is for greenfield projects only; brownfield work uses audit-based workflows.
- The planner skill generates standard specification documents so they remain usable regardless of how they were created.
- tucker-protocol governs process regardless of whether documents came from proj-spec, the planner skill, or manual authoring.