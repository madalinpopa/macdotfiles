#!/bin/bash

# --- Setup ---
# Get the root directory of the dotfiles repository.
readonly ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly LIB_PATH="${ROOT_PATH}/lib"
source "${LIB_PATH}/utils.sh"

# --- Sudo Password Prompt ---
print_header "Checking for sudo access..."
echo "This script may require sudo access for some installation steps."
sudo -v

# Keep-alive sudo session
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# --- Installation Steps ---
print_header "Starting Dotfiles Installation"

# Step 1: Bootstrap (Install Homebrew)
if [ -f "${LIB_PATH}/bootstrap.sh" ]; then
    bash "${LIB_PATH}/bootstrap.sh"
fi

# Step 2: Install applications using Brewfile
if [ -f "${LIB_PATH}/brew.sh" ]; then
    bash "${LIB_PATH}/brew.sh"
fi

# Step 3: Create symbolic links
if [ -f "${LIB_PATH}/link.sh" ]; then
    bash "${LIB_PATH}/link.sh"
fi

# Step 4: Run post-installation scripts
if [ -f "${LIB_PATH}/post_install.sh" ]; then
    bash "${LIB_PATH}/post_install.sh"
fi

if [ -f "${LIB_PATH}/post_install_tmux.sh" ]; then
    bash "${LIB_PATH}/post_install_tmux.sh"
fi

if [ -f "${LIB_PATH}/post_install_rust.sh" ]; then
    bash "${LIB_PATH}/post_install_rust.sh"
fi

if [ -f "${LIB_PATH}/post_install_npm.sh" ]; then
    bash "${LIB_PATH}/post_install_npm.sh"
fi

print_header "Installation Complete!"
echo "Please restart your terminal for all changes to take effect."
