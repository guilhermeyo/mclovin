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
  eza
)

echo "Development tools - Starting installation..."
install_packages "${packages[@]}"

# Install tmux powers
if [ -d ~/.tmux/plugins/tpm ]; then
  echo "TPM is already installed - skipping..."
else
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "TPM installation completed!"
fi

if [ -d ~/.tmuxifier ]; then
  echo "Tmuxifier is already installed - skipping..."
else
  echo "Installing Tmuxifier..."
  git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
  echo "Tmuxifier installation completed!"
fi

echo "Development tools - Installation completed!"
