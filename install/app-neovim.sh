cd /tmp
wget -O nvim.tar.gz "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"
tar -xf nvim.tar.gz
sudo install nvim-linux64/bin/nvim /usr/local/bin/nvim
[ ! -d "/usr/local/share/nvim/" ] && sudo mkdir -p "/usr/local/share/nvim/"
sudo cp -r nvim-linux64/share/nvim/runtime /usr/local/share/nvim/
rm -rf nvim-linux64 nvim.tar.gz
cd -
