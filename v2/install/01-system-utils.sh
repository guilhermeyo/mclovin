#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

source "$SCRIPT_DIR/utils.sh"

packages=(
  htop
  btop
  1password
  lazygit
  lazydocker
  stow
  neofetch
  nerdfetch
  fzf
  zip
  unzip
  wget
  curl
  i3
  feh
  flameshot
  brave-bin
  alsa-utils
)

echo "System utilities - Starting installation..."
install_packages "${packages[@]}"
echo "System utilities - Installation completed!"
