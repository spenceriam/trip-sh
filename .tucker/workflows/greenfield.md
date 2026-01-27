# Greenfield Workflow

This workflow applies to new projects where implementation has not yet begun. It assumes work will be driven by standard specification documents and that AI coding agents will follow tucker-protocol throughout.

## 1. Assess Documentation State

Before any planning or coding:

- Look for `README.md` at the project root only.
- Look for `AGENTS.md` at the project root only.
- For specification documents, search in this order:
  - `Requirements.md`: root first, then `/docs`.
  - `Design.md`: root first, then `/docs`.
  - `Tasks.md`: root first, then `/docs`.
- If a spec document exists in both the root and `/docs`, prefer the root version.
- Do not move existing documents; work with them where they are.

For each spec document (`Requirements.md`, `Design.md`, `Tasks.md`), assess:
- **Missing** – File does not exist.
- **Incomplete** – File exists but required sections are missing or contain placeholder content.
- **Complete** – File exists and all required sections are filled with real, project-specific content.

Summarize the assessment before proceeding.

## 2. Path Selection

Choose one of three paths based on the assessment.

### Path A: All Documents Complete

All three spec documents (`Requirements.md`, `Design.md`, `Tasks.md`) are present and complete.

1. **Read Phase**  
   Read all spec documents thoroughly:
   - `Requirements.md` for scope and acceptance criteria.
   - `Design.md` for architecture, data models, and interfaces.
   - `Tasks.md` for B-MAD style implementation steps.

2. **Verification**  
   Summarize your understanding of:
   - The project goals.
   - The planned architecture.
   - The implementation phases and tasks.

   Present this summary to the developer and confirm that the documents reflect current intent.

3. **AGENTS.md**  
   - If `AGENTS.md` does not exist at the project root, create it following `system-prompts/agents-md-instructions.md`.
   - If it exists, verify that it is consistent with the current spec documents and update if needed.

4. **Version Initialization**  
   - Initialize the project at version `v0.1.0` following `versioning/VERSIONING.md`.

5. **Approval Gate**  
   - Present the planned approach and confirm that you are ready to implement according to `Tasks.md`.
   - Wait for explicit approval before writing or modifying code.

6. **Implementation**  
   - Implement tasks in the order defined in `Tasks.md`.
   - Work on a feature or worktree branch, not directly on `main`.
   - After each discrete task is complete, prepare a commit that reflects only that task.

7. **Review Phase**  
   - Run a two-pass review using the code-review skill:
     - First pass as the junior persona.
     - Second pass as the senior persona.
   - Address all issues raised in both passes.

8. **Delivery**  
   - Present the completed work, along with a summary of changes and any caveats.
   - Await explicit permission before pushing any branch to a remote.

### Path B: Some Documents Incomplete or Missing

At least one of `Requirements.md`, `Design.md`, or `Tasks.md` is missing or incomplete.

1. **Assessment Phase**  
   - Use the planner skill (`skills/planner/SKILL.md`) to analyze which required sections are missing from each document.
   - Produce a concise list of gaps per document.

2. **Focused Discovery**  
   - Ask targeted questions only for the missing information.
   - Avoid re-discovering information that is already specified.

3. **Augmentation and Generation**  
   - For incomplete documents, augment the existing content to fill gaps while preserving what is already there.
   - For missing documents, generate new ones using the planner templates for `Requirements.md`, `Design.md`, and `Tasks.md`.
   - Ensure the three documents are consistent with each other.

4. **AGENTS.md Creation**  
   - Create or update `AGENTS.md` at the project root per `system-prompts/agents-md-instructions.md`.

5. **Version Initialization**  
   - Initialize versioning at `v0.1.0` once the spec documents are complete.

6. **Approval Gate**  
   - Present the completed documentation set: `Requirements.md`, `Design.md`, `Tasks.md`, and `AGENTS.md`.
   - Summarize key decisions, assumptions, and open questions.
   - Wait for explicit developer approval before coding.

7. **Implementation**  
   - Implement according to `Tasks.md` using branches and discrete commits per task.

8. **Review Phase**  
   - Apply the code-review skill with junior and senior passes.

9. **Delivery**  
   - Present the implementation and documentation updates, then await push permission.

### Path C: No Documents Exist

None of `Requirements.md`, `Design.md`, or `Tasks.md` exist.

1. **Planning Phase**  
   - Use the planner skill for full discovery, or leverage the harness's built-in planning mode (for example, Claude Code plan mode, Gemini CLI planning, or an external planning tool).
   - Conduct comprehensive discovery to understand scope, audience, constraints, tech stack preferences, and success criteria.

2. **Document Generation**  
   - Generate `Requirements.md`, `Design.md`, and `Tasks.md` using the planner templates, in that order.
   - Ensure they are consistent and complete according to the templates.

3. **AGENTS.md Creation**  
   - Create `AGENTS.md` at the project root following `system-prompts/agents-md-instructions.md`.

4. **Version Initialization**  
   - Initialize project version at `v0.1.0`.

5. **Approval Gate**  
   - Present all four documents (`Requirements.md`, `Design.md`, `Tasks.md`, `AGENTS.md`).
   - Confirm that they match the developer's intent.
   - Wait for explicit approval before implementation.

6. **Implementation**  
   - Implement tasks as defined in `Tasks.md`, working on branches and keeping each commit aligned to a single task.

7. **Review Phase**  
   - Perform junior and senior persona reviews and address all feedback.

8. **Delivery**  
   - Present the completed work, note any deviations from the original plan, and await push permission.

## Document Placement

After generation or augmentation:

- If a `/docs` directory exists, spec documents may live there or at the root; do not move existing documents.
- Always place `AGENTS.md` at the project root.
- Always place `README.md` at the project root if you create or update it.

The greenfield workflow ensures that all substantial implementation starts from a clear, agreed specification and that AI agents proceed only after an explicit approval gate.