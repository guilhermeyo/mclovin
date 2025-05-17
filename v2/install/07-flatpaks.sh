FLATPAKS=(
  "spotify"
  "chrome"
)

echo "Flatpacks - Starting installation..."
for pak in "${FLATPAKS[@]}"; do
  if ! flatpak list | grep -i "$pak" &>/dev/null; then
    echo "Flatpacks - Installing: $pak"
    flatpak install --noninteractive "$pak"
  else
    echo "Flatpacks - already installed: $pak"
  fi
done

echo "Flatpacks - Installation completed!"
