# ----------------------------------------------------------------------
# Author: Madalin Popa
# Email: coderustle@madalinpopa.com
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# Zsh functions directory setup
# This sets up the fpath to include custom Zsh functions.
# ----------------------------------------------------------------------
ZSH_FUNC_DIR="${ZDOTDIR:-$HOME}/.zsh_functions"
if [[ -d "$ZSH_FUNC_DIR" ]]; then
   fpath+=("$HOME/.zfunc" "$ZSH_FUNC_DIR")
else
   mkdir -p "$ZSH_FUNC_DIR"
   fpath+=("$HOME/.zfunc" "$ZSH_FUNC_DIR")
fi

# ----------------------------------------------------------------------
# Homebrew configuration
# Add Homebrew binaries to the PATH, depending on the installation path.
# ----------------------------------------------------------------------
if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ----------------------------------------------------------------------
# Cargo configuration
# Load Cargo (Rust's package manager) environment if available.
# ----------------------------------------------------------------------
CARGO_ENV="$HOME/.cargo/env"
[[ -f "$CARGO_ENV" ]] && source "$CARGO_ENV"

# ----------------------------------------------------------------------
# Direnv configuration
# Load Direnv for managing project-specific environment variables.
# ----------------------------------------------------------------------
# ensure compatibility tmux <-> direnv
# if [[ -n "$TMUX" ]] && [[ -n "$DIRENV_DIR" ]]; then
#     # zsh syntax for unsetting matching variables
#     unset ${(M)parameters:#DIRENV_*}
# fi
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# ----------------------------------------------------------------------
# FZF configuration
# ----------------------------------------------------------------------
if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
fi

# ----------------------------------------------------------------------
# ZSH auto-suggestions
# ----------------------------------------------------------------------
if command -v brew &> /dev/null; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ----------------------------------------------------------------------
# ZSH auto-suggestions
# ----------------------------------------------------------------------
if [ -f /etc/os-release ]; then
  . /etc/os-release
  if [ "$ID" = "arch" ]; then
    # Arch Linux specific config
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  fi
fi

# ----------------------------------------------------------------------
# mise
# ----------------------------------------------------------------------
if command -v mise &> /dev/null; then
    eval "$(mise activate zsh)"
fi
