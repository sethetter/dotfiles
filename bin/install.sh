#!/usr/bin/env bash

# Install symlinks for all of my dotfiles.
# Includes: Bash Profile, Vim, and irssi.


# TODO: Add tmux and powerline check/install here.

ABSPATH=$(cd "$(dirname "$0")"/..; pwd)

# Bash Profile
#-----------------------------------------------------------
`mv ~/.bash_profile ~/._bash_profilebackup`
`ln -s ${ABSPATH}/bash_profile ~/.bash_profile`

# Irssi
#------------------------------------------------------------
`mv ~/.irssi ~/._irssibackup`
`ln -s ${ABSPATH}/irssi ~/.irssi`

# Vim
#------------------------------------------------------------
`mv ~/.vim ~/._vimbackup`
`ln -s ${ABSPATH}/vim ~/.vim`
`mv ~/.vimrc ~/._vimrcbackup`
`ln -s ${ABSPATH}/vimrc ~/.vimrc`

# Tmux Config
#------------------------------------------------------------
`mv ~/.tmux.conf ~/._tmux.confbackup`
`ln -s ${ABSPATH}/tmux.conf ~/.tmux.conf`