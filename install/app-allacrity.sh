sudo pacman -Syu allacrity --noconfirm

[ -f "~/.config/alacritty" ] && mv ~/.config/allacrity ~/.config/allacrity.bak
ln -s ~/.local/share/mclovin/configs/alacritty ~/.config/alacritty
