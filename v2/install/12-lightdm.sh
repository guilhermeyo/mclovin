#!/bin/bash

echo "LightDM Litarvan - Starting installation..."

# Install LightDM and Litarvan theme
sudo pacman -S --needed lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan --noconfirm

# Configure LightDM greeter
echo "LightDM Litarvan - Configuring greeter..."
sudo sed -i 's/^#*greeter-session=.*/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf

# Configure Litarvan theme
echo "LightDM Litarvan - Setting theme..."
echo "webkit_theme=litarvan" | sudo tee -a /etc/lightdm/lightdm-webkit2-greeter.conf >/dev/null

# Enable LightDM service
echo "LightDM Litarvan - Installation completed!"
