#!/usr/bin/env bash

main() {
  set() {
    local option=$1
    local value=$2
    tmux set-option -gq "$option" "$value"
  }

  setw() {
    local option=$1
    local value=$2
    tmux set-window-option -gq "$option" "$value"
  }

  # --> Everforest Light Medium
  if [[ $(cat ~/.theme 2> /dev/null) == "light" ]]; then
    set '@colors-solarized' 'light'
  else
    set '@colors-solarized' 'dark'
  fi
}

main
