#!/bin/bash

# --- Source Utilities ---
source "$(dirname "$0")/utils.sh"

print_header "Step 5: Setting up Tmux Plugin Manager"

# --- Prerequisite Checks ---
if ! command_exists git; then
  echo "  -> Error: Git is not installed. Cannot clone TPM. Skipping."
  exit 0
fi

# --- Clone Tmux Plugin Manager (TPM) ---
CONFIG_DIR="$HOME/.config"
TPM_DIR="$CONFIG_DIR/tmux/plugins/tpm"

if [[ -d "$TPM_DIR" ]]; then
  echo "  -> Tmux Plugin Manager (TPM) is already installed."
else
  echo "  -> Cloning TPM into '$TPM_DIR'..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR" &>/dev/null
  echo "  -> TPM cloned successfully."
fi

# --- Copy scripts to ~/.config/scripts ---
SCRIPTS_DIR="$CONFIG_DIR/scripts"
mkdir -p "$SCRIPTS_DIR"

if [[ -f "$SCRIPTS_DIR/tmux-sessionizer.sh" ]]; then
  echo "  -> tmux-sessionizer.sh already exists. Skipping copy."
  exit 0
fi

create_symlink "$(dirname "$0")/../bin/tmux-sessionizer.sh" "$SCRIPTS_DIR/tmux-sessionizer.sh"
