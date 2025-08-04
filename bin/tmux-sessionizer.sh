#!/usr/bin/env bash

# --- SETTINGS ---
PROJECT_DIRS=("$HOME/projects" "$HOME") 
FZF_CMD="sk --margin 10% --color='bw'"

# --- SELECT PROJECT ---
if [[ $# -eq 1 ]]; then
    selected="$1"
else
    # Search in multiple folders for first-level directories
    selected=$(find "${PROJECT_DIRS[@]}" -mindepth 1 -maxdepth 1 -type d 2>/dev/null \
        | sed "s|^$HOME/||" \
        | eval $FZF_CMD)
    # Add home path back
    [[ -n "$selected" ]] && selected="$HOME/$selected"
fi

# --- EXIT IF NOTHING SELECTED ---
[[ -z "$selected" ]] && exit 0

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# --- START TMUX IF NEEDED ---
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s "$selected_name" -c "$selected"
    exit 0
fi

# --- CREATE SESSION IF MISSING ---
if ! tmux has-session -t="$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi

# --- SWITCH OR ATTACH ---
if [[ -z $TMUX ]]; then
    tmux attach -t "$selected_name"
else
    tmux switch-client -t "$selected_name"
fi

# --- NOTIFY (OPTIONAL) ---
if command -v notify-send &>/dev/null; then
    notify-send "Tmux" "Switched to session: $selected_name"
elif [[ "$OSTYPE" == "darwin"* ]] && command -v osascript &>/dev/null; then
    osascript -e "display notification \"Switched to session: $selected_name\" with title \"Tmux\""
fi
