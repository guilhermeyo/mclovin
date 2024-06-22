# Create symbolic links
_installSymLink() {
  name="$1"
  symlink="$2"
  linksource="$3"
  linktarget="$4"

  if [ -L "${symlink}" ]; then
    rm ${symlink}
    ln -s ${linksource} ${linktarget}
    echo "- Symlink ${linksource} -> ${linktarget} created."
  else
    if [ -d ${symlink} ]; then
      rm -rf ${symlink}/
      ln -s ${linksource} ${linktarget}
      echo "- Symlink for directory ${linksource} -> ${linktarget} created."
    else
      if [ -f ${symlink} ]; then
        rm ${symlink}
        ln -s ${linksource} ${linktarget}
        echo "- Symlink to file ${linksource} -> ${linktarget} created."
      else
        ln -s ${linksource} ${linktarget}
        echo "- New symlink ${linksource} -> ${linktarget} created."
      fi
    fi
  fi
}

_installSymLink fastfetch ~/.config/fastfetch ~/.local/share/mclovin/config/fastfetch ~/.config
_installSymLink alacritty ~/.config/alacritty ~/.local/share/mclovin/config/alacritty ~/.config
_installSymLink nvim ~/.config/nvim ~/.local/share/mclovin/config/nvim ~/.config
_installSymLink starship ~/.config/starship.toml ~/.local/share/mclovin/config/starship.toml ~/.config/starship.toml
_installSymLink gitignore ~/.gitignore ~/.local/share/mclovin/config/git/gitignore ~/.gitignore
_installSymLink gitattributes ~/.gitattributes ~/.local/share/mclovin/config/git/gitattributes ~/.gitattributes
_installSymLink gitconfig ~/.gitconfig ~/.local/share/mclovin/config/git/gitconfig ~/.gitconfig
_installSymLink Typora ~/.config/Typora ~/.local/share/mclovin/config/Typora ~/.config
_installSymlink Xresources ~/.Xresources ~/.local/share/mclovin/config/Xresources ~/.Xresources

# Widow Switcher - https://github.com/davatorium/rofi
_installSymLink rofi ~/.config/rofi ~/.local/share/mclovin/config/rofi/ ~/.config

# Polybar - https://github.com/polybar/polybar
_installSymLink polybar ~/.config/polybar ~/.local/share/mclovin/config/polybar/ ~/.config

# piconfig - https://github.com/davatorium/picom
_installSymLink picom ~/.config/picom ~/.local/share/mclovin/config/picom/ ~/.config

# i3 - https://github.com/i3/i3
_installSymLink i3 ~/.config/i3 ~/.local/share/mclovin/config/i3/ ~/.config
