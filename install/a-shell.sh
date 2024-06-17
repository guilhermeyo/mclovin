[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/mclovin/config/bashrc ~/.bashrc
source $HOME/.bashrc

[ -f "~/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
cp ~/.local/share/mclovin/config/inputrc ~/.inputrc
