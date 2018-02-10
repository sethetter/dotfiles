# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export GOPATH=$HOME/code/go
export GOBIN_PATH=/usr/local/go/bin
export COMPOSER_PATH=$HOME/.composer/vendor/bin
export ARCANIST_PATH=$HOME/.arcanist/arcanist/bin
export HEROKU_PATH=/usr/local/heroku/bin
export LOCAL_BIN=$HOME/.local/bin
export ANDROID_HOME=/opt/android-studio
export PYENV_ROOT="$HOME/.pyenv"

export PATH=$LOCAL_BIN:$PATH
export PATH=$PATH:$GOBIN_PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$COMPOSER_PATH:$PATH
export PATH=$HEROKU_PATH:$PATH
export PATH=$ARCANIST_PATH:$PATH
export PATH=$PYENV_ROOT/bin:$PATH

export TERM='xterm-256color'
export EDITOR='emacsclient -t -a="" -c'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# This should always be last
if [ "`tty`" != "not a tty" ]; then exec fish; fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/sethetter/code/articleone/services/api/node_modules/tabtab/.completions/serverless.bash ] && . /home/sethetter/code/articleone/services/api/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/sethetter/code/articleone/services/api/node_modules/tabtab/.completions/sls.bash ] && . /home/sethetter/code/articleone/services/api/node_modules/tabtab/.completions/sls.bash
