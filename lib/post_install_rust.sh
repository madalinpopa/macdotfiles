#!/bin/bash

# --- Source Utilities ---
source "$(dirname "$0")/utils.sh"

print_header "Step 6: Install rust"

# --- Prerequisite Checks ---
if ! command_exists rustup; then
  echo "  -> Error: rustup is not installed. Skipping."
  exit 0
fi

rustup install stable
