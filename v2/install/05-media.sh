#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

source "$SCRIPT_DIR/utils.sh"

packages=(
  vlc
  flameshot
  gimp
)

echo "Media packages - Starting installation..."
install_packages "${packages[@]}"
echo "Media packages - Installation completed!"
