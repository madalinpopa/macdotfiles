# GEMINI.md: Your AI Assistant's Guide to these Dotfiles

This document provides an overview of this dotfiles repository, designed to be understood by an AI assistant. It outlines the project's structure, purpose, and key components, enabling the AI to effectively assist with tasks related to this configuration.

## Project Overview

This repository contains a comprehensive set of personal dotfiles for macOS. The primary goal of this project is to create a consistent and efficient development environment by managing the configuration of various tools and applications. The setup is highly automated, using a series of shell scripts to handle installation, symlinking, and post-install tasks.

The core technologies and tools used in this project include:

*   **Shell:** Zsh, configured with a modular structure, custom aliases, functions, and a `Pure` prompt.
*   **Editor:** Neovim, with a minimal and clean configuration that leverages Lua for customization.
*   **Terminal:** Ghostty, a modern, GPU-accelerated terminal emulator.
*   **Multiplexer:** Tmux, with a customized status bar and keybindings for efficient session management.
*   **Package Manager:** Homebrew, used to install and manage all applications and command-line tools.
*   **Scripting:** The entire setup is orchestrated by a series of well-structured shell scripts.

## Installation and Usage

The primary entry point for setting up the dotfiles is the `install.sh` script. This script automates the entire process, which includes:

1.  **Bootstrapping:** The `lib/bootstrap.sh` script ensures that Homebrew is installed on the system.
2.  **Brewing:** The `lib/brew.sh` script installs all the applications and tools listed in the `Brewfile`.
3.  **Linking:** The `lib/link.sh` script creates symbolic links from the files in the `home` directory to their corresponding locations in the user's home directory.
4.  **Post-Installation:** The `lib/post_install.sh` script runs any necessary post-installation tasks, such as setting up `mise` and creating local user files.

To install the dotfiles, run the following command:

```bash
./install.sh
```

## Key Components

This dotfiles repository is organized into several key components:

*   **`Brewfile`:** This file contains a list of all the applications and tools that are installed via Homebrew. This includes development tools, applications, shell utilities, and fonts.
*   **`install.sh`:** This is the main installation script that orchestrates the entire setup process.
*   **`lib/`:** This directory contains a collection of shell scripts that are used by the `install.sh` script to perform specific tasks.
*   **`home/`:** This directory contains all the configuration files that are symlinked to the user's home directory. This includes configurations for Zsh, Neovim, Tmux, and other tools.
*   **`bin/`:** This directory contains executable scripts, such as the `tmux-sessionizer.sh` script.

## Development Conventions

The development conventions in this project are centered around a clean, modular, and well-documented approach.

*   **Shell Scripting:** The shell scripts are well-structured and use a consistent style. They are organized into a `lib/` directory, with each script responsible for a specific part of the installation process. The scripts also include helpful output messages to inform the user of the progress.
*   **Zsh Configuration:** The Zsh configuration is modular, with different aspects of the configuration separated into individual files in the `home/.config/zsh/` directory. This makes it easy to manage and customize the shell setup.
*   **Neovim Configuration:** The Neovim configuration is written in Lua and is kept minimal and clean. It is organized into a `config/` directory, with different aspects of the configuration separated into individual files.
*   **Tmux Configuration:** The Tmux configuration is well-documented and includes a custom theme and keybindings for efficient session management.

By understanding the structure and conventions of this dotfiles repository, an AI assistant can provide more effective and context-aware assistance with tasks such as adding new tools, modifying configurations, and troubleshooting issues.
