sudo pacman -Syu fastfetch --noconfirm

[ -f "~/.config/fastfetch" ] && mv ~/.config/fastfetch ~/.config/fastfetch.bak
ln -s ~/.local/share/mclovin/configs/fastfetch ~/.config/fastfetch
