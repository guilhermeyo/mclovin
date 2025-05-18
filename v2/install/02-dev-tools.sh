#!/bin/bash

source utils.sh

packages=(
  vim
  yazi
  bat
  neovim
  starship
  tmux
  ghostty
  git
  less
  mise
  bash-preexec
  docker
)

echo "Development tools - Starting installation..."
install_packages "${packages[@]}"
echo "Development tools - Installation completed!"
