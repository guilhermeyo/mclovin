#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

echo "Gnome specifics TWM - Starting installation..."
echo "Gnome specifics TWM - Installing Gnome extensions"
. "$BASE_DIR/gnome/gnome-extensions.sh"
echo "Gnome specifics TWM - Setting Gnome hotkeys..."
. "$BASE_DIR/gnome/gnome-hotkeys.sh"
echo "Gnome specifics TWM - Configuring Gnome..."
. "$BASE_DIR/gnome/gnome-settings.sh"
echo "Gnome specifics TWM - Installation completed!"
