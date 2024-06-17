sudo pacman -S starship --noconfirm

echo -e "\n# Starship Config\neval \"\$(starship init bash)\"" >>~/.bashrc

[ -f "~/.config/starship.toml" ] && mv ~/config/.starship.toml ~/config/.starship.toml.bak
ln -s ~/.local/share/mclovin/configs/starship.toml ~/.config/starship.toml

source ~/.bashrc
