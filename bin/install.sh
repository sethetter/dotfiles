#!/usr/bin/env bash

# Install symlinks for all of my dotfiles.
# Includes: Bash Profile, Vim, and irssi.


# TODO: Add tmux and powerline check/install here.

ABSPATH=$(cd "$(dirname "$0")"/..; pwd)

# Bash Profile
#-----------------------------------------------------------
`mv ~/.bash_profile ~/._bash_profile.backup`
`ln -s ${ABSPATH}/bash_profile ~/.bash_profile`

# Irssi
#------------------------------------------------------------
`mv ~/.irssi ~/._irssi.backup`
`ln -s ${ABSPATH}/irssi ~/.irssi`

# Vim
#------------------------------------------------------------
`mv ~/.vim ~/._vim.backup`
`ln -s ${ABSPATH}/vim ~/.vim`
`mv ~/.vimrc ~/._vimrc.backup`
`ln -s ${ABSPATH}/vimrc ~/.vimrc`

# Tmux Config
#------------------------------------------------------------
`mv ~/.tmux.conf ~/._tmux.conf.backup`
`ln -s ${ABSPATH}/tmux.conf ~/.tmux.conf`

# Powerline Files
#------------------------------------------------------------
#`mv /usr/local/powerline /usr/local/_powerline.backup`
#`cp -r ${ABSPATH}/powerline /usr/local/`
`mkdir ~/.config/`
`ln -s ${ABSPATH}/powerline_config ~/.config/powerline`

# Git Files
#------------------------------------------------------------
`mv ~/.gitconfig ~/._gitconfig.backup`
`ln -s ${ABSPATH}/gitconfig ~/.gitconfig`
`mv ~/.gitignore ~/._gitignore.backup`
`ln -s ${ABSPATH}/gitignore ~/.gitignore`