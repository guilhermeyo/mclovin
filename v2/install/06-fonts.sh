#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

source "$BASE_DIR/utils.sh"

packages=(
  noto-fonts
  noto-fonts-emoji
  noto-fonts-cjk
  nerd-fonts-meslo
  nerd-fonts-jetbrains-mono
)

echo "Fonts - Starting installation..."
install_packages "${packages[@]}"
echo "Fonts - Installation completed!"
