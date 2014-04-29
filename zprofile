. ~/.profile

export TERM='xterm-256color'
export EDITOR=vim
bindkey -v

alias tmux='tmux -2'
alias gitlog='git log --oneline'
alias se-dev='ssh seth@se-dev'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh" # This loads NVM
