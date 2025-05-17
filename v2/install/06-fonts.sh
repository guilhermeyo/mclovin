#!/bin/bash

source utils.sh

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
