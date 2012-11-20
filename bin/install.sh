#!/usr/bin/env bash

# Install symlinks for all of my dotfiles.
# Includes: Bash Profile, Sublime Text 2, Chrome Dev Tools theme, and irssi.

ABSPATH=$(cd "$(dirname "$0")"/..; pwd)

# Bash Profile
#-----------------------------------------------------------
`mv ~/.bash_profile ~/._bash_profilebackup`
`ln -s ${ABSPATH}/bash_profile ~/.bash_profile`

# Sublime Text 2
#-----------------------------------------------------------
`mv ~/Library/Application\ Support/Sublime\ Text\ 2 ~/Library/Application\ Support/_st2backup`
`ln -s ${ABSPATH}/sublime ~/Library/Application\ Support/Sublime\ Text\ 2`

# Irssi
#------------------------------------------------------------
`mv ~/.irssi ~/._irssibackup`
`ln -s ${ABSPATH}/irssi ~/.irssi`