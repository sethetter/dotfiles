#!/usr/bin/env bash

brew tap homebrew/cask-fonts
brew install \
  git \
  tmux \
  vim \
  vifm \
  neovim \
  fish \
  fzf \
  go \
  volta \
  rust \
  openconnect \
  oath-toolkit \
  pandoc \
  nmap \
  bat \
  ripgrep \
	font-iosevka-nerd-font

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
