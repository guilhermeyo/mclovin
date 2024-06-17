#!/bin/bash

packagesPacman=(
  "hyprland"
  "hyprpaper"
  "hyprlock"
  "hypridle"
  "xdg-desktop-portal-hyprland"
  "waybar"
  "grim"
  "slurp"
  "swappy"
  "cliphist"
)

packagesYay=(
  "wlogout"
  "nwg-look"
  "eww"
  "hyprshade"
)

for package in "${packagesPacman[@]}"; do
  sudo pacman -S "$package" --noconfirm
done

for package in "${packagesYay[@]}"; do
  yay -S "$package" --noconfirm
done
