dotfiles
========

These are my personal dotfiles for my development environment on Mac OS.

Includes configuration files for:
- iTerm
- Sublime Text 2
- Irssi
- Chrome Dev Tools
- bash_profile

Install
-------

Run ```bin/install.sh``` to create backups of existing files and replace with symlinks to the files in this repository. No uninstall exists at the moment (I'll get to it eventually).

Part of the ```.bash_profile``` is to print git information to the command prompt. For this to work you will need to install [vcprompt](https://github.com/djl/vcprompt).

The vim powerline plugin requires a patched font to display certain special symbols. For some available patched fonts, visit the [powerline-fonts repo](https://github.com/Lokaltog/powerline-fonts).

Todos
-----
- Create uninstall task to replace symlinks with created backups
- Update bin/install.sh to work properly