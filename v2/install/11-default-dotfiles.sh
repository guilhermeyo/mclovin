#!/bin/bash

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

DOTFILES_DIR="$HOME/dotfiles"
DEFAULTS_DIR="$(pwd)/../default-dotfiles"
BACKUP_DIR="$HOME/.config/mclovin-before-configs"

# Verifica se stow está instalado
if ! pacman -Qi stow &>/dev/null; then
  echo -e "${RED}[!] Please install 'stow': sudo pacman -S stow${NC}"
  exit 1
fi

# Cria diretórios necessários
mkdir -p "$DOTFILES_DIR"
mkdir -p "$BACKUP_DIR"

# Copia os dotfiles padrão
cp -rn "$DEFAULTS_DIR/"* "$DOTFILES_DIR/"

cd "$DOTFILES_DIR"

# Função para fazer backup e aplicar stow
apply_stow() {
  local package="$1"
  local target_path="$2"

  echo -e "${YELLOW}[*] Processando $package...${NC}"

  # Verifica se o alvo existe
  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    echo -e "${YELLOW}    -> Encontrado $target_path existente${NC}"

    # Cria timestamp para o backup
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local backup_name="$(basename "$target_path")_${timestamp}"

    # Move para o diretório de backup
    echo -e "${YELLOW}    -> Movendo para $BACKUP_DIR/$backup_name${NC}"
    mv "$target_path" "$BACKUP_DIR/$backup_name"
  fi

  # Aplica o stow
  stow "$package"

  if [ $? -eq 0 ]; then
    echo -e "${GREEN}    -> $package aplicado com sucesso!${NC}"
  else
    echo -e "${RED}    -> Erro ao aplicar $package${NC}"
    return 1
  fi
}

# Array com as configurações e seus caminhos
declare -A configs=(
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
  ["lightdm"]="$HOME/.config/lightdm"
)

# Aplica cada configuração
for config in "${!configs[@]}"; do
  apply_stow "$config" "${configs[$config]}"
done

echo -e "\n${GREEN}[ok] Dotfiles aplicados com stow.${NC}"
echo -e "${GREEN}[info] Backups salvos em: $BACKUP_DIR${NC}"

# Lista os backups criados
if [ "$(ls -A "$BACKUP_DIR" 2>/dev/null)" ]; then
  echo -e "\n${YELLOW}Backups criados:${NC}"
  ls -la "$BACKUP_DIR"
fi
