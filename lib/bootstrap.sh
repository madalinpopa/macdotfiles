#!/bin/bash

# --- Source Utilities ---
source "$(dirname "$0")/utils.sh"

print_header "Step 1: Bootstrapping System (Homebrew)"

# --- OS Check ---
if [ "$(get_os)" != "macos" ]; then
  echo "  -> Skipping Homebrew installation on non-macOS system."
  exit 0
fi

# --- Check for Homebrew ---
if command_exists brew; then
    echo "  -> Homebrew is already installed. Updating..."
    brew update &>/dev/null
else
    echo "  -> Homebrew not found. Starting installation..."
    export NONINTERACTIVE=1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /tmp/brew_install.log 2>&1

    echo "  -> Adding Homebrew to your shell environment..."
    if [[ "$(uname -m)" == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi

    echo "  -> Verifying Homebrew installation..."
    brew doctor > /tmp/brew_doctor.log 2>&1
fi

echo "  -> Bootstrap complete."