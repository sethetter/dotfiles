sudo dnf install -y \
     fish \
     fzf \
     emacs \
     tmux

# Install oh-my-fish
curl -L https://get.oh-my.fish | fish

# Install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Link in the config files from this folder
${BASH_SOURCE%/*}/link-configs.sh
