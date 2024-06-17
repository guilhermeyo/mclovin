[ -f "~/.config/fastfetch" ] && mv ~/.config/fastfetch ~/.config/fastfetch.bak
ln -s ~/.local/share/mclovin/config/fastfetch ~/.config/fastfetch

[ -f "~/.config/alacritty" ] && mv ~/.config/alacritty ~/.config/alacritty.bak
ln -s ~/.local/share/mclovin/config/alacritty ~/.config/alacritty

[ -f "~/.config/nvim" ] && mv ~/.config/nvim ~/.config/nvim.bak
ln -s ~/.local/share/mclovin/config/nvim ~/.config/nvim

[ -f "~/.config/starship.toml" ] && mv ~/.config/starship.toml ~/.config/starship.toml.bak
ln -s ~/.local/share/mclovin/config/starship.toml ~/.config/starship.toml
