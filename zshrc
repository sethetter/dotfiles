eval "$(/opt/homebrew/bin/brew shellenv)"
plugins=(git vi-mode fzf direnv)
ZSH_THEME="robbyrussell"
source $HOME/.oh-my-zsh/oh-my-zsh.sh
eval "$(rbenv init - zsh)"[ -f "/Users/sethetter/.ghcup/env" ] && source "/Users/sethetter/.ghcup/env" # ghcup-env
