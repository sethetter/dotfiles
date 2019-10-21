set -g fish_key_bindings fish_vi_key_bindings
set fish_greeting ""

function tmux; env TERM=xterm-256color tmux -2 $argv[1..-1]; end
function vi; vim -u ~/dotfiles/vimrc.min $argv[1..-1]; end
function last-commit; git log --oneline -n 1 | cut -c 1-7; end
function copy-last-commit; git log --oneline -n 1 | cut -c 1-7 | pbcopy; end
function o; xdg-open $argv[1..-1]; end
function journal; note journal journal; end
function dc; docker-compose $argv[1..-1]; end
function lg; lazygit; end

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