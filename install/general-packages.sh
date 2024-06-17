packagesPacman=(
  "pacman-contrib"
  "vim"
  "bluez"
  "bluez-utils"
  "neovim"
  "dunst"
  "thunar"
  "noto-fonts"
  "otf-font-awesome"
  "ttf-fira-sans"
  "ttf-fira-code"
  "ttf-firacode-nerd"
  "python-pip"
  "python-psutil"
  "python-rich"
  "python-click"
  "python-pywal"
  "python-gobject"
  "pavucontrol"
  "tumbler"
  "papirus-icon-theme"
  "polkit-gnome"
  "brightnessctl"
  "man-pages"
  "nm-connection-editor"
  "gvfs"
  "xdg-user-dirs"
  "xdg-desktop-portal-gtk"
  "networkmanager"
  "network-manager-applet"
  "xarchiver"
  "thunar-archive-plugin"
  "fuse2"
  "gtk4"
  "libadwaita"
  "xdg-desktop-portal"
  "qalculate-gtk"
  "guvcview"
  "jq"
  "rofi-wayland"
  "fastfetch"
  "blueman"
  "lazygit"
  "vlc"
)

packagesYay=(
  "bibata-cursor-theme"
  "trizen"
  "pacseek"
  "lazydocker"
)

for package in "${packagesPacman[@]}"; do
  sudo pacman -S "$package" --noconfirm
done

for package in "${packagesYay[@]}"; do
  yay -S "$package" --noconfirm
done
