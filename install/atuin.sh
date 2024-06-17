bash <(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)

echo -e "\n# Atuin Config\neval \"\$(atuin init bash)\"" >>~/.bashrc

# Verify the installation
if command -v atuin &>/dev/null; then
  source ~/.bashrc
  echo "atuin was installed successfully."
else
  echo "Failed to install atuin."
fi
