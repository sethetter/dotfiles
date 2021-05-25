set -gx AWS_REGION us-east-1

set -gx DENO_PATH /Users/sethetter/.deno
set -gx GOROOT /usr/local/go
set -gx GOPATH $HOME/code/go
set -gx COMPOSER_PATH $HOME/.composer/vendor/bin
set -gx HEROKU_PATH /usr/local/heroku/bin
set -gx LOCAL_BIN $HOME/.local/bin
set -gx ANDROID_HOME /opt/android-studio
set -gx PYENV_ROOT $HOME/.pyenv
set -gx RBENV_ROOT $HOME/.rbenv
set -gx PY2_BIN $HOME//Library/Python/2.7/bin
set -gx CARGO_BIN $HOME/.cargo/bin
set -gx VOLTA_HOME "$HOME/.volta"

set -gx PATH $LOCAL_BIN $PATH
set -gx PATH $DENO_PATH/bin $PATH
set -gx PATH $COMPOSER_PATH $PATH
set -gx PATH $HEROKU_PATH $PATH
set -gx PATH $GOPATH/bin $PATH
set -gx PATH $PYENV_ROOT/bin $PATH
set -gx PATH $PY2_BIN $PATH
set -gx PATH $CARGO_BIN $PATH
set -gx PATH $RBENV_ROOT/shims $PATH
set -gx PATH $VOLTA_HOME/bin $PATH

set -x GPG_TTY (tty)
set -x TERM xterm-256color
set -x EDITOR vim

set -g fish_key_bindings fish_vi_key_bindings
set fish_greeting ""

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
function md; open -a typora $argv[1..-1]; end
function lg; lazygit; end
function ddiff; delta --theme='Solarized (light)'; end
function gdm; git diff $argv[1..-1] master; end
function gdc; git diff --cached $argv[1..-1]; end
function ccb; git rev-parse --abbrev-ref HEAD | pbcopy; end

function mdp
  # Requires Markdown Viewer extension
  # - https://chrome.google.com/webstore/detail/markdown-viewer/ckkdlimhmcjmikdlpkmbgfkaikojcbjk?hl=en
  open -a 'Google Chrome.app' $argv[1]
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
  argparse 'D/nodate' -- $argv
  set name "note"
  set -l date (printf "%s-" (date +%y%m%d))

  if set -q _flag_nodate
    set date ""
  end

  if test "$argv[1]"
    set name $argv[1]
  end

  if test "$argv[2]"
    mkdir -p ~/notes/$argv[2]
    and touch ~/notes/$argv[2]/$date$name.md
    and vim -c 'Goyo' ~/notes/$argv[2]/$date$name.md
  else
    mkdir -p ~/notes/uncategorized
    and touch ~/notes/uncategorized/$date$name.md
    and vim -c 'Goyo' ~/notes/uncategorized/$date$name.md
  end
end

function journal; note journal journal; end
function scratch; vim -c 'Goyo' ~/notes/scratch.md; end
function n; note; end
function j; journal; end
function s; scratch; end

# Takes Homework ID as parameter
function unpackhw
  set hwdir ~/code/adhoc/homework_answers/submissions/$argv[1]/
  mkdir $hwdir
  unzip ~/Downloads/$argv[1] -d $hwdir
  rm ~/Downloads/$argv[1].zip
end

eval (direnv hook fish)
set -g fish_user_paths "/usr/local/opt/libarchive/bin" $fish_user_paths

set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH