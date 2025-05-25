#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

DOTFILES_DIR="$HOME/dotfiles"
DEFAULTS_DIR="$BASE_DIR/default-dotfiles"
BACKUP_DIR="$HOME/.config/mclovin-backup-$(date +%Y%m%d_%H%M%S)"

if ! pacman -Qi stow &>/dev/null; then
  echo "[!] Please install 'stow': sudo pacman -S stow"
  exit 1
fi

mkdir -p "$DOTFILES_DIR"
mkdir -p "$BACKUP_DIR"
cp -rn "$DEFAULTS_DIR/"* "$DOTFILES_DIR/"
cd "$DOTFILES_DIR"

backup_if_exists() {
  local path="$1"
  local name="$2"

  if [ -e "$path" ] || [ -L "$path" ]; then
    echo "[backup] $name"
    cp -r "$path" "$BACKUP_DIR/$name.backup"
    rm -rf "$path"
  fi
}

echo "Checking for existing configurations..."
backup_if_exists "$HOME/.Xresources" "Xresources"
backup_if_exists "$HOME/.config/autostart" "autostart"
backup_if_exists "$HOME/.bashrc" "bashrc"
backup_if_exists "$HOME/.config/fastfetch" "fastfetch"
backup_if_exists "$HOME/.config/i3" "i3"
backup_if_exists "$HOME/.inputrc" "inputrc"
backup_if_exists "$HOME/.config/kitty" "kitty"
backup_if_exists "$HOME/.config/picom" "picom"
backup_if_exists "$HOME/.config/polybar" "polybar"
backup_if_exists "$HOME/.config/rofi" "rofi"
backup_if_exists "$HOME/.config/starship.toml" "starship"
backup_if_exists "$HOME/.tmux.conf" "tmux"

configs=(
  "Xresources"
  "autostart"
  "bashrc"
  "fastfetch"
  "i3"
  "inputrc"
  "kitty"
  "picom"
  "polybar"
  "rofi"
  "starship"
  "tmux"
)

echo "Applying configurations..."
for config in "${configs[@]}"; do
  echo "[*] $config"
  stow "$config"
done

echo "[ok] Dotfiles applied!"
echo "[info] Backups saved in: $BACKUP_DIR"
