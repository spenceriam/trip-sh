# Core Principles

This document defines the non-negotiable principles that govern how AI coding agents must behave when working on Spencer's projects. These principles apply regardless of the agent, model, or harness being used.

## Absolute Principles

### 1. No emojis

**Rule**: Never use emojis anywhere. This includes documentation, commits, pull requests, comments, AGENTS.md, generated files, and any other project artifacts.

**Why it matters**:
- Keeps the tone professional across all repositories.
- Avoids ambiguity in technical communication.
- Ensures consistency between human- and AI-authored content.

**Violations to avoid**:
- Using emojis in commit messages.
- Adding emojis to README badges or section headings.
- Including emojis in inline comments or AGENTS.md notes.

---

### 2. Never git push without explicit permission

**Rule**: An AI agent must never run `git push` (or any equivalent remote update) without explicit, one-time permission from the developer for that specific action.

**Why it matters**:
- Protects production and shared branches from accidental or premature changes.
- Ensures a human remains in control of what reaches remote repositories.
- Reduces risk when experimenting, refactoring, or performing large batch edits.

**Violations to avoid**:
- Pushing a feature branch to origin without the developer asking for it.
- Pushing directly to `main` or a protected branch.
- Running commands that implicitly push (such as certain CI/CD or deployment helpers) without prior approval.

---

### 3. Final approval before starting implementation

**Rule**: Before writing or modifying code, the agent must:
1. Ask clarifying questions as needed.
2. Present its understanding of the task, plan, or specification.
3. Obtain explicit developer approval to proceed.

**Why it matters**:
- Prevents the agent from implementing misunderstood or incomplete requirements.
- Protects against wasted effort due to misaligned assumptions.
- Encourages a deliberate planning phase, whether via pre-existing documents or inline planning.

**Violations to avoid**:
- Beginning major refactors without first summarizing the intended changes.
- Generating new features based only on vague one-line prompts.
- Interpreting ambiguous instructions without seeking clarification.

---

### 4. Commit after each discrete task

**Rule**: The agent should make a git commit after completing each discrete task or fix, using brief, readable sentences as commit subjects.

**Commit message guidelines** (see `system-prompts/commit-message-style.md` for full details):
- Use present tense: "Add feature" not "Added feature".
- Keep the subject line under 72 characters.
- Use sentences rather than fragments where possible.
- No emojis.

**Why it matters**:
- Produces a clean, navigable history where each commit corresponds to a meaningful unit of work.
- Simplifies reviewing, reverting, and auditing changes.
- Encourages small, well-scoped changes instead of large, tangled commits.

**Violations to avoid**:
- Large, multi-feature commits such as "Implement everything".
- Vague messages like "fix stuff" or "changes".
- Bundling unrelated fixes and features into a single commit.

Note: If higher-priority constraints (for example, a specific harness environment) restrict automatic commits, the agent should still structure work as if each discrete task would become its own commit and clearly signal these boundaries to the developer.

---

### 5. Branch-based workflow

**Rule**: All changes must be made on branches or worktrees, not directly on `main`.

**Why it matters**:
- Keeps `main` stable and predictable.
- Allows parallel workstreams without interference.
- Makes it easy to open pull requests and run reviews before merging.

**Violations to avoid**:
- Committing directly to `main` for features, refactors, or fixes.
- Rewriting `main` history without an explicit, approved migration plan.
- Using long-lived personal experimentation directly on `main`.

Recommended pattern:
- Create a feature or fix branch from the appropriate base.
- Implement and test work on that branch.
- Open a pull request and go through review.
- Merge only after approval and verification.

---

### 6. Double code review

**Rule**: Perform a two-pass code review before presenting work as complete:
1. Review as a junior developer persona.
2. Review as a senior developer persona.

See `skills/code-review/` for detailed persona definitions and process.

**Why it matters**:
- Junior reviewers are strong at catching surface-level issues: typos, style inconsistencies, obvious logic problems.
- Senior reviewers focus on architecture, maintainability, security, performance, and long-term impact.
- Combining both perspectives yields more robust, production-ready changes.

**Violations to avoid**:
- Skipping review entirely and presenting work as finished.
- Relying on a single, generic review pass.
- Ignoring issues identified by either persona without justification.

---

## Relationship to Project-Specific Rules

trip defines global behavior for AI coding agents across all projects. Individual repositories may add stricter or more specific rules (for example, additional security policies, framework-specific conventions, or deployment constraints).

When project-specific rules and trip both apply:
- Follow the stricter rule where there is overlap.
- Never violate these absolute principles.
- If there is an apparent conflict, pause, document the conflict, and ask the developer for guidance before proceeding.

These principles are designed to prevent AI drift, maintain quality, and protect production environments while still enabling fast, helpful development assistance.
