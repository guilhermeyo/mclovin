#!/bin/bash

set -e

# Download and add the GPG key for mise
wget -qO - https://mise.jdx.dev/gpg-key.pub | sudo gpg --dearmor -o /etc/pacman.d/gnupg/mise-archive-keyring.gpg

# Ensure the pacman.conf.d directory exists
sudo mkdir -p /etc/pacman.conf.d

# Add mise repository to pacman's configuration
echo -e "[mise]\nSigLevel = Required DatabaseOptional\nServer = https://mise.jdx.dev/pacman/\$arch" | sudo tee /etc/pacman.conf.d/mise.conf >/dev/null

# Update pacman package database
sudo pacman -Sy

# Install mise
sudo pacman -Sy --noconfirm mise

# Verify the installation
if command -v mise &>/dev/null; then
  echo "mise was installed successfully."
else
  echo "Failed to install mise."
fi
