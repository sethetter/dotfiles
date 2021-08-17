export EDITOR=nvim

alias tma="tmux a"
function tm {
  rootdir=$(pwd)
  if [ ! -z "$1" ]; then
    rootdir=$1
  fi
  cd $rootdir
  echo "rootdir: ${rootdir##*/}"
  tmux new-session -A -s "${rootdir##*/}"
}

. /Users/sethetter/.nix-profile/etc/profile.d/nix.sh
