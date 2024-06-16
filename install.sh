# Exit immediately if a command exits with a non-zero status
set -e

# Needed for all installers
sudo pacman -Syu --noconfirm
sudo pacman -Syu --noconfirm base-devel gpg sudo wget curl unzip rsync figlet

# Create directory for keyrings if it doesn't exist
sudo install -dm 755 /etc/pacman.d/gnupg

# Run installers
source $HOME/.local/share/mclovin/apps/libraries.sh
source $HOME/.local/share/mclovin/apps/git.sh
source $HOME/.local/share/mclovin/apps/yay.sh
source $HOME/.local/share/mclovin/apps/gum.sh
source $HOME/.local/share/mclovin/apps/mise.sh
source $HOME/.local/share/mclovin/apps/apps-terminal.sh
source $HOME/.local/share/mclovin/apps/app-allacrity.sh
source $HOME/.local/share/mclovin/apps/app-lazydocker.sh
source $HOME/.local/share/mclovin/apps/app-lazygit.sh
source $HOME/.local/share/mclovin/apps/app-neovim.sh
source $HOME/.local/share/mclovin/apps/app-vlc.sh
source $HOME/.local/share/mclovin/apps/docker.sh
source $HOME/.local/share/mclovin/apps/fonts.sh
source $HOME/.local/share/mclovin/apps/starship.sh
source $HOME/.local/share/mclovin/apps/a-shell.sh
source $HOME/.local/share/mclovin/apps/fastfetch.sh

# Install languages
mise use --global rust@latest
mise use --global python@latest
mise use --global ruby@3.3.4
mise use --global node@lts

# Upgrade everything that might ask for a reboot last
sudo pacman -Syu --noconfirm
