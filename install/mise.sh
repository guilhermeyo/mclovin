!/bin/bash

curl https://mise.run | sh

echo -e "\n# Mise Config\neval \"\$($HOME/.local/bin/mise activate bash)\"" >>~/.bashrc

# Verify the installation
if command -v mise &>/dev/null; then
  echo "mise was installed successfully."
else
  echo "Failed to install mise."
fi
