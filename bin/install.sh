#!/usr/bin/env bash

# Install symlinks for all of my dotfiles.
# Includes: Bash Profile, Vim, and irssi.


# TODO: Add tmux and powerline check/install here.

ABSPATH=$(cd "$(dirname "$0")"/..; pwd)

# Bash Profile
#-----------------------------------------------------------

# Irssi
#------------------------------------------------------------
#`mv ~/.irssi ~/._irssi.backup`
#`ln -s ${ABSPATH}/irssi ~/.irssi`

# Vim
#------------------------------------------------------------
`mv ~/.vimrc ~/._vimrc.backup`
`ln -s ${ABSPATH}/vimrc ~/.vimrc`

# Install NeoBundle for vim
`curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh`

# Tmux Config
#------------------------------------------------------------
`mv ~/.tmux.conf ~/._tmux.conf.backup`
`ln -s ${ABSPATH}/tmux.conf ~/.tmux.conf`

#`mv ~/.tmux.light.conf ~/._tmux.light.conf.backup`
#`ln -s ${ABSPATH}/tmux.light.conf ~/.tmux.light.conf`

#`mv ~/.tmux.dark.conf ~/._tmux.dark.conf.backup`
#`ln -s ${ABSPATH}/tmux.dark.conf ~/.tmux.dark.conf`

# Zsh Files
#------------------------------------------------------------
`mv ~/.zrc ~/._zrc.backup`
`ln -s ${ABSPATH}/zrc ~/.zrc`
`mv ~/.oh-my-zsh ~/._oh-my-zsh.backup`
`ln -s ${ABSPATH}/oh-my-zsh ~/.oh-my-zsh`
`ln -s ${ABSPATH}/seth.zsh-theme ${ABSPATH}/oh-my-zsh/themes/seth.zsh-theme`


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

# Dir Colors
#------------------------------------------------------------
`mv ~/.dircolors ~/.dircolors.backup`
`ln -s ${ABSPATH}/dircolors ~/.dircolors`
