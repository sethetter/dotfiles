export TERM='xterm-256color'
export EDITOR=vim
bindkey -v

alias tmux='tmux -2'

PATH=$HOME/.rvm/bin:/usr/local/bin:$PATH # Add RVM to PATH for scripting

[[ -s /home/seth/.nvm/nvm.sh ]] && . /home/seth/.nvm/nvm.sh # This loads NVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
