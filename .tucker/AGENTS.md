# Trip AI Agent Instructions

## What Trip Is

Trip is an AI coding protocol that standardizes how agents work on software projects. Originally derived from the tucker-protocol, trip provides workflows, skills, system prompts, and non-negotiable principles that govern AI coding agent behavior.

## How to Use Trip

When you encounter a project with a `.trip/` directory, follow these steps:

1. **Read this document** (AGENTS.md) fully
2. **Read PRINCIPLES.md** - These are absolute rules you must never violate
3. **Identify the project type** - Greenfield, brownfield, or bugfix
4. **Load the appropriate workflow** from `workflows/` based on project type
5. **Apply skills as needed** from `skills/` (planner, debugger, code-review, etc.)
6. **Follow system prompts** in `system-prompts/` for commit style, versioning, etc.

## Before Starting Work

**You must ask the user**: "I see this project has trip protocols available in `.trip/`. Should I load and follow these protocols for our work?"

Do not assume trip should be used. Wait for explicit user confirmation.

Once confirmed:
1. State which workflow you will follow
2. Summarize your understanding of the task
3. Get approval before writing or modifying code

## Key Principles (Summary)

These are non-negotiable. Violations require immediate correction:

- **No emojis** anywhere in any output
- **Never git push** without explicit one-time permission
- **Final approval required** before starting implementation
- **Commit after each discrete task** with brief, readable messages
- **Branch-based workflow** - never commit directly to main
- **Double code review** - review as junior, then senior persona

## Directory Reference

- `PRINCIPLES.md` - Absolute rules for all work
- `workflows/` - Greenfield, brownfield, and bugfix workflows
- `skills/` - Reusable skills (planner, code-review, debugger, looper, frontend-design)
- `system-prompts/` - Guidelines for AGENTS.md, commits, versioning, README structure
- `mcps/` - MCP recommendations by project type
- `versioning/` - SemVer standards
- `integrations/` - Integration guides

## Version Information

Check `.trip/VERSION` to see which version of trip is installed in this project.

## Questions or Issues

If trip protocols conflict with user instructions:
1. Pause work
2. Document the conflict
3. Ask user for guidance before proceeding
4. Never violate principles without explicit approval
