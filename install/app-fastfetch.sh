sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
sudo apt update -y
sudo apt install -y fastfetch

FASTFETCH_VERSION="2.16.0" # Use known good version
cd /tmp
wget https://github.com/fastfetch-cli/fastfetch/releases/download/${FASTFETCH_VERSION}/fastfetch-linux-amd64.deb
sudo apt install -y ./fastfetch-linux-amd64.deb
rm fastfetch-linux-amd64.deb
cd -
