#!/bin/bash

# --- Source Utilities ---
source "$(dirname "$0")/utils.sh"

print_header "Step 4: Running Post-Installation Tasks"

# --- Mise ---
if command_exists mise; then
  echo "  -> Running 'mise install'. This might take a moment..."
  mise install &>/dev/null
  echo "  -> 'mise install' complete."
else
  echo "  -> Skipping 'mise install' (command not found)."
fi

# --- Create Local User Files ---
echo "  -> Ensuring local user files exist..."
files_to_create=(".hushlogin" ".local_aliases" ".machine_specific" ".gitconfig_local")

for file in "${files_to_create[@]}"; do
    if [ ! -f "$HOME/$file" ]; then
        touch "$HOME/$file"
    fi
done