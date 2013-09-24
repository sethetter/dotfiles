dotfiles
========

These are my personal dotfiles for my development environment on Mac OS.

Includes configuration files for:
- Vim
- iTerm
- Irssi
- Chrome Dev Tools
- bash_profile
- tmux
- Powerline
- git
- zsh (with oh-my-zsh)

Install
-------

Run ```bin/install.sh``` to create backups of existing files and replace with symlinks to the files in this repository. No uninstall exists at the moment (I'll get to it eventually).

Part of the ```.bash_profile``` is to print git information to the command prompt. For this to work you will need to install [vcprompt](https://github.com/djl/vcprompt). Run these commands to get it installed:

  $ curl -sL https://github.com/djl/vcprompt/raw/master/bin/vcprompt > ~/bin/vcprompt
  $ chmod 755 ~/bin/vcprompt

The vim powerline plugin requires a patched font to display certain special symbols. For some available patched fonts, visit the [powerline-fonts repo](https://github.com/Lokaltog/powerline-fonts).

The powerline utitlity is used in both vim and tmux. To install the universal package that works with both of them run the following commands. (OS X only)

	$ brew install python
	$ pip install --user git+git://github.com/Lokaltog/powerline
	$ brew install macvim --env-std --override-system-vim

To install tmux (assumes hombrew is present):

	$ brew link pkg-config && brew install tmux

Tagbar for vim assumes that ctags is installed. Get that here: [ctags - http://ctags.sourceforge.net/](http://ctags.sourceforge.net/)

Currently I am using the "thayer2" iTerm color scheme.

Todos
-----
- Create uninstall task to replace symlinks with created backups
- Update bin/install.sh to work properly