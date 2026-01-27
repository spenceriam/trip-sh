# Bugfix Workflow

This workflow applies to targeted bug fixes in either greenfield or brownfield projects. It focuses on safe, minimal changes with clear understanding and verification.

## 1. Triage

- Understand the bug report or failure:
  - Reproduce the issue locally if possible.
  - Capture steps to reproduce, expected behavior, and actual behavior.
- If the bug cannot be reproduced immediately, document what you tried and ask for more information.

## 2. Branch

- Create a dedicated fix branch from the appropriate base (usually `main` or the active release branch).
- Do not work directly on `main`.

Example:
- `bugfix/<short-description>`

## 3. Investigation

- Use the debugger skill (`skills/debugger/SKILL.md`) to investigate systematically:
  - Narrow down the failing area using logs, tests, or breakpoints.
  - Form hypotheses about the root cause.
  - Test each hypothesis with targeted experiments.
- Document findings as you go, especially if behavior is surprising or non-obvious.

## 4. Fix

- Implement the minimal change that resolves the root cause.
- Prefer small, well-scoped changes over broad refactors unless the bug clearly results from deeper architectural issues.
- Update or add tests to cover the bug scenario.
- Prepare a commit for the fix with a clear, sentence-style message.

## 5. Regression Test

- Run the relevant test suite or regression checks:
  - Automated tests (unit, integration, end-to-end) as applicable.
  - Manual checks for critical paths, if necessary.
- Confirm that:
  - The original bug is resolved.
  - No obvious regressions are introduced in related areas.

## 6. Review Phase

- Perform a double review using the code-review skill:
  - **Junior pass** – Look for syntax issues, style problems, missing checks, and obvious logic errors.
  - **Senior pass** – Evaluate edge cases, performance implications, security concerns, and maintainability.
- Address all review findings before considering the fix complete.

## 7. Delivery

- Summarize:
  - What caused the bug.
  - How the fix resolves it.
  - What tests were run.
  - Any remaining risks or follow-up items.
- Present the branch and await explicit permission before pushing or opening a pull request.

This workflow ensures that even small fixes follow a disciplined process with clear understanding, minimal changes, and strong validation.