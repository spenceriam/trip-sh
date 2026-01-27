# Versioning Standards

All projects that follow tucker-protocol use Semantic Versioning (SemVer) with the format `MAJOR.MINOR.PATCH`.

## Version Components

- **MAJOR** (X.0.0)
  - Breaking changes.
  - API incompatibilities.
  - Major rewrites or migrations that require consumer changes.

- **MINOR** (0.X.0)
  - New features.
  - Backward-compatible additions.
  - Significant improvements that do not break existing usage.

- **PATCH** (0.0.X)
  - Bug fixes.
  - Minor improvements.
  - Documentation-only updates.

## Initial Versions

### Greenfield projects

- Start at `v0.1.0`.
- Use `0.x.x` to indicate pre-release or active development.
- Increment to `1.0.0` when the project is stable and ready for production use.

### Brownfield projects

- Extrapolate from git history:
  - Analyze existing tags and their associated changes.
  - Review commit history for patterns of features and fixes.
- Establish a baseline version consistent with history, then continue using SemVer rules from there.

## Bump Guidelines

- Choose **MAJOR** when changes break existing consumers or contracts.
- Choose **MINOR** when adding functionality in a backward-compatible way.
- Choose **PATCH** when fixing defects or making minor tweaks that do not add new features.

For a reference implementation of version bump patterns, see the `eazyweather` repository and its release history.