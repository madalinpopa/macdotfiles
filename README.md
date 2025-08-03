# My macOS Dotfiles

These are my personal dotfiles for macOS. They configure my shell, editor, and other tools to my liking.

## Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
    ```

2.  **Run the installation script:**

    ```bash
    cd ~/.dotfiles && ./install.sh
    ```

    The `install.sh` script will:

    *   Install [Homebrew](https://brew.sh/) if it's not already installed.
    *   Install all the applications and tools listed in the `Brewfile`.
    *   Create symbolic links for all the configuration files in the `home` directory.
    *   Run post-installation scripts.

## What's included?

*   **Shell:** [Zsh](https://www.zsh.org/) with a custom prompt, aliases, and completions.
*   **Editor:** [Neovim](https://neovim.io/) with a selection of plugins for a better development experience.
*   **Terminal:** [Ghostty](https://github.com/ghostty/ghostty) with a custom configuration.
*   **Multiplexer:** [Tmux](https://github.com/tmux/tmux/wiki) with a custom configuration and a sessionizer script.
*   **Other tools:** A variety of command-line tools to improve my workflow.

## `Brewfile`

This file contains a list of all the applications and tools that I use, managed by [Homebrew](httpss://brew.sh/). This includes:

*   **Development Tools:** `git`, `lazygit`, `tmux`, `gcc`, `rustup`, `mise`, `gemini-cli`
*   **Applications:** `1password`, `1password-cli`,`google-chrome`, `jetbrains-toolbox`, `ghostty`, `neovim`
*   **Shell:** `zsh-autosuggestions`, `direnv`, `fd`, `jq`
*   **Tools:** `fzf`, `ripgrep`, `sk`, `gh`, `wget`
*   **Fonts:** `font-jetbrains-mono-nerd-font`, `font-caskaydia-mono-nerd-font`, `font-mononoki-nerd-font`

## Scripts

*   `bin/tmux-sessionizer.sh`: A script to easily create and manage tmux sessions.
*   `install.sh`: The main installation script.
*   `lib/*`: A collection of scripts used by the `install.sh` script.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
