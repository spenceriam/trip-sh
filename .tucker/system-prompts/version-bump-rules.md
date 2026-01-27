# Version Bump Rules

Projects following tucker-protocol use Semantic Versioning (SemVer) for releases.

## SemVer Basics

A version has the form `MAJOR.MINOR.PATCH`:

- **MAJOR** (X.0.0): Breaking changes and API incompatibilities.
- **MINOR** (0.X.0): New features and backward-compatible improvements.
- **PATCH** (0.0.X): Bug fixes and minor improvements.

## Greenfield Projects

- Start at `v0.1.0`.
- Use `0.x.x` for pre-release and early development.
- Increment to `1.0.0` when the project is stable and ready for production.

## Brownfield Projects

- Extrapolate version from git history:
  - Analyze existing tags.
  - Review commit history for patterns of features and fixes.
- Establish a baseline version consistent with existing usage, then apply SemVer rules from there.

## Choosing the Bump

- **MAJOR**: Introduces breaking changes or incompatibilities for existing consumers.
- **MINOR**: Adds new, backward-compatible functionality or significant improvements.
- **PATCH**: Fixes bugs or makes small, backward-compatible adjustments.

Use `versioning/VERSIONING.md` for full versioning standards and examples.