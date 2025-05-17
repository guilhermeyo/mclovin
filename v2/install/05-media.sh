#!/bin/bash

source utils.sh

packages=(
  vlc
  flameshot
  gimp
)

echo "Media packages - Starting installation..."
install_packages "${packages[@]}"
echo "Media packages - Installation completed!"
