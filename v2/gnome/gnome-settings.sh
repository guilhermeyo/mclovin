WALLPAPER_PATH="$HOME/Pictures/wallpapers/alone-tree.jpg"

gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
echo "setting wallpaper to ${WALLPAPER_PATH}"
gsettings set org.gnome.desktop.background picture-uri-dark "file://${WALLPAPER_PATH}"
gsettings set org.gnome.desktop.background picture-options 'zoom'
