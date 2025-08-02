#!/bin/bash

# --- Source Utilities ---
source "$(dirname "$0")/utils.sh"

print_header "Step 3: Symlinking Configuration Files"

# --- Symlink Logic ---
SOURCE_DIR="$(dirname "$0")/../home"
DEST_DIR="$HOME"
CONFIG_DEST_DIR="$HOME/.config"

mkdir -p "$CONFIG_DEST_DIR"

# Symlink top-level dotfiles (excluding .config)
find "$SOURCE_DIR" -maxdepth 1 -mindepth 1 -not -name ".config" | while read -r path; do
    create_symlink "$path" "$DEST_DIR/$(basename "$path")"
done

# Symlink contents of .config
CONFIG_SOURCE_DIR="$SOURCE_DIR/.config"
if [ -d "$CONFIG_SOURCE_DIR" ]; then
    find "$CONFIG_SOURCE_DIR" -maxdepth 1 -mindepth 1 | while read -r path; do
        create_symlink "$path" "$CONFIG_DEST_DIR/$(basename "$path")"
    done
fi

echo "  -> Symlinking complete."