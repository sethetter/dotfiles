{ config, pkgs, ... }:

with import <nixpkgs> {};
with builtins;
with lib;
with import <home-manager/modules/lib/dag.nix> { inherit lib; };

{
  home.packages = [
    # TODO: Need a newer vim version for govim :(
    pkgs.vim_configurable
    pkgs.tmux
    pkgs.ripgrep
    pkgs.jq
    pkgs.fzf
    pkgs.firefox
		pkgs.docker
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Firefox
  programs.firefox = {
    enable = true;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      https-everywhere
      # TODO: use rycee/firefox-addon-generator to make these
      # lastpass
      # vimium
    ];
  };

  home.keyboard.options = ["ctrl:nocaps"];

  home.file = {
    # Fish + omf
    ".omf" = {
      source = pkgs.fetchFromGitHub {
        owner = "oh-my-fish";
        repo = "oh-my-fish";
        rev = "v6";
        sha256 = "0wcl4vhk8hyhnyvxxlff9lcagqav67xjs4pzax5aibazdki291yb";
      };
      recursive = true;
    };
    ".config/fish/config.fish".source = ~/dotfiles/config.fish;
    ".config/omf/bundle".source = ~/dotfiles/omf/bundle;
    ".config/omf/channel".source = ~/dotfiles/omf/channel;
    ".config/omf/theme".source = ~/dotfiles/omf/theme;
    ".config/fish/conf.d/omf.fish".source = ''
      # Path to Oh My Fish install.
      set -q XDG_DATA_HOME
        and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
          or set -gx OMF_PATH "$HOME/.local/share/omf"

          # Load Oh My Fish configuration.
          source $OMF_PATH/init.fish
    '';

    ".vimrc".source = ~/dotfiles/vimrc;
    ".vimrc.min".source = ~/dotfiles/vimrc.min;
    ".vim/autoload/plug.vim" = {
      source = pkgs.fetchUrl {
        url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
        sha256 = "76bed66a9b83b34f9261b0894c8ae4857d177ceec4f7dc30de21d9905b59d7de";
      };
    };

    ".tmux.conf".source = ~/dotfiles/tmux.conf;
  };

  # TODO: get omf pulled in from here
  home.activation.installAndLinkNonNixManaged = dagEntryAfter [ "writeBoundary" ] ''
    # rm -rf $HOME/.config/omf
    # ln -sf $HOME/dotfiles/omf $HOME/.config/omf
    omf update
  '';
}