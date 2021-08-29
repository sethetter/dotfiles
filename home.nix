{ config, pkgs, ... }:
{
  # home-manager version
  home.stateVersion = "21.11";

  home.username = "sethetter";
  home.homeDirectory = "/Users/sethetter";

  programs.home-manager.enable = true;
  programs.zsh = import ./zsh.nix { inherit pkgs; };
  programs.neovim = import ./nvim/nvim.nix { inherit pkgs; };
  programs.tmux = import ./tmux/tmux.nix { inherit pkgs; };

  programs.git.enable = true;
  programs.gh.enable = true;

  programs.lazygit.enable = true;
  programs.lazygit.settings = {
    gui.theme = { lightTheme = true; };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    nix-direnv.enableFlakes = true;
  };

  programs.bat = {
    enable = true;
    config = { theme = "Solarized (light)"; };
  };

  programs.broot = import ./broot.nix { inherit pkgs; };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    ZSH_DISABLE_COMPFIX = "true";
  };

  home.packages = [
    pkgs.direnv
    pkgs.fd
    pkgs.ripgrep
    pkgs.nmap
    pkgs.delta # TODO: configure as part of programs.git
    pkgs.wget
    pkgs.curl

    # Non-free, or don't work on MacOS
    # ----------------
    # pkgs.firefox
    # pkgs.obsidian
    # pkgs.slack
    # pkgs.signal-desktop
  ];

  home.file = {
    # TODO: Use programs.git config instead
    ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink ./git/gitconfig;
    ".gitignore".source = config.lib.file.mkOutOfStoreSymlink ./git/gitignore;

    # ".vifm/colors/solarized-light".source = config.lib.file.mkOutOfStoreSymlink ./vifm/solarized-light.vifm;
    # ".vifm/vifmrc".source = config.lib.file.mkOutOfStoreSymlink ./vifm/vifmrc;
  };

  # TODO: obsidian config
  # TODO: font-iosevka-nerd-font (not available I think, could script download though?)
}
