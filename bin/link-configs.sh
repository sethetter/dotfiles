#!/usr/bin/env bash

# Install symlinks for all of my dotfiles.
# Includes: Bash Profile, Vim, and irssi.


# TODO: Add tmux and powerline check/install here.

ABSPATH=$(cd "$(dirname "$0")"/.. || exit; pwd)

# Link vim config
#------------------------------------------------------------
if [ ! -f ~/.vimrc ]; then mv ~/.vimrc ~/.vimrc.backup; fi
ln -s "${ABSPATH}/vimrc" ~/.vimrc

# Link vifm config
#------------------------------------------------------------
if [ ! -f ~/.vifm/vifmrc ]; then mv ~/.vifm/vifmrc ~/.vifm/vifmrc.backup; fi
ln -s "${ABSPATH}/vifmrc" ~/.vifm/vifmrc
mkdir -p ~/.vifm/colors && cp $ABSPATH/vifm/solarized-light.vifm ~/.vifm/colors/solarized-light

# Link CoC settings
#------------------------------------------------------------
if [ ! -f ~/.vim/coc-settings.json ]; then mv ~/.vim/coc-settings.json ~/.vim/coc-settings.json.backup; fi
ln -s "${ABSPATH}/coc-settings.json" ~/.vim/coc-settings.json

# Link tmux config
#------------------------------------------------------------
if [ ! -f ~/.tmux.conf ]; then mv ~/.tmux.conf ~/._tmux.conf.backup; fi
ln -s "${ABSPATH}/tmux.conf" ~/.tmux.conf

# Link bash config
#------------------------------------------------------------
if [ ! -f ~/.bashrc ]; then mv ~/.bashrc ~/._bashrc.backup; fi
ln -s "${ABSPATH}/bashrc" ~/.bashrc

# Link fish and oh-my-fish config
#------------------------------------------------------------
if [ ! -f ~/.config/fish/config.fish ]; then mv ~/.config/fish/config.fish ~/.config/fish/_config.fish.backup; fi
ln -s "${ABSPATH}/config.fish" ~/.config/fish/config.fish
if [ ! -f ~/.config/omf ]; then mv ~/.config/omf ~/.config/_omf.backup; fi
ln -s "${ABSPATH}/omf" ~/.config/omf

# Git Files
#------------------------------------------------------------
if [ ! -f ~/.gitconfig ]; then mv ~/.gitconfig ~/._gitconfig.backup; fi
ln -s "${ABSPATH}/gitconfig" ~/.gitconfig
if [ ! -f ~/.gitignore ]; then mv ~/.gitignore ~/._gitignore.backup; fi
ln -s "${ABSPATH}/gitignore" ~/.gitignore
