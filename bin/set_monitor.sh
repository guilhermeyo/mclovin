#!/bin/bash

set_dpi() {
  DPI=$1
  sed -i "s/^Xft.dpi:.*/Xft.dpi: $DPI/" ~/.Xresources
  echo "Xft.dpi: $DPI" | xrdb -merge
}

set_alacritty_font_size() {
  FONT_SIZE=$1
  ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.toml"
  sed -i "/\[font\]/,/\[/{s/size = .*/size = $FONT_SIZE/}" $ALACRITTY_CONFIG
}

case "$1" in
external)
  xrandr --output eDP-1 --off --output DP-3 --auto --primary
  set_dpi 192
  set_alacritty_font_size 14 # Exemplo de tamanho de fonte para monitor externo
  ;;
dual)
  xrandr --output DP-3 --auto --primary --output eDP-1 --auto --left-of DP-3
  set_dpi 192
  set_alacritty_font_size 14 # Exemplo de tamanho de fonte para configuração dual
  ;;
notebook)
  xrandr --output DP-3 --off --output eDP-1 --auto --primary
  set_dpi 144
  set_alacritty_font_size 12 # Exemplo de tamanho de fonte para o notebook
  ;;
*)
  echo "Usage: $0 {external|dual|notebook}"
  exit 1
  ;;
esac

i3-msg restart
