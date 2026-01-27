# Default MCPs

These Model Context Protocol (MCP) servers are recommended as defaults for most projects.

## Chrome DevTools MCP

- **Purpose**: Browser automation, debugging, and testing for web-based projects.
- **When to use**: Any project that involves a web frontend or browser-based behavior.

## Context7 MCP

- **Purpose**: Documentation lookup and context retrieval.
- **When to use**: When working with libraries or frameworks that have Context7 support, or when rich documentation lookup improves productivity.

## Configuration

MCPs are configured per project, typically via a configuration file such as `.mcp.json` or equivalent. Projects should declare which MCPs they rely on so that AI agents can initialize the correct context before implementation begins.