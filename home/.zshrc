
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

# Start tmux interactively, but only if not already in a tmux session.
if [[ -z "$TMUX" ]]; then

  # Get the list of existing tmux sessions into a 'sessions' array.
  # The ${(f)"..."} syntax splits the command output by line breaks.
  sessions=(${(f)"$(tmux list-sessions -F '#S' 2>/dev/null)"})

  # Create the list of choices for the user.
  choices=("${sessions[@]}" "Create new session" "Start without tmux")

  # Use 'skim' (sk) to present the choices and capture the user's selection.
  choice=$(printf "%s\n" "${choices[@]}" | sk --margin 10% --color='bw')

  # Check if the user's choice is an existing session name.
  if (( ${sessions[(Ie)$choice]} )); then
    # If the choice is an existing session, attach to it.
    tmux attach-session -t "$choice"
  elif [[ "$choice" == "Create new session" ]]; then
    # If the user chose to create a new session, do so.
    tmux new-session -s "$(echo $HOME)"
  fi
  # If the user selected "Start without tmux" or closed the prompt,
  # the script does nothing and the shell starts normally.
fi
