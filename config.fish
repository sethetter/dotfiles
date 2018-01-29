set -g fish_key_bindings fish_vi_key_bindings
set fish_greeting ""

function emacs; emacsclient -t -a="" -c $argv[1..-1]; end
function tmux; env TERMINFO=/usr/share/terminfo/x/xterm-16color TERM=xterm-16color tmux -2 $argv[1..-1]; end
function mux; tmuxinator $argv[1..-1]; end
function last-commit; git log --oneline -n 1 | cut -c 1-7; end
function copy-last-commit; git log --oneline -n 1 | cut -c 1-7 | pbcopy; end
function o; xdg-open $argv[1..-1]; end
function notes; cd ~/notes; and emacs .; end
function scratch; emacs ~/notes/scratch.md; end
function doing; emacs ~/notes/doing.md; end
function journal; note journal journal; end

function json-fmt
  node -e "console.log(JSON.stringify(JSON.parse(require('fs').readFileSync(process.argv[1]).toString('utf8')), null, 4));"
end

# git aliases
function gpull; git pull; end
function gpush; git push; end
function gs; git status; end
function gswatch; watch -n1 -c git -c color.ui=always status; end
function gc; git commit; end
function gca; git commit --amend; end
function gd; git diff; end
function gco; git checkout; end
function gb; git branch; end
function gl; git log; end
function glo; git log --oneline; end

function note
  set name "note"

  if test "$argv[1]"
    set name $argv[1]
  end

  if test "$argv[2]"
    mkdir -p ~/notes/$argv[2]
    and emacs ~/notes/$argv[2]/(date +%y%m%d)-$name.md
  else
    emacs ~/notes/(date +%y%m%d)-$name.md
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
