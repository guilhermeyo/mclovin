#!/bin/bash

source utils.sh

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
)

eecho "System utilities - Starting installation..."
install_packages "${packages[@]}"
echo "System utilities - Installation completed!"
