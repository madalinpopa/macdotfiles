#!/bin/bash

# Function to print a formatted header.
# Usage: print_header "My Header"
print_header() {
  echo ""
  echo "--------------------------------------------------"
  echo "  $1"
  echo "--------------------------------------------------"
}

# Function to get the operating system.
get_os() {
  case "$(uname -s)" in
    Darwin)
      echo "macos"
      ;;
    Linux)
      if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
          ubuntu|fedora|arch)
            echo "$ID"
            ;;
          *)
            echo "unsupported"
            ;;
        esac
      else
        echo "unsupported"
      fi
      ;;
    *)
      echo "unsupported"
      ;;
  esac
}

# Function to create a symbolic link safely.
create_symlink() {
  local source_path="$1"
  local destination_path="$2"

  if [[ -z "$source_path" || -z "$destination_path" ]]; then
    echo "  -> Error: Both source and destination are required for create_symlink." >&2
    return 1
  fi

  # If the link is already correct, do nothing.
  if [[ -L "$destination_path" && "$(readlink "$destination_path")" == "$source_path" ]]; then
    return 0
  fi

  # If the destination exists as something else, remove it.
  if [[ -e "$destination_path" || -L "$destination_path" ]]; then
    echo "  -> Removing existing '$destination_path'"
    rm -rf "$destination_path"
  fi

  # Create the parent directory and the link.
  mkdir -p "$(dirname "$destination_path")"
  ln -s "$source_path" "$destination_path"
  echo "  -> Linked '$destination_path' -> '$source_path'"
}

# Function to check if a command exists.
command_exists() {
  command -v "$1" &>/dev/null
}
