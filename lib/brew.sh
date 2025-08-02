#!/bin/bash

# --- Source Utilities ---
source "$(dirname "$0")/utils.sh"

print_header "Step 2: Installing Apps via Homebrew Bundle"

# --- Prerequisite Checks ---
if [ "$(get_os)" != "macos" ]; then
  echo "  -> Skipping, not on macOS."
  exit 0
fi

if ! command_exists brew; then
  echo "  -> Error: Homebrew (brew) command not found. Skipping bundle."
  exit 0
fi

# --- Bundle Brewfile ---
echo "  -> Installing apps from Brewfile. This may take a while..."

if brew bundle install --file="$(dirname "$0")/../Brewfile"; then
  echo "  -> Brew bundle completed successfully."
else
  echo "  -> Warning: 'brew bundle' encountered an error. Check /tmp/brew_bundle.log for details."
fi
