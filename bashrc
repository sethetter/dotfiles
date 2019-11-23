# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export GOROOT=/usr/local/go
export GOPATH=$HOME/code/go
export COMPOSER_PATH=$HOME/.composer/vendor/bin
export ARCANIST_PATH=$HOME/.arcanist/arcanist/bin
export HEROKU_PATH=/usr/local/heroku/bin
export LOCAL_BIN=$HOME/.local/bin
export ANDROID_HOME=/opt/android-studio
export PYENV_ROOT="$HOME/.pyenv"
export RVM_BIN=$HOME/.rvm/bin
export PY2_BIN=$HOME//Library/Python/2.7/bin
export CARGO_BIN=$HOME/.cargo/bin
export CABAL_BIN=$HOME/.cabal/bin

export PATH=$COMPOSER_PATH:$PATH
export PATH=$HEROKU_PATH:$PATH
export PATH=$ARCANIST_PATH:$PATH
export PATH=$PYENV_ROOT/bin:$PATH
export PATH=$RVM_BIN:$PATH
export PATH=$PY2_BIN:$PATH
export PATH=$CARGO_BIN:$PATH
export PATH=$CABAL_BIN:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$LOCAL_BIN:$PATH

export GPG_TTY=$(tty)
export TERM='xterm-256color'
export EDITOR='code -w'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh" 

# This should always be last
if [ "`tty`" != "not a tty" ]; then exec fish; fi
