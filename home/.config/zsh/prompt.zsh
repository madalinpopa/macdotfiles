# Technicolor dreams
# force_color_prompt=yes
# color_prompt=yes
#
# Place this in your ~/.zshrc

# autoload -U colors && colors
# setopt PROMPT_SUBST
#
# Function to show git branch if in repo
# git_prompt() {
#   local branchG
#   if command git rev-parse --is-inside-work-tree &>/dev/null; then
#     branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
#     echo "%{$fg_bold[green]%}±$branch%{$reset_color%}"
#   fi
# }

# Show ✘ and exit code if last cmd failed
# exit_code_prompt() {
#   [[ $? -ne 0 ]] && echo "%{$fg_bold[red]%}✘$?%{$reset_color%} "
# }

# Compose the prompt
# PROMPT='$(exit_code_prompt)%{$fg_bold[cyan]%}%~%{$reset_color%} $(git_prompt) %# '
