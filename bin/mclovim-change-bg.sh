#!/bin/bash

BACKGROUND_DIR=~/backgrounds
LOG_FILE=~/.mclovin-last-background.log

choose_new_wallpaper() {
  local wallpapers=("$BACKGROUND_DIR"/*)
  local new_wallpaper

  if [[ -f $LOG_FILE ]]; then
    last_wallpaper=$(cat "$LOG_FILE")
  else
    last_wallpaper=""
  fi

  while true; do
    new_wallpaper=${wallpapers[RANDOM % ${#wallpapers[@]}]}
    if [[ $new_wallpaper != $last_wallpaper ]]; then
      break
    fi
  done

  echo "$new_wallpaper"
}

new_wallpaper=$(choose_new_wallpaper)
feh --bg-scale "$new_wallpaper"

# Salva o novo wallpaper no arquivo de log
echo "$new_wallpaper" >"$LOG_FILE"
