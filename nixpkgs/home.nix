{ config, pkgs, ... }:

with builtins;

{
  home.packages = [
    pkgs.ripgrep
    pkgs.jq
    pkgs.emacs
    pkgs.firefox
    pkgs.fzf
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
    # Spacemacs
    # ".emacs.d" = {
    #   source = pkgs.fetchFromGitHub {
    #     owner = "syl20bnr";
    #     repo = "spacemacs";
    #     rev = "8c0b8c3";
    #     sha256 = "1af73ls0znbpx73ym9cx22yc6q1dvv375l493ccilg2xpjsgam6w";
    #   };
    #   recursive = true;
    # };
    ".spacemacs".source = ~/dotfiles/spacemacs;

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
    ".config/omf" = {
      source = ~/dotfiles/omf;
      recursive = true;
    };
    ".config/fish/config.fish".source = ~/dotfiles/config.fish;
  };
}
