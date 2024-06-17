curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

echo -e "\n# Zoxide Config\neval \"\$(zoxide init bash)\"" >>~/.bashrc

# Verify the installation
if command -v zoxide &>/dev/null; then
  echo "zoxide was installed successfully."
else
  echo "Failed to install mise."
fi
