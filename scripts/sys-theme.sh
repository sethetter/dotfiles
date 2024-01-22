#!/usr/bin/env bash

function sync_theme() {
  local tmux='/opt/homebrew/bin/tmux'

  local alacritty_config_file=$HOME/.config/alacritty/alacritty.toml
  local alacritty_themes_folder=$HOME/.config/alacritty/themes/themes/
  local alacritty_theme_file=$HOME/.config/alacritty/theme.toml

  # check if $HOME/.theme exists, if not, create it
  if [[ ! -f $HOME/.theme ]]; then
    touch $HOME/.theme
  fi

  local prev=$(cat $HOME/.theme)

  if [[ $(defaults read -g AppleInterfaceStyle 2> /dev/null) == "Dark" ]]; then
    if [[ $prev != "dark" ]]; then
      echo -e "dark" > $HOME/.theme

      rm $alacritty_theme_file && \
        ln -s $alacritty_themes_folder/everforest_dark.toml $alacritty_theme_file
      touch $alacritty_config_file

      $tmux source $HOME/.tmux.conf
    fi
  else
    if [[ $prev != "light" ]]; then
      echo -e "light" > $HOME/.theme

      touch $alacritty_theme_file
      rm $alacritty_theme_file && \
        ln -s $alacritty_themes_folder/everforest_light.toml $alacritty_theme_file

      touch $alacritty_config_file

      $tmux source $HOME/.tmux.conf
    fi
  fi
}

sync_theme
for i in {1..19}; do
  sync_theme
  sleep 3
done
