# AGENTS.md Instructions

`AGENTS.md` is the project brain. It captures durable knowledge about a project that AI coding agents and human contributors should reference over time.

## Purpose

- Provide a single, up-to-date overview of the project.
- Record decisions, gotchas, and landmines that are easy to forget.
- Help new agents and developers ramp up quickly and work safely.

## Location

- Always place `AGENTS.md` at the project root.
- Other documents (such as `Requirements.md`, `Design.md`, and `Tasks.md`) may live at the root or in `/docs`, but `AGENTS.md` should always be at the root.

## Required Contents

`AGENTS.md` should contain at least the following sections:

1. **Project Overview**
   - What the project does.
   - The problem it solves.
   - Who uses it.

2. **Current State**
   - Whether the project is in active development, maintenance, or another state.
   - Any major in-progress efforts or deprecations.

3. **Tech Stack and Versions**
   - Languages and frameworks.
   - Key libraries and tools.
   - Notable version constraints.

4. **Project Conventions**
   - Naming conventions.
   - File and directory structure patterns.
   - Architectural patterns or idioms that should be followed.

5. **Known Gotchas and Landmines**
   - Common pitfalls.
   - Areas of fragile code.
   - Historical issues that are likely to recur.

6. **Decision Log**
   - Key architectural or product decisions.
   - The rationale behind each decision.
   - Links to relevant pull requests, issues, or documents when available.

7. **How to Run and Test Locally**
   - Setup steps.
   - Required environment variables or configuration.
   - Commands to run the app and tests.

8. **Deployment Notes**
   - How and where the project is deployed.
   - Deployment process or automation.
   - Environment-specific considerations (staging, production, etc.).

## Maintenance Guidelines

- Treat `AGENTS.md` as a living document:
  - Update it whenever major architecture, tooling, or deployment changes occur.
  - Add new gotchas as they are discovered.
  - Record significant decisions as part of feature work.
- When an AI agent completes substantial work, it should consider whether any new knowledge belongs in `AGENTS.md` and propose updates.

By keeping `AGENTS.md` current and complete, each new coding session—human or AI—starts with a strong shared context.