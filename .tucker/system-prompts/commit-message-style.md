# Commit Message Style

This document defines how commit messages should be written in projects that follow trip.

## Rules

- Use brief, readable sentences for commit subjects.
- Write subjects in present tense:
  - Preferred: "Add user authentication with JWT tokens".
  - Avoid: "Added user authentication with JWT tokens".
- Keep the subject line at or under 72 characters.
- Do not use emojis.
- Conventional commit prefixes (such as `feat:` or `fix:`) are allowed but not required.
- Use the body to explain complex changes when necessary:
  - Why the change was made.
  - Alternatives considered.
  - Any follow-up work.

## Examples

- Good: `Add user authentication with JWT tokens`
- Acceptable: `feat: add user authentication with JWT tokens`
- Bad: `feat: auth`
- Bad: `Added stuff`

Commit messages should make it easy for future readers to understand what changed and why, without needing to inspect diffs for every commit.