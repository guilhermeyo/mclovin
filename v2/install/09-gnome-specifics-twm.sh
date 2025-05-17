#!/bin/bash

echo "Gnome specifics TWM - Starting installation..."

# Install gnome specific things to make it like a tiling WM
echo "Gnome specifics TWM - Installing Gnome extensions"
. ../gnome/gnome-extensions.sh
echo "Gnome specifics TWM - Setting Gnome hotkeys..."
. ../gnome/gnome-hotkeys.sh
echo "Gnome specifics TWM - Configuring Gnome..."
. ../gnome/gnome-settings.sh

echo "Gnome specifics TWM - Installation completed!"
