#!/bin/bash

source ../utils.sh

packages=(
  gnome-disk-utility
)

echo "System maintenance tools - Starting installation..."
install_packages "${packages[@]}"
echo "System maintenance tools - Installation completed!"
