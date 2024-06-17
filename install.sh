# Exit immediately if a command exits with a non-zero status
set -e

# Needed for all installers
sudo pacman -Syu --noconfirm
sudo pacman -Syu --noconfirm base-devel gnupg sudo wget curl unzip rsync figlet gum

# Create directory for keyrings if it doesn't exist
sudo install -dm 755 /etc/pacman.d/gnupg

# Run installers
source $HOME/.local/share/mclovin/install/libraries.sh
source $HOME/.local/share/mclovin/install/git.sh
source $HOME/.local/share/mclovin/install/yay.sh
source $HOME/.local/share/mclovin/install/mise.sh
source $HOME/.local/share/mclovin/install/starship.sh
source $HOME/.local/share/mclovin/install/zoxide.sh
source $HOME/.local/share/mclovin/install/atuin.sh
source $HOME/.local/share/mclovin/install/apps-terminal.sh
source $HOME/.local/share/mclovin/install/bash-preexec.sh
source $HOME/.local/share/mclovin/install/a-shell.sh
source $HOME/.local/share/mclovin/install/app-allacrity.sh
source $HOME/.local/share/mclovin/install/app-lazydocker.sh
source $HOME/.local/share/mclovin/install/app-lazygit.sh
source $HOME/.local/share/mclovin/install/app-neovim.sh
source $HOME/.local/share/mclovin/install/app-vlc.sh
source $HOME/.local/share/mclovin/install/docker.sh
source $HOME/.local/share/mclovin/install/fonts.sh
source $HOME/.local/share/mclovin/install/fastfetch.sh

# Install languages
mise use --global rust@latest
mise use --global python@latest
mise use --global ruby@3.3.4
mise use --global node@lts

# Upgrade everything that might ask for a reboot last
sudo pacman -Syu --noconfirm
