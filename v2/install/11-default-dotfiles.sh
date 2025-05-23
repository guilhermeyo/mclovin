#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DOTFILES_DIR="$HOME/dotfiles"
DEFAULTS_DIR="$BASE_DIR/default-dotfiles"
BACKUP_DIR="$HOME/.config/mclovin-before-configs"

if ! pacman -Qi stow &>/dev/null; then
  echo -e "${RED}[!] Please install 'stow': sudo pacman -S stow${NC}"
  exit 1
fi

mkdir -p "$DOTFILES_DIR"
mkdir -p "$BACKUP_DIR"
cp -rn "$DEFAULTS_DIR/"* "$DOTFILES_DIR/"
cd "$DOTFILES_DIR"

apply_stow() {
  local package="$1"
  local target_path="$2"
  echo -e "${YELLOW}[*] Processando $package...${NC}"

  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    echo -e "${YELLOW}    -> Encontrado $target_path existente${NC}"
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local backup_name="$(basename "$target_path")_${timestamp}"
    echo -e "${YELLOW}    -> Movendo para $BACKUP_DIR/$backup_name${NC}"
    sudo mv "$target_path" "$BACKUP_DIR/$backup_name"
  fi

  if [ "$package" == "lightdm" ]; then
    sudo stow -t / "$package"
  else
    stow "$package"
  fi

  if [ $? -eq 0 ]; then
    echo -e "${GREEN}    -> $package aplicado com sucesso!${NC}"
  else
    echo -e "${RED}    -> Erro ao aplicar $package${NC}"
    return 1
  fi
}

declare -A configs=(
  ["Xresources"]="$HOME/.Xresources"
  ["autostart"]="$HOME/.config/autostart"
  ["bashrc"]="$HOME/.bashrc"
  ["fastfetch"]="$HOME/.config/fastfetch"
  ["i3"]="$HOME/.config/i3"
  ["inputrc"]="$HOME/.inputrc"
  ["kitty"]="$HOME/.config/kitty"
  ["picom"]="$HOME/.config/picom"
  ["polybar"]="$HOME/.config/polybar"
  ["rofi"]="$HOME/.config/rofi"
  ["starship"]="$HOME/.config/starship.toml"
  ["tmux"]="$HOME/.tmux.conf"
  ["lightdm"]="/etc/lightdm"
)

for config in "${!configs[@]}"; do
  apply_stow "$config" "${configs[$config]}"
done

echo -e "\n${GREEN}[ok] Dotfiles aplicados com stow.${NC}"
echo -e "${GREEN}[info] Backups salvos em: $BACKUP_DIR${NC}"

if [ "$(ls -A "$BACKUP_DIR" 2>/dev/null)" ]; then
  echo -e "\n${YELLOW}Backups criados:${NC}"
  ls -la "$BACKUP_DIR"
fi
