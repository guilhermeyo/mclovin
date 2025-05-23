#!/bin/bash

WALLPAPERS_DIR="$HOME/Pictures/wallpapers"
DEFAULTS_DIR="$(pwd)/../default-wallpapers"

echo "Wallpapers - Create folder $(WALLPAPERS_DIR)"
mkdir -p "$WALLPAPERS_DIR"
cp -rn "$DEFAULTS_DIR/"* "$WALLPAPERS_DIR/"
echo "Wallpapers - Copied default wallpapers"
