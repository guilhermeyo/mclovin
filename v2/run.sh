#!/bin/bash

# Exit on any error
set -e

# Ensure gum is installed
if ! command -v gum &>/dev/null; then
  echo "gum not found. Installing gum..."
  sudo pacman -S gum --noconfirm --needed
fi

# Display Logo
./logo.sh

gum style --border normal --margin "1" --padding "1" --border-foreground 212 "Welcome to MCLOVIN - Your Arch Linux Setup Helper!"

# List all packages that will be installed (mandatory)
gum style --foreground 99 --bold "The following packages will be installed:"
gum style --foreground 45 "• yay"
gum style --foreground 45 "• System Utilities"
gum style --foreground 45 "• Development Tools"
gum style --foreground 45 "• Maintenance Tools"
gum style --foreground 45 "• Desktop Applications"
gum style --foreground 45 "• Media Applications"
gum style --foreground 45 "• Fonts"

echo
# Optional installations with gum choose
gum style --foreground 212 --bold --underline "Optional Installations"
gum style --foreground 255 "Select the components you want to install (all are selected by default):"
echo

OPTIONS=("Flatpak Apps" "VirtualBox" "Gnome Specific for TWM")
CHOICES=$(printf "%s\n" "${OPTIONS[@]}" | gum choose --height 15 --no-limit --selected="Flatpak Apps,VirtualBox,Gnome Specific for TWM")

# Update the system first
echo "Updating system..."
sudo pacman -Syu --noconfirm

# Install yay AUR helper if not present
./install/00-yay.sh

# Install all mandatory packages
. install/01-system-utils.sh
. install/02-dev-tools.sh
. install/03-maitenance.sh
. install/04-desktop.sh
. install/05-media.sh
. install/06-fonts.sh

# Enable services
. enable-services.sh

# Process the selected options
if echo "$CHOICES" | grep -q "Flatpak Apps"; then
  gum style --foreground 82 "Installing Flatpak Apps (Spotify, Chrome)..."
  . install/07-flatpaks.sh
else
  gum style --foreground 196 "Skipping Flatpak Apps installation."
fi

if echo "$CHOICES" | grep -q "VirtualBox"; then
  gum style --foreground 82 "Installing VirtualBox..."
  . install/08-virtual-box.sh
else
  gum style --foreground 196 "Skipping VirtualBox installation."
fi

. install/09-default-wallpapers.sh

if echo "$CHOICES" | grep -q "Gnome Specific"; then
  gum style --foreground 82 "Installing Gnome Specific configurations for TWM..."
  . install/10-gnome-specifics-twm.sh
else
  gum style --foreground 196 "Skipping Gnome Specific configurations."
fi

. install/11-lightdm.sh
. install/12-default-dotfiles.sh

# Show completion message with a spinner
gum style --border double --margin "1" --padding "1" --border-foreground 82 "Setup complete! You may want to reboot your system."
