sudo pacman -S alacritty --noconfirm

[ -f "~/.config/alacritty" ] && mv ~/.config/alacritty ~/.config/alacritty.bak
ln -s ~/.local/share/mclovin/configs/alacritty ~/.config/alacritty
