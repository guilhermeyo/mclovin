eval "$(starship init bash)"

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export PGHOST="/var/run/postgresql"

export PATH="$PATH:/usr/local/go/bin"

HISTFILE=~/.bash_history
HISTSIZE=10000
HISTFILESIZE=50000
shopt -s histappend

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
