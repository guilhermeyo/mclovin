#!/bin/bash
echo "LightDM Litarvan 4K - Starting installation..."
# Install LightDM and Litarvan theme
sudo pacman -S --needed lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan --noconfirm

# Configure LightDM greeter
echo "LightDM Litarvan 4K - Configuring greeter..."
sudo sed -i 's/^#*greeter-session=.*/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf

# Configure Litarvan theme with HiDPI support
echo "LightDM Litarvan 4K - Setting theme and HiDPI..."
sudo tee /etc/lightdm/lightdm-webkit2-greeter.conf >/dev/null <<'EOF'
[greeter]
webkit_theme=litarvan

[webkit]
enable-accelerated-2d-canvas=true
enable-smooth-scrolling=true
enable-webgl=true
EOF

# Configure HiDPI in lightdm.conf
echo "LightDM Litarvan 4K - Configuring HiDPI..."
sudo sed -i '/^\[Seat:\*\]/a display-setup-script=xrandr --dpi 192' /etc/lightdm/lightdm.conf

# Enable LightDM service
echo "LightDM Litarvan 4K - Enabling service..."
sudo systemctl enable lightdm
echo "LightDM Litarvan 4K - Installation completed!"
echo "4K HiDPI support enabled (2x scaling)"
