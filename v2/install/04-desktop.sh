#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

source "$BASE_DIR/utils.sh"

packages=(
  gnome
  gnome-tweaks
  i3
  picom
  polybar
  rofi
  lightdm
  lightdm-slick-greeter
)

echo "Desktop environment - Starting installation..."
install_packages "${packages[@]}"
echo "Desktop environment - Installation completed!"
