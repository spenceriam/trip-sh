#!/usr/bin/env bash
#
# trip - AI Coding Protocol Installer
# 
# Installs the trip protocol into the current project directory.
# Usage: curl -sSL https://raw.githubusercontent.com/spenceriam/trip-sh/main/install.sh | bash
#

set -euo pipefail

# ==============================================================================
# Configuration
# ==============================================================================

TRIP_VERSION="${TRIP_VERSION:-latest}"
TRIP_SOURCE="${TRIP_SOURCE:-https://github.com/spenceriam/trip-sh}"
TRIP_INSTALL_DIR="${TRIP_INSTALL_DIR:-.trip}"
NO_COLOR="${NO_COLOR:-}"

# Exit codes
EXIT_SUCCESS=0
EXIT_MISSING_DEPS=1
EXIT_NETWORK_ERROR=2
EXIT_FILESYSTEM_ERROR=3
EXIT_INVALID_VERSION=4

# ==============================================================================
# Output Helpers
# ==============================================================================

# Check if terminal supports colors
has_color() {
    if [[ -n "$NO_COLOR" ]]; then
        return 1
    fi
    if [[ -t 1 ]]; then
        return 0
    fi
    return 1
}

# Print success message
success() {
    if has_color; then
        printf "\033[32m%s\033[0m\n" "$1"
    else
        printf "%s\n" "$1"
    fi
}

# Print error message
error() {
    if has_color; then
        printf "\033[31mError: %s\033[0m\n" "$1" >&2
    else
        printf "Error: %s\n" "$1" >&2
    fi
}

# Print info message
info() {
    printf "%s\n" "$1"
}

# Print warning message
warn() {
    if has_color; then
        printf "\033[33mWarning: %s\033[0m\n" "$1" >&2
    else
        printf "Warning: %s\n" "$1" >&2
    fi
}

# ==============================================================================
# Platform Detection
# ==============================================================================

detect_platform() {
    local os
    os=$(uname -s 2>/dev/null || echo "Unknown")
    
    case "$os" in
        Linux*)     PLATFORM="linux" ;;
        Darwin*)    PLATFORM="macos" ;;
        CYGWIN*)    PLATFORM="windows" ;;
        MINGW*)     PLATFORM="windows" ;;
        MSYS*)      PLATFORM="windows" ;;
        *)          PLATFORM="unknown" ;;
    esac
    
    info "Detected platform: $PLATFORM"
}

# ==============================================================================
# Dependency Detection
# ==============================================================================

check_dependencies() {
    info "Checking dependencies..."
    
    if command -v curl >/dev/null 2>&1; then
        DOWNLOADER="curl"
        DOWNLOAD_CMD="curl_download"
    elif command -v wget >/dev/null 2>&1; then
        DOWNLOADER="wget"
        DOWNLOAD_CMD="wget_download"
    else
        error "Neither curl nor wget is installed. Please install one of them and try again."
        exit $EXIT_MISSING_DEPS
    fi
    
    info "Using $DOWNLOADER for downloads"
}

# ==============================================================================
# Download Functions
# ==============================================================================

# Download using curl
curl_download() {
    local url="$1"
    local output="$2"
    
    curl -fsSL --retry 3 --retry-delay 1 "$url" -o "$output" 2>/dev/null
}

# Download using wget
wget_download() {
    local url="$1"
    local output="$2"
    
    wget -q --tries=3 --timeout=10 "$url" -O "$output" 2>/dev/null
}

# Generic download function
download_file() {
    local url="$1"
    local output="$2"
    
    if ! $DOWNLOAD_CMD "$url" "$output"; then
        return 1
    fi
    
    # Verify file was created and is not empty
    if [[ ! -f "$output" ]] || [[ ! -s "$output" ]]; then
        return 1
    fi
    
    return 0
}

# ==============================================================================
# Directory Management
# ==============================================================================

create_directory_structure() {
    info "Creating directory structure..."
    
    # Remove existing installation if present
    if [[ -d "$TRIP_INSTALL_DIR" ]]; then
        warn "Existing installation found at $TRIP_INSTALL_DIR"
        info "Removing old installation..."
        rm -rf "$TRIP_INSTALL_DIR"
    fi
    
    # Create main directory
    if ! mkdir -p "$TRIP_INSTALL_DIR"; then
        error "Failed to create $TRIP_INSTALL_DIR directory"
        exit $EXIT_FILESYSTEM_ERROR
    fi
    
    # Create subdirectories
    local subdirs=(
        "workflows"
        "skills"
        "system-prompts"
        "mcps"
        "versioning"
        "integrations"
    )
    
    for dir in "${subdirs[@]}"; do
        if ! mkdir -p "$TRIP_INSTALL_DIR/$dir"; then
            error "Failed to create $TRIP_INSTALL_DIR/$dir"
            exit $EXIT_FILESYSTEM_ERROR
        fi
    done
    
    # Create skills subdirectories
    local skills=(
        "planner"
        "code-review"
        "debugger"
        "looper"
        "frontend-design"
    )
    
    for skill in "${skills[@]}"; do
        if ! mkdir -p "$TRIP_INSTALL_DIR/skills/$skill"; then
            error "Failed to create $TRIP_INSTALL_DIR/skills/$skill"
            exit $EXIT_FILESYSTEM_ERROR
        fi
    done
    
    success "Directory structure created"
}

# ==============================================================================
# File Deployment
# ==============================================================================

deploy_files() {
    info "Downloading trip protocol files..."
    
    # Construct base URL for raw GitHub content
    local base_url
    if [[ "$TRIP_SOURCE" == *"github.com"* ]]; then
        # Convert github.com URL to raw.githubusercontent.com
        base_url="${TRIP_SOURCE/github.com/raw.githubusercontent.com}"
        base_url="${base_url%.git}"
        
        if [[ "$TRIP_VERSION" == "latest" ]]; then
            base_url="$base_url/main"
        else
            base_url="$base_url/$TRIP_VERSION"
        fi
    else
        base_url="$TRIP_SOURCE"
    fi
    
    base_url="$base_url/.tucker"
    
    # Define all files to download
    declare -a files=(
        "README.md"
        "LICENSE"
        "PRINCIPLES.md"
        "AGENTS.md"
        "workflows/greenfield.md"
        "workflows/brownfield.md"
        "workflows/bugfix.md"
        "system-prompts/agents-md-instructions.md"
        "system-prompts/readme-structure.md"
        "system-prompts/commit-message-style.md"
        "system-prompts/version-bump-rules.md"
        "skills/planner/SKILL.md"
        "skills/code-review/SKILL.md"
        "skills/code-review/PERSONA-junior.md"
        "skills/code-review/PERSONA-senior.md"
        "skills/debugger/SKILL.md"
        "skills/looper/SKILL.md"
        "skills/frontend-design/SKILL.md"
        "mcps/defaults.md"
        "mcps/by-project-type.md"
        "versioning/VERSIONING.md"
        "integrations/proj-spec.md"
    )
    
    local failed=0
    local downloaded=0
    
    for file in "${files[@]}"; do
        local url="$base_url/$file"
        local output="$TRIP_INSTALL_DIR/$file"
        
        # Ensure parent directory exists
        local parent_dir
        parent_dir=$(dirname "$output")
        mkdir -p "$parent_dir"
        
        if download_file "$url" "$output"; then
            downloaded=$((downloaded + 1))
        else
            error "Failed to download: $file"
            failed=$((failed + 1))
        fi
    done
    
    if [[ $failed -gt 0 ]]; then
        error "Failed to download $failed files"
        exit $EXIT_NETWORK_ERROR
    fi
    
    success "Downloaded $downloaded files successfully"
}

# ==============================================================================
# Version File
# ==============================================================================

write_version_file() {
    info "Writing version information..."
    
    local version
    if [[ "$TRIP_VERSION" == "latest" ]]; then
        # Try to get version from remote VERSION file
        local temp_version
        temp_version=$(mktemp)
        local base_url
        base_url="${TRIP_SOURCE/github.com/raw.githubusercontent.com}"
        base_url="${base_url%.git}/main"
        
        if download_file "$base_url/VERSION" "$temp_version" 2>/dev/null; then
            version=$(cat "$temp_version")
        else
            version="unknown"
        fi
        rm -f "$temp_version"
    else
        version="$TRIP_VERSION"
    fi
    
    local timestamp
    timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ" 2>/dev/null || date +"%Y-%m-%dT%H:%M:%SZ")
    
    cat > "$TRIP_INSTALL_DIR/VERSION" << EOF
version=$version
installedAt=$timestamp
source=$TRIP_SOURCE
EOF
    
    success "Version information saved"
}

# ==============================================================================
# Main
# ==============================================================================

show_help() {
    cat << 'EOF'
trip Installer

Usage:
  curl -sSL https://raw.githubusercontent.com/spenceriam/trip-sh/main/install.sh | bash

Environment Variables:
  TRIP_VERSION       Specific version to install (default: latest)
  TRIP_SOURCE        Source repository URL (default: https://github.com/spenceriam/trip-sh)
  TRIP_INSTALL_DIR   Installation directory (default: .trip)
  NO_COLOR           Set to any value to disable colored output

Exit Codes:
  0  Success
  1  Missing dependencies (curl or wget required)
  2  Network error (download failed)
  3  Filesystem error (cannot write)
  4  Invalid version specified

Examples:
  # Standard installation
  curl -sSL https://raw.githubusercontent.com/spenceriam/trip-sh/main/install.sh | bash

  # Install specific version
  curl -sSL ... | TRIP_VERSION=1.0.0 bash

  # Install to custom directory
  curl -sSL ... | TRIP_INSTALL_DIR=.config/trip bash
EOF
}

main() {
    # Show help if requested
    if [[ "${1:-}" == "--help" ]] || [[ "${1:-}" == "-h" ]]; then
        show_help
        exit $EXIT_SUCCESS
    fi
    
    info ""
    info "=== trip Installer ==="
    info ""
    
    # Detect platform
    detect_platform
    
    # Check dependencies
    check_dependencies
    
    # Create directory structure
    create_directory_structure
    
    # Download and deploy files
    deploy_files
    
    # Write version file
    write_version_file
    
    # Success message
    info ""
    success "trip installed successfully!"
    info ""
    info "Location: $TRIP_INSTALL_DIR/"
    info ""
    info "AI agents will now detect trip when reviewing this codebase."
    info "They may ask if they should load and follow trip protocols."
    info ""
    info "You can:"
    info "  - Commit $TRIP_INSTALL_DIR/ to your repo to share trip with collaborators"
    info "  - Add $TRIP_INSTALL_DIR/ to .gitignore if you prefer per-user installation"
    info "  - Re-run this installer anytime to update to the latest version"
    info ""
    
    exit $EXIT_SUCCESS
}

# Run main function
main "$@"
