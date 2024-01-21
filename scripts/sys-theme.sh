#!/usr/bin/env bash

alacritty_config_file=$HOME/.config/alacritty/alacritty.toml
alacritty_theme_file=$HOME/.config/alacritty/theme.toml

if [[ $(defaults read -g AppleInterfaceStyle 2> /dev/null) == "Dark" ]]
then
  echo "dark" > $HOME/.theme

  rm $alacritty_theme_file && \
    ln -s $HOME/.config/alacritty/themes/themes/everforest_dark.toml $alacritty_theme_file
  touch $alacritty_config_file
else
  echo "light" > $HOME/.theme

  rm $alacritty_theme_file && \
    ln -s $HOME/.config/alacritty/themes/themes/everforest_light.toml $alacritty_theme_file
  touch $alacritty_config_file
fi
