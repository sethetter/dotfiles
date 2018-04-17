set -g fish_key_bindings fish_vi_key_bindings
set fish_greeting ""

function tmux; env TERM=konsole-256color tmux -2 $argv[1..-1]; end 
function mux; tmuxinator $argv[1..-1]; end
function last-commit; git log --oneline -n 1 | cut -c 1-7; end
function copy-last-commit; git log --oneline -n 1 | cut -c 1-7 | pbcopy; end
function o; xdg-open $argv[1..-1]; end
function notes; code ~/notes; end
function scratch; code ~/notes/scratch.md; end
function doing; code ~/notes/doing.md; end
function journal; note journal journal; end

function json-fmt
  node -e "console.log(JSON.stringify(JSON.parse(require('fs').readFileSync(process.argv[1]).toString('utf8')), null, 4));"
end

function note
  set name "note"

  if test "$argv[1]"
    set name $argv[1]
  end

  if test "$argv[2]"
    mkdir -p ~/notes/$argv[2]
    and code ~/notes/$argv[2]/(date +%y%m%d)-$name.md
  else
    code ~/notes/(date +%y%m%d)-$name.md
  end
end

function tm
  set rootdir (pwd)
  if test "$argv[1]"
    set rootdir $argv[1]
  end
  cd $rootdir
  tmux new-session -A -s (basename $PWD)
end
