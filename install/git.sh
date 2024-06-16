sudo pacman -Syu git --noconfirm

[ -f "~/.gitignore" ] && mv ~/.gitignore ~/.gitignore.bak
ln -s ~/.local/share/mclovin/configs/git/gitignore ~/.gitignore

[ -f "~/.gitattributes" ] && mv ~/.gitattributes ~/.gitattributes.bak
ln -s ~/.local/share/mclovin/configs/git/gitattributes ~/.gitattributes

[ -f "~/.gitconfig" ] && mv ~/.gitconfig ~/.gitconfig.bak
ln -s ~/.local/share/mclovin/configs/git/gitconfig ~/.gitconfig
