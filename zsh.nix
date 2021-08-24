{ pkgs }:
{
  enable = true;
  enableSyntaxHighlighting = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  initExtraFirst = ''
    alias gdc="git diff --cached"
    alias tma="tmux a"
    alias dc="docker compose"
    alias hmb="home-manager build"
    alias hms="home-manager switch"
    alias lg="lazygit"

    function tm {
      rootdir=$(pwd)
      if [ ! -z "$1" ]; then
        rootdir=$1
      fi
      cd $rootdir
      tmux new-session -A -s "''${rootdir##*/}"
    }

    . /Users/sethetter/.nix-profile/etc/profile.d/nix.sh
  '';
  localVariables = {
    EDITOR = "nvim";
  };

  oh-my-zsh = {
    enable = true;
    theme = "robbyrussell";
    plugins = [
      "git"
      "vi-mode"
      # TODO: some way to know i'm in a nix shell?
    ];
  };
}
