if ! grep -q "source $HOME/.local/share/mclovin/config/bashrc" ~/.bashrc; then
  echo "source $HOME/.local/share/mclovin/config/bashrc" >>~/.bashrc
  echo "Profile has been added to ~/.bashrc"
else
  echo "Profile is already sourced in ~/.bashrc"
fi

source $HOME/.bashrc
