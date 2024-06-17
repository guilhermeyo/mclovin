!/bin/bash

curl https://mise.run | sh

# Install mise
sudo pacman -Sy --noconfirm mise

# Verify the installation
if command -v mise &>/dev/null; then
  echo "mise was installed successfully."
else
  echo "Failed to install mise."
fi
