packagesPacman=(
  "gnome"
  "i3"
  "dmenu"
  "picom"
  "neovim"
  "lazygit"
  "vlc"
  "alacritty"
  "starship"
  "fzf"
  "ripgrep"
  "bat"
  "zoxide"
  "bpytop"
  "fd"
)

packagesYay=(
  "ttf-meslo-nerd"
  "rofi"
  "polybar"
  "lazydocker"
  "eza"
  "atuin"
)

for package in "${packagesPacman[@]}"; do
  sudo pacman -S "$package" --noconfirm --ask 4
done

for package in "${packagesYay[@]}"; do
  yay -S "$package" --noconfirm --ask 4
done
