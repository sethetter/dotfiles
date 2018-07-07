# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export GOPATH=$HOME/code/go
export COMPOSER_PATH=$HOME/.composer/vendor/bin
export ARCANIST_PATH=$HOME/.arcanist/arcanist/bin
export HEROKU_PATH=/usr/local/heroku/bin
export LOCAL_BIN=$HOME/.local/bin
export ANDROID_HOME=/opt/android-studio
export PYENV_ROOT="$HOME/.pyenv"

export PATH=$LOCAL_BIN:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$COMPOSER_PATH:$PATH
export PATH=$HEROKU_PATH:$PATH
export PATH=$ARCANIST_PATH:$PATH
export PATH=$PYENV_ROOT/bin:$PATH

export NVIM_TUI_ENABLE_TRUE_COLOR=1
export TERM='xterm-256color'
export EDITOR='code --wait'

# This should always be last
if [ "`tty`" != "not a tty" ]; then exec fish; fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
