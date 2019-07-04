if test -n "$EMACS"
  set -x TERM eterm-color
end

function fish_title
  true
end

set -x EDITOR "vi -u ~/.vimrc.min"

set -g fish_key_bindings fish_vi_key_bindings
set fish_greeting ""

function tmux; env TERM=xterm-256color tmux -2 $argv[1..-1]; end
function mux; tmuxinator $argv[1..-1]; end
function vi; vi -u ~/.vimrc.min $argv[1..-1]; end
function last-commit; git log --oneline -n 1 | cut -c 1-7; end
function copy-last-commit; git log --oneline -n 1 | cut -c 1-7 | pbcopy; end
function o; xdg-open $argv[1..-1]; end
function notes; vim ~/notes; end
function lnote; mkdir -p _NOTES.sethetter; and echo "# $argv[1]" > _NOTES.sethetter/$argv[1].md; and vim _NOTES.sethetter/$argv[1].md; end
function scratch; vim ~/notes/scratch.md; end
function dlog; vim ~/notes/LOG.md; end
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

# Takes a file path and prints a formatted version of that JSON file
function json-fmt
  node -e "console.log(JSON.stringify(JSON.parse(require('fs').readFileSync(process.argv[0]).toString('utf8')), null, 4));"
end

set -l nix_shell_info (
  if test "$IN_NIX_SHELL" = "1"
    echo -n "<nix-shell>"
  end
)

function note
  set name "note"

  if test "$argv[1]"
    set name $argv[1]
  end

  if test "$argv[2]"
    mkdir -p ~/notes/$argv[2]
    and vim ~/notes/$argv[2]/(date +%y%m%d)-$name.md
  else
    vim ~/notes/(date +%y%m%d)-$name.md
  end
end

function glv
  set target HEAD
  if test "$argv[1]"
    set target $argv[1]
  end
  git log --graph --pretty=format:'%h - %d %s (%cr) <%an>' $target | vim -R -c 'set filetype=git nowrap' -
end

# Start pyenv
# status --is-interactive; and . (pyenv init -|psub)
# status --is-interactive; and . (pyenv virtualenv-init -|psub)
