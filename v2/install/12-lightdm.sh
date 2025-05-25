#!/bin/bash
echo "LightDM Litarvan 4K - Starting installation..."
# Install LightDM and Litarvan theme
sudo pacman -S --needed lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan --noconfirm
# Configure LightDM greeter
echo "LightDM Litarvan 4K - Configuring greeter..."
sudo sed -i 's/^#*greeter-session=.*/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf
# Configure Litarvan theme
echo "LightDM Litarvan 4K - Setting theme..."
echo "webkit_theme=litarvan" | sudo tee -a /etc/lightdm/lightdm-webkit2-greeter.conf >/dev/null
# Configure HiDPI for 4K
echo "LightDM Litarvan 4K - Configuring HiDPI..."
sudo sed -i '/^\[Seat:\*\]/a display-setup-script=xrandr --dpi 192' /etc/lightdm/lightdm.conf
echo "LightDM Litarvan 4K - Installation completed!"
