#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

source "$SCRIPT_DIR/utils.sh"

packages=(
  gnome-disk-utility
)

echo "System maintenance tools - Starting installation..."
install_packages "${packages[@]}"
echo "System maintenance tools - Installation completed!"
