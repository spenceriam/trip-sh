# trip

A deployment system for the trip AI coding protocol. Install trip into any project with a single command.

## What this is

trip is a meta-framework that standardizes how AI coding agents work on software projects. It defines workflows, skills, principles, and expectations that any AI agent should follow when contributing to code.

This repository contains:
- The `install.sh` script - deploy trip to any project with one command
- The `.tucker/` directory - the complete trip protocol that gets installed

## Why it exists

AI coding agents can generate code quickly but are prone to drift, inconsistent quality, and unsafe practices when left unconstrained. trip provides:

- **Standardized workflows** for greenfield, brownfield, and bugfix work
- **Reusable skills** for planning, debugging, code review, and persistence
- **Non-negotiable principles** (no emojis, never git push without permission, etc.)
- **System prompts** for commits, versioning, and documentation

When a project has a `.trip/` directory, AI agents detect it and can follow the protocol automatically.

## Quick Start

### Install trip into your project

```bash
cd your-project
curl -sSL https://raw.githubusercontent.com/spenceriam/trip-sh/main/install.sh | bash
```

This creates a `.trip/` directory with all protocol files.

### What AI agents see

When an AI reviews your codebase and sees `.trip/`, it will:

1. Read `.trip/AGENTS.md` for instructions
2. Ask you: "Should I load and follow trip protocols?"
3. If confirmed, apply workflows, skills, and principles throughout the session

### Update trip

Re-run the installer anytime to get the latest version:

```bash
curl -sSL https://raw.githubusercontent.com/spenceriam/trip-sh/main/install.sh | bash
```

## Repository Structure

```
trip-sh/
├── install.sh          # The installer script (curlable)
├── VERSION             # Current version (1.0.0)
├── README.md           # This file
├── .gitignore          # Excludes planning docs
└── .tucker/            # Protocol files that get installed
    ├── AGENTS.md       # AI "read first" instructions
    ├── README.md       # Trip overview
    ├── PRINCIPLES.md   # Absolute rules
    ├── workflows/      # greenfield, brownfield, bugfix
    ├── skills/         # planner, code-review, debugger, looper, frontend-design
    ├── system-prompts/ # commit style, versioning, AGENTS.md instructions
    ├── mcps/           # MCP recommendations
    ├── versioning/     # SemVer standards
    └── integrations/   # External tool guides
```

## Installation Options

### Standard installation

```bash
curl -sSL https://raw.githubusercontent.com/spenceriam/trip-sh/main/install.sh | bash
```

### Install specific version

```bash
curl -sSL https://raw.githubusercontent.com/spenceriam/trip-sh/main/install.sh | TRIP_VERSION=1.0.0 bash
```

### Install to custom directory

```bash
curl -sSL https://raw.githubusercontent.com/spenceriam/trip-sh/main/install.sh | TRIP_INSTALL_DIR=.config/trip bash
```

### Install from local source (for development)

```bash
cd your-project
TRIP_SOURCE=/path/to/trip-sh bash /path/to/trip-sh/install.sh
```

## After Installation

Once `.trip/` exists in your project:

**Option 1: Commit to repo**
```bash
git add .trip/
git commit -m "Add trip AI coding protocol"
```
This shares trip with all collaborators.

**Option 2: Add to .gitignore**
```bash
echo ".trip/" >> .gitignore
```
This keeps trip per-user, each developer installs it themselves.

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `TRIP_VERSION` | Version to install | `latest` |
| `TRIP_SOURCE` | Source repository | `https://github.com/spenceriam/trip-sh` |
| `TRIP_INSTALL_DIR` | Install directory | `.trip` |
| `NO_COLOR` | Disable colors | unset |

## Core Principles

trip enforces these non-negotiable rules:

1. **No emojis** anywhere in output
2. **Never git push** without explicit permission
3. **Final approval required** before starting implementation
4. **Commit after each discrete task**
5. **Branch-based workflow** (never commit to main)
6. **Double code review** (junior + senior personas)

See `.tucker/PRINCIPLES.md` for full details.

## Workflows

- **Greenfield** - New projects without existing code
- **Brownfield** - Existing projects with code already present
- **Bugfix** - Targeted fixes for specific issues

## Skills

- **planner** - Greenfield project planning with Requirements.md, Design.md, Tasks.md
- **code-review** - Two-pass review (junior + senior personas)
- **debugger** - Systematic debugging methodology
- **looper** - Persistence for iterative development
- **frontend-design** - Production-grade UI design standards

## License

MIT License - see `.tucker/LICENSE`

## Version

Current version: 1.0.0

See [VERSION](./VERSION) file.
