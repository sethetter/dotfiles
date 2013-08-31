. /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias tmux='tmux -2'

[[ -s /root/.nvm/nvm.sh ]] && . /root/.nvm/nvm.sh # This loads NVM
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Customize to your needs...
export PATH=$PATH:/home/seth/.nvm/v0.10.15/bin:/home/seth/.rvm/gems/ruby-2.0.0-p247/bin:/home/seth/.rvm/gems/ruby-2.0.0-p247@global/bin:/home/seth/.rvm/rubies/ruby-2.0.0-p247/bin:/home/seth/.rvm/bin:/opt/local/bin:/opt/local/sbin:/home/seth/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/Users/sethe/stuff/adt-bundle-mac/sdk/platform-tools:/Users/sethe/stuff/adt-bundle-mac/sdk/tools:/usr/local/lib/python2.7/site-packages:/usr/local/share/python:/home/seth/.ec2/bin:/usr/local/mongodb/bin
