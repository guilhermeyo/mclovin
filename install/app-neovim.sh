# Define the Neovim version to download
NVIM_VERSION="stable" # Change to specific version if needed

# Install Neovim
cd /tmp
wget -O nvim.tar.gz "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux64.tar.gz"
tar -xf nvim.tar.gz
sudo install nvim-linux64/bin/nvim /usr/local/bin/nvim
rm -rf nvim-linux64 nvim.tar.gz
cd -
