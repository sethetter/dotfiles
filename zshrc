# homebrew
[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

#oh-my-zsh
plugins=(git vi-mode fzf direnv)
ZSH_THEME="robbyrussell"
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# rbenv
eval "$(rbenv init - zsh)"

# ghcup
[ -f "/Users/sethetter/.ghcup/env" ] && source "/Users/sethetter/.ghcup/env" # ghcup-env
