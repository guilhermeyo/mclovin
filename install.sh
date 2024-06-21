# Needed for all installers
# Exit immediately if a command exits with a non-zero status
#set -e

# Needed for all installers
sudo apt update -y
sudo apt install -y curl wget git unzip

# Fix Sleep
sudo kernelstub -a "mem_sleep_default=deep"

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Run installers
source $HOME/.local/share/mclovin/install/libraries.sh
source $HOME/.local/share/mclovin/install/general-packages.sh
source $HOME/.local/share/mclovin/install/gum.sh
source $HOME/.local/share/mclovin/install/eza.sh
source $HOME/.local/share/mclovin/install/starship.sh
source $HOME/.local/share/mclovin/install/app-fastfetch.sh
source $HOME/.local/share/mclovin/install/app-neovim.sh
source $HOME/.local/share/mclovin/install/app-typora.sh
source $HOME/.local/share/mclovin/install/app-localsend.sh
source $HOME/.local/share/mclovin/install/app-atuin.sh
source $HOME/.local/share/mclovin/install/app-lazygit.sh
source $HOME/.local/share/mclovin/install/docker.sh
source $HOME/.local/share/mclovin/install/app-lazydocker.sh
source $HOME/.local/share/mclovin/install/bash-preexec.sh
source $HOME/.local/share/mclovin/install/fonts.sh
source $HOME/.local/share/mclovin/install/mise.sh
source $HOME/.local/share/mclovin/install/backgrounds.sh
source $HOME/.local/share/mclovin/install/i3.sh
source $HOME/.local/share/mclovin/install/picom.sh
source $HOME/.local/share/mclovin/install/polybar.sh
source $HOME/.local/share/mclovin/install/rofi.sh
source $HOME/.local/share/mclovin/install/feh.sh
source $HOME/.local/share/mclovin/install/a-shell.sh
source $HOME/.local/share/mclovin/install/set-configs.sh
source $HOME/.local/share/mclovin/install/app-sublime-text.sh
source $HOME/.local/share/mclovin/install/app-firefox-dev.sh
source $HOME/.local/share/mclovin/install/app-zoom.sh
source $HOME/.local/share/mclovin/install/app-spotify.sh
source $HOME/.local/share/mclovin/install/app-virtualbox.sh

# Install languages
mise use --global rust@latest
mise use --global python@latest
mise use --global ruby@3.3
mise use --global node@lts

# Install databases
sudo docker run -d --restart unless-stopped -p "127.0.0.1:6379:6379" --name=redis redis:7
sudo docker run -d --restart unless-stopped -p "127.0.0.1:5432:5432" --name=postgres16 -e POSTGRES_HOST_AUTH_METHOD=trust postgres:16

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300
