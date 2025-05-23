# Active bash-preexec from AUR
[[ -f /usr/share/bash-preexec/bash-preexec.sh ]] && source /usr/share/bash-preexec/bash-preexec.sh

eval "$(mise activate bash)"
eval "$(starship init bash)"
eval "$(atuin init bash)"
eval "$(zoxide init bash)"
eval "$(tmuxifier init -)"

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

export PATH="$PATH:/usr/local/go/bin"

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
