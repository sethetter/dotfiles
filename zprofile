. ~/.profile

export TERM='xterm-256color'
export EDITOR=vim
bindkey -v

alias tmux='tmux -2'
alias gitlog='git log --oneline'
alias se-dev='ssh seth@se-dev'

PATH=$HOME/.rvm/bin:/usr/local/bin:$PATH # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s /home/seth/.nvm/nvm.sh ]] && source /home/seth/.nvm/nvm.sh # This loads NVM
