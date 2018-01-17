# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="seth"

# ohmyzsh plugin list
plugins=(vi-mode)


export TERM='xterm-256color'
export EDITOR='emacsclient -t -a="" -c'

alias emacs='emacsclient -t -a="" -c'
alias tmux='TERMINFO=/usr/share/terminfo/x/xterm-16color TERM=xterm-16color tmux -2'
alias mux='tmuxinator'

source $ZSH/oh-my-zsh.sh

export LOCALE_ARCHIVE="$HOME/.nix-profile/lib/locale/locale-archive"

export GOPATH=$HOME/go
export COMPOSER_PATH=$HOME/.composer/vendor/bin
export ARCANIST_PATH=$HOME/.arcanist/arcanist/bin
export HEROKU_PATH=/usr/local/heroku/bin
export LOCAL_BIN=$HOME/.local/bin
export ANDROID_HOME=/opt/android-studio
export PYENV_ROOT="$HOME/.pyenv"

export PATH=$LOCAL_BIN:$PATH
export PATH=$GOPATH:$PATH
export PATH=$COMPOSER_PATH:$PATH
export PATH=$HEROKU_PATH:$PATH
export PATH=$ARCANIST_PATH:$PATH
export PATH=$PYENV_ROOT/bin:$PATH

# copy last commit sha
alias last-commit="git log --oneline -n 1 | cut -c 1-7"
alias copy-last-commit="git log --oneline -n 1 | cut -c 1-7 | pbcopy"
alias json-fmt="node -e \"console.log(JSON.stringify(JSON.parse(require('fs').readFileSync(process.argv[1]).toString('utf8')), null, 4));\""
alias o="xdg-open"
alias notes="cd ~/notes && emacs ."
alias scratch="emacs ~/notes/scratch.org"
alias journal="note journal journal"

# git aliases
alias gpull="git pull"
alias gpush="git push"
alias gs="git status"
alias gswatch="watch -n1 -c git -c color.ui=always status"
alias gc="git commit"
alias gca="git commit --amend"
alias gd="git diff"
alias gco="git checkout"
alias gb="git branch"
alias gl="git log"
alias glo="git log --oneline"

function note() {
  NAME="note" && [[ ! -z $1 ]] && NAME=$1

  if [ ! -z $2 ]; then
    mkdir -p ~/notes/$2
    emacs ~/notes/$2/$(date +%y%m%d)-$NAME.md
  else
    emacs ~/notes/$(date +%y%m%d)-$NAME.md
  fi
}

function tm() {
  ROOTDIR=`pwd` && [[ ! -z $1 ]] && ROOTDIR=$1
  cd $ROOTDIR
  NAME=${PWD##*/}
  tmux new-session -A -s $NAME
}

[ -f /Users/sethetter/.travis/travis.sh ] && source /Users/sethetter/.travis/travis.sh # added by travis gem

eval `dircolors ~/.dircolors`
if [ -e /home/sethetter/.nix-profile/etc/profile.d/nix.sh ]; then . /home/sethetter/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/sethetter/code/articleone/services/api/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/sethetter/code/articleone/services/api/node_modules/tabtab/.completions/serverless.zsh

# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/sethetter/code/articleone/services/api/node_modules/tabtab/.completions/sls.zsh ]] && . /home/sethetter/code/articleone/services/api/node_modules/tabtab/.completions/sls.zsh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi