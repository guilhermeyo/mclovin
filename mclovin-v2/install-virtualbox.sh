#!/bin/bash

# Install VirtualBox and necessary modules
yay -S virtualbox virtualbox-host-modules-arch --noconfirm

# If using custom kernel, install DKMS instead
if [[ $(uname -r) != *"arch"* ]]; then
  echo "Custom kernel detected, installing DKMS..."
  yay -S virtualbox-host-dkms --noconfirm
fi

# Install VirtualBox extensions (optional but recommended)
echo "Installing VirtualBox extensions..."
yay -S virtualbox-ext-oracle --noconfirm

# Add user to vboxusers group
echo "Adding current user to vboxusers group..."
sudo usermod -aG vboxusers $(whoami)

# Load VirtualBox module
echo "Loading VirtualBox module..."
sudo modprobe vboxdrv

echo "VirtualBox Installation complete!"
