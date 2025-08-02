
# Source configuration files
ZSH_CONFIG="$HOME/.config/zsh"

for file in "$ZSH_CONFIG"/*; do
    source $file
done

# Load machine specific configuration
if [ -f "$HOME/.machine_specific" ]; then
    source "$HOME/.machine_specific"
fi

# Local aliasses
if [ -f "$HOME/.local_aliases" ]; then
    . "$HOME/.local_aliases"
fi

# Start the tmux session if not alraedy in the tmux session
if [[ ! -n $TMUX  ]]; then
  # Get the session IDs
  session_ids="$(tmux list-sessions)"

  # Create new session if no sessions exist
  if [[ -z "$session_ids" ]]; then
    tmux new-session
  fi

  # Select from following choices
  #   - Attach existing session
  #   - Create new session
  #   - Start without tmux
  create_new_session="Create new session"
  start_without_tmux="Start without tmux"
  choices="$session_ids\n${create_new_session}:\n${start_without_tmux}:"
  choice="$(echo $choices | fzf | cut -d: -f1)"

  if expr "$choice" : "[0-9]*$" >&/dev/null; then
    # Attach existing session
    tmux attach-session -t "$choice"
  elif [[ "$choice" = "${create_new_session}" ]]; then
    # Create new session
    tmux new-session
  elif [[ "$choice" = "${start_without_tmux}" ]]; then
    # Start without tmux
    :
  fi
fi
