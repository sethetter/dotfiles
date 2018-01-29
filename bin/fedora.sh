sudo dnf install -y \
     fish \
     fzf \
     emacs \
     tmux

# Install fisher
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

# Install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Link in the config files from this folder
${BASH_SOURCE%/*}/link-configs.sh
