set -x AWS_REGION us-east-1

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

set -x PATH $PATH $LOCAL_BIN
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $CARGO_BIN
set -x PATH $PATH $PY2_BIN
set -x PATH $PATH $RVM_BIN
set -x PATH $PATH $PYENV_ROOT/bin
set -x PATH $PATH $ARCANIST_PATH
set -x PATH $PATH $HEROKU_PATH
set -x PATH $PATH $COMPOSER_PATH

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
function vi; vim -u ~/dotfiles/vimrc.min $argv[1..-1]; end
function dc; docker-compose $argv[1..-1]; end
function tf; terraform $argv[1..-1]; end
function writing; cd ~/code/sethetter/words/ && vim; end
function md; open -a typora $argv[1..-1]; end
function lg; lazygit; end
function gdc; git diff --cached; end

function mdp
  set f (mktemp).html
  pandoc -t html -o $f $argv[1]
  open $f
end

# function tm
#   if test "$argv[1]"
#     set rootdir $argv[1]
#   else
#     set rootdir (pwd)
#   end
#   tmux new-session -d -c $rootdir -s (basename $rootdir)
# end

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

  if [ $argv[1] = "ls" ]
    if test "$argv[2]"
      ls -l ~/notes/$argv[2]
    else
      ls -l ~/notes
    end
    return
  end

  if test "$argv[1]"
    set name $argv[1]
  end

  if test "$argv[2]"
    mkdir -p ~/notes/$argv[2]
    and vim ~/notes/$argv[2]/$name.md
  else
    vim ~/notes/$name.md
  end
end

# Takes Homework ID as parameter
function unpackhw
  set hwdir ~/code/adhoc/homework_answers/submissions/$argv[1]/
  mkdir $hwdir
  unzip ~/Downloads/$argv[1] -d $hwdir
  rm ~/Downloads/$argv[1].zip
end

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# Source: https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
function rvm --description='Ruby enVironment Manager'
  # run RVM and capture the resulting environment
  set --local env_file (mktemp -t rvm.fish.XXXXXXXXXX)
  # This finds where RVM's root directory is and sources scripts/rvm from within it.  Then loads RVM in a clean environment and dumps the environment variables it generates out for us to use.
  bash -c 'PATH=$GEM_HOME/bin:$PATH;RVMA=$(which rvm);RVMB=$(whereis rvm | sed "s/rvm://");source $(if test $RVMA;then echo $RVMA | sed "s/\/bin\//\/scripts\//";elif test $RVMB; then echo $RVMB | sed "s/rvm/rvm\/scripts\/rvm/"; else echo ~/.rvm/scripts/rvm; fi); rvm "$@"; status=$?; env > "$0"; exit $status' $env_file $argv

  # apply rvm_* and *PATH variables from the captured environment
  and eval (grep -E '^rvm|^PATH|^GEM_PATH|^GEM_HOME' $env_file | grep -v '_clr=' | sed '/^[^=]*PATH/s/:/" "/g; s/^/set -xg /; s/=/ "/; s/$/" ;/; s/(//; s/)//')
  # needed under fish >= 2.2.0
  and set -xg GEM_PATH (echo $GEM_PATH | sed 's/ /:/g')

  # clean up
  rm -f $env_file
end

function __handle_rvmrc_stuff --on-variable PWD
  # Source a .rvmrc file in a directory after changing to it, if it exists.
  # To disable this feature, set rvm_project_rvmrc=0 in $HOME/.rvmrc
  if test "$rvm_project_rvmrc" != 0
    set -l cwd $PWD
    while true
      if contains $cwd "" $HOME "/"
        if test "$rvm_project_rvmrc_default" = 1
          rvm default 1>/dev/null 2>&1
        end
        break
      else
        if test -e .rvmrc -o -e .ruby-version -o -e .ruby-gemset -o -e Gemfile
          eval "rvm reload" > /dev/null
          eval "rvm rvmrc load" >/dev/null
          break
        else
          set cwd (dirname "$cwd")
        end
      end
    end

    set -e cwd
  end
end
