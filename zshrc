# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="seth"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode)

export TERM='xterm-256color'
export EDITOR=vim

alias tmux='TERMINFO=/usr/share/terminfo/x/xterm-16color TERM=xterm-16color tmux -2'
alias mux='tmuxinator'
alias gitlog='git log --oneline'
alias se-dev='ssh seth@se-dev'

source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/go
export RBENV_PATH=$HOME/.rbenv/bin
export COMPOSER_PATH=$HOME/.composer/vendor/bin

export PATH=$PATH:$RBENV_PATH
export PATH=$PATH:$GOPATH
export PATH=$PATH:$COMPOSER_PATH

# copy last commit sha
alias last-commit="git log --oneline -n 1 | cut -c 1-7"
alias copy-last-commit="git log --oneline -n 1 | cut -c 1-7 | pbcopy"
alias gswatch="watch -n1 -c git -c color.ui=always status"
alias json-fmt="node -e \"console.log(JSON.stringify(JSON.parse(process.argv[1]), null, 4));\""
alias ow-dokku="ssh dokku@dokku.openwichita.com"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi # This load rbenv
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh" # This loads nvm
[ -f /Users/sethetter/.travis/travis.sh ] && source /Users/sethetter/.travis/travis.sh # added by travis gem

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
