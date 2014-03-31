#!/usr/bin/env bash

# Install symlinks for all of my dotfiles.
# Includes: Bash Profile, Vim, and irssi.


# TODO: Add tmux and powerline check/install here.

ABSPATH=$(cd "$(dirname "$0")"/..; pwd)

# Bash Profile
#-----------------------------------------------------------

# Irssi
#------------------------------------------------------------
`mv ~/.irssi ~/._irssi.backup`
`ln -s ${ABSPATH}/irssi ~/.irssi`

# Vim
#------------------------------------------------------------
`mv ~/.vimrc ~/._vimrc.backup`
`ln -s ${ABSPATH}/vimrc ~/.vimrc`

# Tmux Config
#------------------------------------------------------------
`mv ~/.tmux.conf ~/._tmux.conf.backup`
`ln -s ${ABSPATH}/tmux.conf ~/.tmux.conf`

# Zsh Files
#------------------------------------------------------------
`mv ~/.zprofile ~/._zprofile.backup`
`ln -s ${ABSPATH}/zprofile ~/.zprofile`
`mv ~/.oh-my-zsh ~/._oh-my-zsh.backup`
`ln -s ${ABSPATH}/oh-my-zsh ~/.oh-my-zsh`

# Editor Config
#------------------------------------------------------------
`mv ~/.editorconfig ~/._editorconfig.backup`
`ln -s ${ABSPATH}/editorconfig ~/.editorconfig`

# JSHint
#------------------------------------------------------------
`mv ~/.jshintrc ~/._jshintrc.backup`
`ln -s ${ABSPATH}/jshintrc ~/.jshintrc`


# Git Files
#------------------------------------------------------------
`mv ~/.gitconfig ~/._gitconfig.backup`
`ln -s ${ABSPATH}/gitconfig ~/.gitconfig`
`mv ~/.gitignore ~/._gitignore.backup`
`ln -s ${ABSPATH}/gitignore ~/.gitignore`
