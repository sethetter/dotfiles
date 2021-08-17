{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "sethetter";
  home.homeDirectory = "/Users/sethetter";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  home.packages = [
    pkgs.tmux
    pkgs.direnv
    pkgs.bat
    pkgs.fd
    pkgs.git
    pkgs.ripgrep
    pkgs.tig
    pkgs.neovim
    pkgs.fzf
    pkgs.nmap
    pkgs.rnix-lsp
    # pkgs.vifm

    # Non-free, or don't work on MacOS
    # ----------------
    # pkgs.firefox
    # pkgs.obsidian
    # pkgs.slack
  ];

  # TODO: Migrate nvim config to nix in it's own module, call from here
  # programs.neovim.enable = true;
  # programs.neovim.viAlias = true;

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "fzf"
        "vi-mode"
      ];
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    ZSH_DISABLE_COMPFIX = "true";
  };
  
  home.file = {
    ".config/nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink ./nvim/init.lua;
    ".config/nvim/lua".source = config.lib.file.mkOutOfStoreSymlink ./nvim/lua;

    ".tigrc".source = config.lib.file.mkOutOfStoreSymlink ./tigrc;
    ".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink ./tmux.conf;

    ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink ./git/gitconfig;
    ".gitignore".source = config.lib.file.mkOutOfStoreSymlink ./git/gitignore;

    # ".vifm/colors/solarized-light".source = config.lib.file.mkOutOfStoreSymlink ./vifm/solarized-light.vifm;
    # ".vifm/vifmrc".source = config.lib.file.mkOutOfStoreSymlink ./vifm/vifmrc;
  };
  
  # TODO: obsidian config
  # TODO: font-iosevka-nerd-font (not available I think, could script download though?)
}
