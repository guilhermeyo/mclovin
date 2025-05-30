#!/bin/bash

echo "LightDM Litarvan - Starting installation..."

# Install LightDM and Litarvan theme
sudo pacman -S --needed lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan --noconfirm

# Configure LightDM greeter
echo "LightDM Litarvan - Configuring greeter..."
sudo sed -i 's/^#*greeter-session=.*/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf

# Configure Litarvan theme
echo "LightDM Litarvan - Setting theme..."
sudo sed -i 's/^#*webkit_theme\s*=\s*antergos/webkit_theme=litarvan/' /etc/lightdm/lightdm-webkit2-greeter.conf

# Disable GDM service
sudo systemctl disable gdm.service

# Enable LightDM service
sudo systemctl enable lightdm.service

echo "LightDM Litarvan - Installation completed!"
