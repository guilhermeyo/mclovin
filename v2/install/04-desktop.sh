#!/bin/bash

source utils.sh

packages=(
  gnome
  gnome-tweaks
  i3
  picom
  polybar
  rofi
)

echo "Desktop environment - Starting installation..."
install_packages "${packages[@]}"
echo "Desktop environment - Installation completed!"
