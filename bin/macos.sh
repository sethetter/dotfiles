#!/usr/bin/env bash

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
  ripgrep

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
