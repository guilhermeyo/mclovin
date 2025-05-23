#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

WALLPAPERS_DIR="$HOME/Pictures/wallpapers"
DEFAULTS_DIR="$BASE_DIR/default-wallpapers"

echo "Wallpapers - Create folder $WALLPAPERS_DIR"
mkdir -p "$WALLPAPERS_DIR"
cp -rn "$DEFAULTS_DIR/"* "$WALLPAPERS_DIR/"
echo "Wallpapers - Copied default wallpapers"
