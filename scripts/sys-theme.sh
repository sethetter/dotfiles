#!/usr/bin/env bash

function sync_theme() {
  local alacritty_config_file=$HOME/.config/alacritty/alacritty.toml
  local alacritty_theme_file=$HOME/.config/alacritty/theme.toml

  local prev=$(cat $HOME/.theme)

  if [[ $(defaults read -g AppleInterfaceStyle 2> /dev/null) == "Dark" ]]
  then
    if [[ $prev != "dark" ]]
    then
      echo -e "dark" > $HOME/.theme

      rm $alacritty_theme_file && \
        ln -s $HOME/.config/alacritty/themes/themes/everforest_dark.toml $alacritty_theme_file
      touch $alacritty_config_file

      tmux source $HOME/.tmux.conf
    fi
  else
    if [[ $prev != "light" ]]
    then
      echo -e "light" > $HOME/.theme

      rm $alacritty_theme_file && \
        ln -s $HOME/.config/alacritty/themes/themes/everforest_light.toml $alacritty_theme_file
      touch $alacritty_config_file

      tmux source $HOME/.tmux.conf
    fi
  fi
}

for i in {1..20}; do
  sync_theme
  sleep 3
done
