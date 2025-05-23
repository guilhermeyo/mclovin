#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

source "$BASE_DIR/utils.sh"

packages=(
  vim
  yazi
  bat
  neovim
  starship
  tmux
  kitty
  git
  less
  mise
  bash-preexec
  atuin
  zoxide
  docker
)

echo "Development tools - Starting installation..."
install_packages "${packages[@]}"

# Install tmux powers
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier

echo "Development tools - Installation completed!"
