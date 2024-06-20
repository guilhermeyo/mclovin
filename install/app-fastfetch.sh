FASTFETCH_VERSION="2.16.0" # Use known good version
cd /tmp
wget https://github.com/fastfetch-cli/fastfetch/releases/download/${FASTFETCH_VERSION}/fastfetch-linux-amd64.deb
sudo apt install -y ./fastfetch-linux-amd64.deb --allow-downgrade
rm fastfetch-linux-amd64.deb
cd -
