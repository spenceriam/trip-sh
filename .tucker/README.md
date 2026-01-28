# trip

## What this is

trip is a meta-framework that standardizes how AI coding agents work on agentic coding projects. It defines the processes, workflows, skills, and expectations that any agentic coding harness must follow when contributing to code, regardless of which LLM or toolchain is in use.

## Why it exists

AI coding agents can generate code quickly but are prone to drift, inconsistent quality, and unsafe practices when left unconstrained. trip exists to provide a clear, enforceable set of rules and workflows so that agents work predictably, respect project constraints, maintain quality, and protect production systems.

## Who it is for

trip is for developers and teams using AI coding agents such as Claude Code, Gemini CLI, Goose, Verdent, or other agentic harnesses. Any agent working on projects with a `.trip/` directory should load and follow this protocol at the start of a coding session.

## Quick Start

1. Reference this repository in your AI agent's context at the beginning of a session.
2. In your project, create a `.trip/` directory.
3. Copy the relevant files from this repository into your project's `.trip/` directory, for example:
   - Workflows from `workflows/` (for greenfield, brownfield, or bugfix work)
   - Skills from `skills/` (planner, code-review, debugger, looper, frontend-design)
   - System prompts from `system-prompts/` (AGENTS.md instructions, README structure, commit style, version bump rules)
   - Versioning standards from `versioning/VERSIONING.md`
   - MCP recommendations from `mcps/`
   - Integrations from `integrations/` (such as `proj-spec.md`)
4. The agent should treat `.trip/` as the source of truth for how to work in that project:
   - Follow workflows appropriate to the situation (greenfield, brownfield, bugfix).
   - Apply skills as needed (planning, debugging, code review, persistence, frontend design).
   - Adhere to commit message style, versioning rules, and documentation expectations.
5. Keep `.trip/` in sync with updates to this repository as the protocol evolves.

## Repository structure

```text
trip/
├── README.md
├── LICENSE
├── PRINCIPLES.md
├── workflows/
│   ├── greenfield.md
│   ├── brownfield.md
│   └── bugfix.md
├── system-prompts/
│   ├── agents-md-instructions.md
│   ├── readme-structure.md
│   ├── commit-message-style.md
│   └── version-bump-rules.md
├── skills/
│   ├── planner/
│   │   └── SKILL.md
│   ├── code-review/
│   │   ├── SKILL.md
│   │   ├── PERSONA-junior.md
│   │   └── PERSONA-senior.md
│   ├── debugger/
│   │   └── SKILL.md
│   ├── looper/
│   │   └── SKILL.md
│   └── frontend-design/
│       └── SKILL.md
├── mcps/
│   ├── defaults.md
│   └── by-project-type.md
├── versioning/
│   └── VERSIONING.md
└── integrations/
    └── proj-spec.md
```

- `README.md` – Overview of the protocol and how to use it.
- `LICENSE` – MIT license for this repository.
- `PRINCIPLES.md` – Core principles and non-negotiable rules for AI coding agents.
- `workflows/` – Actionable workflows for greenfield projects, brownfield projects, and bug fixes.
- `system-prompts/` – System prompt fragments and structural guides for AGENTS.md, README.md, commit messages, and version bumping.
- `skills/` – Reusable SKILL definitions (planner, code-review, debugger, looper, frontend-design) including personas where applicable.
- `mcps/` – Default and project-type-specific MCP recommendations.
- `versioning/` – Versioning standards and SemVer guidance.
- `integrations/` – Integration notes for external tools such as proj-spec.

When used in a concrete project, these files are typically copied into that project's `.trip/` directory and referenced by the agent.

## Contributing

Contributions that improve clarity, safety, or practicality of trip are welcome. Changes should:
- Preserve the absolute principles in `PRINCIPLES.md`.
- Maintain compatibility with multiple agentic harnesses (Claude Code, Gemini CLI, Goose, Verdent, and others).
- Keep documentation concise, precise, and free of marketing language.

Please open an issue or pull request with a clear description of the problem being solved and how your change aligns with the existing principles and workflows.

## License

This repository is licensed under the MIT License. See `LICENSE` for details.

## Contact

For questions or feedback, contact Spencer at https://x.com/spencer_i_am
