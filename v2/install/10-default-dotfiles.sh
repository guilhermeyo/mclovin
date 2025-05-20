#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
DEFAULTS_DIR="$(pwd)/default-dotfiles"

if ! pacman -Qi stow &>/dev/null; then
  echo "[!] Instale o stow antes de continuar: sudo pacman -S stow"
  exit 1
fi

mkdir -p "$DOTFILES_DIR"
cp -rn "$DEFAULTS_DIR/"* "$DOTFILES_DIR/"
cd "$DOTFILES_DIR"

stow autostart
stow starship
stow bashrc
stow i3
stow picom
stow polybar
stow rofi

echo "[ok] Dotfiles aplicados com stow."
