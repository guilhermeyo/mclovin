#!/bin/bash

source ../utils.sh

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
