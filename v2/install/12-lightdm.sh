#!/bin/bash
echo "LightDM Litarvan 4K - Starting installation..."
# Install LightDM and Litarvan theme
sudo pacman -S --needed lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan --noconfirm

# Configure LightDM greeter
echo "LightDM Litarvan 4K - Configuring greeter..."
sudo sed -i 's/^#*greeter-session=.*/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf

# Configure Litarvan theme with HiDPI
echo "LightDM Litarvan 4K - Setting theme and HiDPI..."
sudo tee /etc/lightdm/lightdm-webkit2-greeter.conf >/dev/null <<'EOF'
webkit_theme=litarvan
enable-hidpi=on
scaling-factor=2
EOF

echo "LightDM Litarvan 4K - Installation completed!"
