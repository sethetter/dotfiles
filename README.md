dotfiles
========

These are my personal dotfiles for my development environment on Mac OS.

Includes configuration files for:
- iTerm
- zsh (with oh-my-zsh)
- editorconfig (with js-beautify options)
- tmux
- vim
- git
- irssi

Install
-------

I use [NeoBundle](https://github.com/Shougo/neobundle.vim) for vim bundles. This needs to be installed first with the following command.

    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

Tagbar for vim assumes that ctags is installed. Get that here: [ctags - http://ctags.sourceforge.net/](http://ctags.sourceforge.net/)

Currently I am using the "thayer2" iTerm color scheme.

I have an install script, but it needs updating. Don't use it :)

Also, install [doctorjs](https://github.com/mozilla/doctorjs)

Todos
-----
- Create uninstall task to replace symlinks with created backups
