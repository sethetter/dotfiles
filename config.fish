set -x GOROOT /usr/local/go
set -x GOPATH $HOME/code/go
set -x COMPOSER_PATH $HOME/.composer/vendor/bin
set -x ARCANIST_PATH $HOME/.arcanist/arcanist/bin
set -x HEROKU_PATH /usr/local/heroku/bin
set -x LOCAL_BIN $HOME/.local/bin
set -x ANDROID_HOME /opt/android-studio
set -x PYENV_ROOT $HOME/.pyenv
set -x RVM_BIN $HOME/.rvm/bin
set -x PY2_BIN $HOME//Library/Python/2.7/bin
set -x CARGO_BIN $HOME/.cargo/bin
set -x CABAL_BIN $HOME/.cabal/bin

set -x PATH $PATH $LOCAL_BIN
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $CARGO_BIN
set -x PATH $PATH $PY2_BIN
set -x PATH $PATH $RVM_BIN
set -x PATH $PATH $PYENV_ROOT/bin
set -x PATH $PATH $ARCANIST_PATH
set -x PATH $PATH $HEROKU_PATH
set -x PATH $PATH $COMPOSER_PATH
set -x PATH $PATH $CABAL_BIN

set -x GPG_TTY (tty)
set -x TERM xterm-256color
set -x EDITOR 'vim -u ~/dotfiles/vimrc.min'

set -g fish_key_bindings fish_vi_key_bindings
set fish_greeting ""

function tmux; env TERM=xterm-256color tmux -2 $argv[1..-1]; end
function vi; vim -u ~/dotfiles/vimrc.min $argv[1..-1]; end
function dc; docker-compose $argv[1..-1]; end
function tf; terraform $argv[1..-1]; end
function md; open -a typora $argv[1..-1]; end
function work; md ~/notes/WORK.md; end
function comm; md ~/notes/WORK.md; end
function lg; lazygit; end
function gdc; git diff --cached; end

function tm
  set rootdir (pwd)
  if test "$argv[1]"
    set rootdir $argv[1]
  end
  cd $rootdir
  tmux new-session -A -s (basename $PWD)
end

# Takes Homework ID as parameter
function unpackhw
  set hwdir ~/code/adhoc/homework_answers/submissions/$argv[1]/
  mkdir $hwdir
  unzip ~/Downloads/$argv[1] -d $hwdir
  rm ~/Downloads/$argv[1].zip
end

# fenv source '$HOME/.nix-profile/etc/profile.d/nix.sh'
