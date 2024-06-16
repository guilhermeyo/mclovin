if ! grep -q "source $HOME/share/mclovin/config/bashrc" ~/.zshrc; then
  echo "source $HOME/share/mclovin/config/bashrc" >> ~/.bashrc
  echo "Profile has been added to ~/.bashrc"
else
  echo "Profile is already sourced in ~/.bashrc"
fi

source $HOME/.bashrc
