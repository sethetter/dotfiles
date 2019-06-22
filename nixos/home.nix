{ config, pkgs, ... }:

with builtins;

{
  home.packages = [
    pkgs.ripgrep
    pkgs.jq
    pkgs.emacs
    pkgs.firefox
    pkgs.tmux
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Emacs
  # programs.emacs.enable = true;

  # Firefox
  programs.firefox = {
    enable = true;
  };

  home.keyboard.options = ["ctrl:nocaps"];

  home.file = {
    ".emacs.d" = {
      source = pkgs.fetchFromGitHub {
        owner = "syl20bnr";
        repo = "spacemacs";
        rev = "8c0b8c3";
        sha256 = "1af73ls0znbpx73ym9cx22yc6q1dvv375l493ccilg2xpjsgam6w";
      };
      recursive = true;
    };
    ".spacemacs".source = ~/dotfiles/nixos/spacemacs;

    ".tmux/plugins/tpm" = {
      source = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tpm";
        rev = "26d9ace";
        sha256 = "108a6giwn60n3y162wdpakpy2k8vs5bj46m4y1wj4p108k7rg1iq";
      };
    };

    ".tmux.conf".source = ~/dotfiles/nixos/tmux.conf;
    ".config/fish/config.fish".source = ~/dotfiles/nixos/config.fish;
  };
}
