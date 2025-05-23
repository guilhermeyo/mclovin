#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
DEFAULTS_DIR="$(pwd)/../default-dotfiles"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

# Check if stow is installed
if ! pacman -Qi stow &>/dev/null; then
  echo "[!] Please install 'stow' before continuing: sudo pacman -S stow"
  exit 1
fi

# Create dotfiles directory and copy defaults if needed
mkdir -p "$DOTFILES_DIR"
cp -rn "$DEFAULTS_DIR/"* "$DOTFILES_DIR/"
cd "$DOTFILES_DIR" || exit 1

# Function to handle existing conflicts
handle_conflicts() {
  local package=$1
  echo "[*] Checking for conflicts in: $package"

  # Use stow in dry-run + verbose mode to detect conflicts
  for target in $(stow -nv "$package" | grep -Po '(?<=\s)\~?/.+'); do
    resolved_path="${target/#\~/$HOME}"
    if [ -e "$resolved_path" ] || [ -L "$resolved_path" ]; then
      backup_path="${resolved_path}-from-${TIMESTAMP}"
      echo "[!] Conflict detected: $resolved_path already exists. Moving it to $backup_path"
      mv "$resolved_path" "$backup_path"
    fi
  done
}

# List of dotfiles packages
DOTFILES=(
  autostart bashrc fastfetch i3 inputrc kitty picom polybar
  rofi starship tmux lightdm
)

# Apply each dotfile package
for pkg in "${DOTFILES[@]}"; do
  handle_conflicts "$pkg"
  stow "$pkg"
done

echo "[✔] Dotfiles successfully applied using stow."
