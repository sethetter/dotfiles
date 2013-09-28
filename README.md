dotfiles
========

These are my personal dotfiles for my development environment on Mac OS.

Includes configuration files for:
- iTerm
- zsh (with oh-my-zsh)
- tmux
- vim
- git
- irssi

Install
-------

Run ```bin/install.sh``` to create backups of existing files and replace with symlinks to the files in this repository. No uninstall exists at the moment (I'll get to it eventually).

Tagbar for vim assumes that ctags is installed. Get that here: [ctags - http://ctags.sourceforge.net/](http://ctags.sourceforge.net/)

Currently I am using the "thayer2" iTerm color scheme.

Todos
-----
- Create uninstall task to replace symlinks with created backups
- Update bin/install.sh to work properly
- Switch vim modules to use NeoBundle
