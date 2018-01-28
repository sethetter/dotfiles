#!/usr/bin/env bash

# Install symlinks for all of my dotfiles.
# Includes: Bash Profile, Vim, and irssi.


# TODO: Add tmux and powerline check/install here.

ABSPATH=$(cd "$(dirname "$0")"/..; pwd)

`git submodule init`
`git submodule update`

# Vim
#------------------------------------------------------------
`if [ ! -f ~/.vimrc ]; then mv ~/.vimrc ~/._vimrc.backup; fi`
`ln -s ${ABSPATH}/vimrc ~/.vimrc`

# Install NeoBundle for vim
`curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh`

# Tmux Config
#------------------------------------------------------------
`if [ ! -f ~/.tmux.conf ]; then mv ~/.tmux.conf ~/._tmux.conf.backup; fi`
`ln -s ${ABSPATH}/tmux.conf ~/.tmux.conf`

# Shell Files
#------------------------------------------------------------
`if [ ! -f ~/.bashrc ]; then mv ~/.bashrc ~/._bashrc.backup; fi`
`ln -s ${ABSPATH}/bashrc ~/.bashrc`
`if [ ! -f ~/.config/fish/config.fish ]; then mv ~/.config/fish/config.fish ~/.config/fish/_config.fish.backup; fi`
`ln -s ${ABSPATH}/config.fish ~/.config/fish/config.fish`


# Editor Config
#------------------------------------------------------------
`if [ ! -f ~/.editorconfig ]; then mv ~/.editorconfig ~/._editorconfig.backup; fi`
`ln -s ${ABSPATH}/editorconfig ~/.editorconfig`

# JSHint
#------------------------------------------------------------
`if [ ! -f ~/.jshintrc ]; then mv ~/.jshintrc ~/._jshintrc.backup; fi`
`ln -s ${ABSPATH}/jshintrc ~/.jshintrc`


# Git Files
#------------------------------------------------------------
`if [ ! -f ~/.gitconfig ]; then mv ~/.gitconfig ~/._gitconfig.backup; fi`
`ln -s ${ABSPATH}/gitconfig ~/.gitconfig`
`if [ ! -f ~/.gitignore ]; then mv ~/.gitignore ~/._gitignore.backup; fi`
`ln -s ${ABSPATH}/gitignore ~/.gitignore`

# Dir Colors
#------------------------------------------------------------
`if [ ! -f ~/.dircolors ]; then mv ~/.dircolors ~/.dircolors.backup; fi`
`ln -s ${ABSPATH}/dircolors ~/.dircolors`

# .editorconfig
#------------------------------------------------------------
`if [ ! -f ~/.editorconfig ]; then mv ~/.editorconfig ~/.editorconfig.backup; fi`
`ln -s ${ABSPATH}/editorconfig ~/.editorconfig`

# .editorconfig
#------------------------------------------------------------
`if [ ! -f ~/.ctags ]; then mv ~/.ctags ~/.ctags.backup; fi`
`ln -s ${ABSPATH}/ctags ~/.ctags`
