# Brownfield Workflow

This workflow applies to existing projects where code already exists. The goal is to understand the current state, identify any drift from documentation, and implement changes safely using tucker-protocol.

## 1. Assess Documentation State

Before changing code:

- Look for `README.md` at the project root only.
- Look for `AGENTS.md` at the project root only.
- For specification documents, search in this order:
  - `Requirements.md`: root first, then `/docs`.
  - `Design.md`: root first, then `/docs`.
  - `Tasks.md`: root first, then `/docs`.
- If a spec document exists in both root and `/docs`, prefer the root version.
- Do not move existing documents; work with them where they are.

Then determine whether specification documents exist.

## 2. Path Selection

Choose one of two paths based on whether specification documents are present.

### Path A: Specification Documents Exist

At least one of `Requirements.md`, `Design.md`, or `Tasks.md` exists.

1. **Read Phase**  
   - Read all existing specification documents to understand the intended design and behavior.
   - Pay attention to requirements, architecture decisions, and defined tasks.

2. **Audit Phase**  
   - Analyze the current codebase to see how closely it matches the documented specification.
   - Identify where implementation has drifted from the docs, where docs are outdated, and where features exist without documentation.

3. **Drift Assessment**  
   - Produce a concise list of discrepancies between docs and implementation:
     - Features implemented but undocumented.
     - Documented features not yet implemented.
     - Architectural differences between `Design.md` and actual code.

4. **Version Extrapolation**  
   - Determine the current project version from git history:
     - Inspect existing tags and release patterns.
     - Infer whether the project is using SemVer and what the current version is.
   - Use `versioning/VERSIONING.md` as the standard for future changes.

5. **Approval Gate**  
   - Present findings and a proposed approach:
     - What drift exists.
     - Which documents need updates.
     - What code changes are planned.
   - Wait for explicit approval from the developer before making changes.

6. **Implementation**  
   - Work on a dedicated branch, not on `main`.
   - Implement agreed changes in small, discrete steps.
   - For each discrete task (feature, fix, or documentation update), prepare a corresponding commit.

7. **Review Phase**  
   - Run the code-review skill:
     - Junior persona first, focusing on surface-level issues.
     - Senior persona second, focusing on architecture, edge cases, security, and maintainability.
   - Address all issues raised before considering the work complete.

8. **Delivery**  
   - Present updated code and documentation, along with a summary of drift resolved and remaining gaps if any.
   - Await explicit permission before pushing.

### Path B: No Specification Documents

None of `Requirements.md`, `Design.md`, or `Tasks.md` exist.

1. **Audit Phase**  
   - Analyze the existing codebase to understand:
     - High-level purpose and core features.
     - Key modules, services, and data models.
     - Existing tests and their coverage.

2. **AGENTS.md Check**  
   - If `AGENTS.md` is missing or clearly outdated, create or update it following `system-prompts/agents-md-instructions.md`.
   - Capture:
     - Project overview and purpose.
     - Current development state (active, maintenance, experimental).
     - Tech stack and major dependencies.
     - Known gotchas and landmines.
     - How to run and test the project.

3. **Version Extrapolation**  
   - Infer the current version from git history and tags.
   - If no clear versioning exists, define a baseline consistent with `versioning/VERSIONING.md`.

4. **Context Gathering**  
   - Ask clarifying questions about:
     - Desired future direction for the project.
     - Pain points or areas needing refactor.
     - Any implicit conventions not captured in code.
   - Continue until you have enough understanding to propose changes confidently.

5. **Approval Gate**  
   - Present your understanding of the project and the planned changes.
   - Confirm priorities (bug fixes, refactors, new features).
   - Wait for explicit approval before modifying code.

6. **Implementation**  
   - Work on branches, not on `main`.
   - Implement changes in discrete units, each mapped to a clear goal (for example, "Improve error handling in X" or "Refactor Y to reduce duplication").

7. **Review Phase**  
   - Perform a two-pass review using the junior and senior personas.

8. **Delivery**  
   - Present a summary of changes, including any newly discovered risks or follow-up work.
   - Await explicit permission before pushing to any remote.

## Notes

For brownfield projects, the priority is to respect the existing codebase and minimize disruption while gradually aligning it with clear documentation and tucker-protocol practices. Where possible, introduce or improve documentation as part of the work so future AI coding sessions start from a stronger baseline.