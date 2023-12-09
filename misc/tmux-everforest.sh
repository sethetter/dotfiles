#!/usr/bin/env bash

# ----------------------------------------------------
# Source: https://github.com/bobcats/everforest-tmux
# ----------------------------------------------------

# Old Status Bar
# # -------------------------------------------------
# set -g window-status-separator "  "
# setw -g clock-mode-colour yellow
# set -g status-justify centre
# set -g status-left-length 40
# set -g status-left ' #(if [ "$SSH_CONNECTION" ] then echo "☎ | "; fi)#[fg=green]#S #[default]#I:#P #[default]'
# set -g status-right '#[fg=green]#H #[default]| #[fg=green]%m/%d/%y #[default]| #[fg=green]%I:%M '

main() {
  get-tmux-option() {
    local option value default
    option="$1"
    default="$2"
    value="$(tmux show-option -gqv "$option")"

    if [ -n "$value" ]; then
      echo "$value"
    else
      echo "$default"
    fi
  }

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
  thm_bg_dim="#efebd4"
  thm_bg0="#fdf6e3"
  thm_bg1="#f4f0d9"
  thm_bg2="#efebd4"
  thm_bg3="#e6e2cc"
  thm_bg4="#e0dcc7"
  thm_bg5="#bdc3af"
  thm_bg_visual="#eaedc8"
  thm_bg_red="#fbe3da"
  thm_bg_green="#f0f1d2"
  thm_bg_blue="#e9f0e9"
  thm_bg_yellow="#faedcd"

  thm_fg="#5c6a72"
  thm_red="#f85552"
  thm_orange="#f57d26"
  thm_yellow="#dfa000"
  thm_green="#8da101"
  thm_aqua="#35a77c"
  thm_blue="#3a94c5"
  thm_purple="#df69ba"
  thm_grey0="#a6b0a0"
  thm_grey1="#939f91"
  thm_grey2="#829181"
  thm_statusline1="#93b259"
  thm_statusline2="#708089"
  thm_statusline3="#e66868"

  thm_primary_bg=$thm_bg1

  set status "on"
  set status-bg "${thm_primary_bg}"
  set status-justify "left"
  set status-left-length "100"
  set status-right-length "100"

  # messages
  set message-style "fg=${thm_aqua},bg=${thm_bg2},align=centre"
  set message-command-style "fg=${thm_aqua},bg=${thm_bg2},align=centre"

  # panes
  set pane-border-style "fg=${thm_bg2}"
  set pane-active-border-style "fg=${thm_blue}"

  # windows
  setw window-status-activity-style "fg=${thm_fg},bg=${thm_bg0},none"
  setw window-status-separator ""
  setw window-status-style "fg=${thm_fg},bg=${thm_bg0},none"

  # --------=== Statusline

  # These variables are the defaults so that the setw and set calls are easier to parse.
  readonly show_directory="#[fg=$thm_green,bg=$thm_primary_bg,nobold,nounderscore,noitalics]🭦#[fg=$thm_bg0,bg=$thm_green,nobold,nounderscore,noitalics]     #[fg=$thm_fg,bg=$thm_bg2] #{b:pane_current_path} #{?client_prefix,#[fg=$thm_red]"
  readonly show_session="#[bg=$thm_green,fg=$thm_bg0] 🤘 #S  #[fg=$thm_green,bg=$thm_primary_bg]🭀"
  readonly show_window_in_window_status="#[fg=$thm_grey1,bg=$thm_primary_bg] #W #[fg=$thm_bg0,bg=$thm_blue] #I #[fg=$thm_blue,bg=$thm_primary_bg]🭀#[fg=$thm_fg,bg=$thm_primary_bg,nobold,nounderscore,noitalics]"
  readonly show_window_in_window_status_current="#[fg=$thm_fg,bg=$thm_primary_bg] #W #[fg=$thm_bg0,bg=$thm_orange] #I #[fg=$thm_orange,bg=$thm_primary_bg]🭀#[fg=$thm_fg,bg=$thm_primary_bg,nobold,nounderscore,noitalics]"

  local left_column1=$show_session
  local right_column1=$show_directory

  # Window status by default shows the current directory basename.
  local window_status_format=$show_window_in_window_status
  local window_status_current_format=$show_window_in_window_status_current

  set status-left "${left_column1}"
  set status-right "${right_column1}"

  setw window-status-format "${window_status_format}"
  setw window-status-current-format "${window_status_current_format}"

  # --------=== Modes
  #
  setw clock-mode-colour "${thm_blue}"
  setw mode-style "fg=${thm_purple} bg=${thm_bg3} bold"
}

main
