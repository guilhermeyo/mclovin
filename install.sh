!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Needed for all installers
sudo pacman -Syu --noconfirm
sudo pacman -Syu --noconfirm base-devel git gnupg sudo wget curl unzip rsync figlet gum

# Create directory for keyrings if it doesn't exist
sudo install -dm 755 /etc/pacman.d/gnupg

# Run installers
source $HOME/.local/share/mclovin/install/libraries.sh
source $HOME/.local/share/mclovin/install/yay.sh
source $HOME/.local/share/mclovin/install/general-packages.sh
source $HOME/.local/share/mclovin/install/mise.sh
source $HOME/.local/share/mclovin/install/bash-preexec.sh
source $HOME/.local/share/mclovin/install/a-shell.s
source $HOME/.local/share/mclovin/install/set-configs.sh
source $HOME/.local/share/mclovin/install/docker.sh

# Enable gdm
sudo systemctl enable gdm.service

# Install languages
mise use --global rust@latest
mise use --global python@latest
mise use --global ruby@3.3.4
mise use --global node@lts

# Upgrade everything that might ask for a reboot last
sudo pacman -Syu --noconfirm
