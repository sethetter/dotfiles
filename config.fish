set -gx AWS_REGION us-east-1

set -gx DENO_PATH /Users/sethetter/.deno
set -gx GOROOT /usr/local/go
set -gx GOPATH $HOME/code/go
set -gx COMPOSER_PATH $HOME/.composer/vendor/bin
set -gx ARCANIST_PATH $HOME/.arcanist/arcanist/bin
set -gx HEROKU_PATH /usr/local/heroku/bin
set -gx LOCAL_BIN $HOME/.local/bin
set -gx ANDROID_HOME /opt/android-studio
set -gx PYENV_ROOT $HOME/.pyenv
set -gx RVM_BIN $HOME/.rvm/bin
set -gx PY2_BIN $HOME//Library/Python/2.7/bin
set -gx CARGO_BIN $HOME/.cargo/bin
set -gx VOLTA_HOME "$HOME/.volta"

set -gx PATH $PATH $LOCAL_BIN
set -gx PATH $PATH $GOPATH/bin
set -gx PATH $PATH $CARGO_BIN
set -gx PATH $PATH $PY2_BIN
set -gx PATH $PATH $RVM_BIN
set -gx PATH $PATH $PYENV_ROOT/bin
set -gx PATH $PATH $ARCANIST_PATH
set -gx PATH $PATH $HEROKU_PATH
set -gx PATH $PATH $COMPOSER_PATH
set -gx PATH $PATH $DENO_PATH/bin
set -gx PATH "$VOLTA_HOME/bin" $PATH

set -x GPG_TTY (tty)
set -x TERM xterm-256color
set -x EDITOR vim

set -g fish_key_bindings fish_vi_key_bindings
set fish_greeting ""

function scratch; vim ~/notes/SCRATCH.md; end
function work; vim ~/notes/WORK.md; end
function community; vim ~/notes/COMMUNITY.md; end
function personal; vim ~/notes/PERSONAL.md; end

function tmux; env TERM=xterm-256color tmux -2 $argv[1..-1]; end
function tma; env tmux a; end

function vim
  /usr/local/bin/vim $argv[1..-1]
end
function vi
  /usr/local/bin/vim -u ~/dotfiles/vimrc.min $argv[1..-1]
end
function v; vi $argv[1..-1]; end

function dc; docker-compose $argv[1..-1]; end
function tf; terraform $argv[1..-1]; end
function writing; cd ~/code/sethetter/words/ && vim; end
function md; open -a typora $argv[1..-1]; end
function lg; lazygit; end
function gdh; git icdiff $argv[1..-1]; end
function gdm; git icdiff $argv[1..-1] master; end
function gdc; git icdiff --cached $argv[1..-1]; end

function mdp
  set f (mktemp).html
  pandoc -t html -o $f $argv[1]
  open $f
end

function tm
  set rootdir (pwd)
  if test "$argv[1]"
    set rootdir $argv[1]
  end
  cd $rootdir
  tmux new-session -A -s (basename $PWD)
end

function note
  set name "note"

  if test "$argv[1]"
    set name $argv[1]
  end

  if test "$argv[2]"
    mkdir -p ~/notes/$argv[2]
    and vim -c Goyo ~/notes/$argv[2]/(date +%y%m%d)-$name.md
  else
    mkdir -p ~/notes/uncategorized
    vim -c Goyo ~/notes/uncategorized/(date +%y%m%d)-$name.md
  end
end

function notes; cd ~/notes && vim .; end
function journal; note journal journal; end
function j; journal; end
function doing; vim -c Goyo ~/notes/doing.md; end
function think; vim -c Goyo ~/notes/scratch.md; end

# Takes Homework ID as parameter
function unpackhw
  set hwdir ~/code/adhoc/homework_answers/submissions/$argv[1]/
  mkdir $hwdir
  unzip ~/Downloads/$argv[1] -d $hwdir
  rm ~/Downloads/$argv[1].zip
end

eval (direnv hook fish)
