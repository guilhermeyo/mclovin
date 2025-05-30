# Active bash-preexec from AUR
[[ -f /usr/share/bash-preexec/bash-preexec.sh ]] && source /usr/share/bash-preexec/bash-preexec.sh

eval "$(mise activate bash)"
eval "$(starship init bash)"
eval "$(atuin init bash)"
eval "$(zoxide init bash)"

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

# Add local project bin directory (current folder)
export PATH="./bin:$PATH"

# User-level local binaries (used by pip, flatpak, etc.)
export PATH="$HOME/.local/bin:$PATH"

# Custom binaries from mclovin (custom scripts/tools)
export PATH="$HOME/.local/share/mclovin/bin:$PATH"

# System-wide sbin and bin directories
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/bin:$PATH"

# Snap packages (if using Snap on Arch)
export PATH="/snap/bin:$PATH"

# Rust (cargo install) binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Atuin shell history tool
export PATH="$HOME/.atuin/bin:$PATH"

# Tmuxifier session management
export PATH="$HOME/.tmuxifier/bin:$PATH"

# Docker CLI plugins
export PATH="$HOME/.docker/cli-plugins:$PATH"

# Eza config
export EZA_COLORS="di=37:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:oc=37:ur=37:uw=37:ux=37:ue=37:gr=37:gw=37:gx=37:tr=37:tw=37:tx=37:su=37:sf=37:xa=37:sn=37:uu=37:uR=37:un=37:bu=48;5;999:sc=48;5;999:cm=48;5;999:tm=48;5;999:co=48;5;999:do=48;5;999:da=37"

# Enable YJIT
export RUBY_CONFIGURE_OPTS=--enable-yjit

# Aliases
alias f='printf "\033[6 q"'
alias c="clear && f"
alias nf="fastfetch"
alias pf="fastfetch"
alias hex="openssl rand -hex"
alias path='echo $PATH | tr : "\n" | uniq'
alias pubkey="xclip -selection clipboard < ~/.ssh/id_rsa.pub && printf '=> Public key copied to clipboard.\n'"
alias grep="grep --color=auto"
alias cd="z"
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias ls="eza --colour=always --icons --git --git-repos --header --group-directories-first"
alias ll="ls -l -o"

# SSH Agent fallback for GNOME Keyring
if [ -e /run/user/$(id -u)/gcr/ssh ]; then
  export SSH_AUTH_SOCK=/run/user/$(id -u)/gcr/ssh
fi

trap 'printf "\033[6 q"' DEBUG
