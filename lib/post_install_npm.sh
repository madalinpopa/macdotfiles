#!/bin/bash


# --- Source Utilities ---
source "$(dirname "$0")/utils.sh"

print_header "Step 6: Install npm global packages"

# --- Prerequisite Checks ---
if ! command_exists npm; then
  echo "  -> Error: npm is not installed. Skipping."
  exit 0
fi

echo "  -> Install neovim package"
npm install -g neovim &>/dev/null
