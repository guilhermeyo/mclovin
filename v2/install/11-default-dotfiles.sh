#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
DEFAULTS_DIR="$(pwd)/../default-dotfiles"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

# Check for stow
if ! command -v stow &>/dev/null; then
  echo "[!] Please install 'stow': sudo pacman -S stow"
  exit 1
fi

# Setup dotfiles directory
mkdir -p "$DOTFILES_DIR"
cp -rn "$DEFAULTS_DIR/"* "$DOTFILES_DIR/"
cd "$DOTFILES_DIR" || exit 1

# List of dotfile packages
PACKAGES=(
  autostart bashrc fastfetch i3 inputrc kitty picom polybar
  rofi starship tmux lightdm
)

# Function to rename conflicting targets
handle_conflicts() {
  local pkg=$1
  echo "[*] Checking and resolving conflicts for: $pkg"

  # Use stow dry-run to detect what paths it would touch
  stow -nv "$pkg" 2>/dev/null | grep '->' | awk '{print $3}' | while read -r target; do
    resolved="$HOME/$target"
    if [ -e "$resolved" ] || [ -L "$resolved" ]; then
      new_name="${resolved}-old-${TIMESTAMP}"
      echo "[!] Renaming conflict: $resolved → $new_name"
      mv "$resolved" "$new_name"
    fi
  done
}

# Process each package
for pkg in "${PACKAGES[@]}"; do
  handle_conflicts "$pkg"
  stow "$pkg"
done

echo "[✔] Dotfiles applied. Conflicts renamed with '-old-$TIMESTAMP'."
