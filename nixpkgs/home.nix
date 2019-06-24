{ config, pkgs, ... }:

with import <nixpkgs> {};
with builtins;
with lib;
with import <home-manager/modules/lib/dag.nix> { inherit lib; };

{
  home.packages = [
    # TODO: Need a newer vim version for govim :(
    pkgs.vim
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
    # ".omf" = {
    #   source = pkgs.fetchFromGitHub {
    #     owner = "oh-my-fish";
    #     repo = "oh-my-fish";
    #     rev = "v6";
    #     sha256 = "0wcl4vhk8hyhnyvxxlff9lcagqav67xjs4pzax5aibazdki291yb";
    #   };
    #   recursive = true;
    # };
    # ".config/omf" = {
    #   source = ~/dotfiles/omf;
    #   recursive = true;
    # };
    ".config/fish/config.fish".source = ~/dotfiles/config.fish;
    ".vimrc".source = ~/dotfiles/vimrc;
    ".vimrc.min".source = ~/dotfiles/vimrc.min;
    ".tmux.conf".source = ~/dotfiles/tmux.conf;
  };

  # TODO: get omf pulled in from here
  # home.activation.installAndLinkNonNixManaged = dagEntryAfter [ "writeBoundary" ] ''
  #   rm -rf $HOME/.config/omf
  #   ln -sf $HOME/dotfiles/omf $HOME/.config/omf
  # '';
}
