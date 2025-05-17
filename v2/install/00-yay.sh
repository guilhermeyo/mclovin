if ! command -v yay &>/dev/null; then
  echo "yay - Starting installation..."
  sudo pacman -S --needed git base-devel --noconfirm
  if [[ ! -d "yay" ]]; then
    echo "yay - Cloning repository..."
  else
    echo "yay - Directory already exists, removing it..."
    rm -rf yay
  fi

  git clone https://aur.archlinux.org/yay.git

  cd yay
  echo "yay - Building..."
  makepkg -si --noconfirm
  cd ..
  rm -rf yay

  echo "yay - Installation completed!"
else
  echo "yay - already installed"
fi
