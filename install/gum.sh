GUM_VERSION="0.14.1" # Use known good version

mkdir -p /tmp/gum-install
cd /tmp/gum-install
wget "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum-${GUM_VERSION}.tar.gz"
tar -xzf "gum_${GUM_VERSION}.tar.gz"

sudo mv gum /usr/local/bin/

if command -v gum &>/dev/null; then
  echo "Gum was installed successfully."
else
  echo "Failed to install Gum."
fi
