#!/bin/bash

echo "Virtualbox - Starting installation..."
# Install VirtualBox and necessary modules
yay -S virtualbox virtualbox-host-modules-arch --noconfirm

# Install VirtualBox extensions (optional but recommended)
echo "Virtualbox - Installing extensions..."
yay -S virtualbox-ext-oracle --noconfirm

# Add user to vboxusers group
echo "Virtualbox - Adding current user to vboxusers group..."
sudo usermod -aG vboxusers $(whoami)

# Load VirtualBox module
echo "Virtualbox - Loading module..."
sudo modprobe vboxdrv

echo "Virtualbox - Installation completed!"
