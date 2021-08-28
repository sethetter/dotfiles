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

  programs.broot = {
    enable = true;
    enableZshIntegration = true;
    # skin = "Solarized (light)";
    skin = {
      default = "rgb(101, 123, 131) rgb(253, 246, 227) / rgb(147, 161, 161) rgb(238, 232, 213)";
      tree = "rgb(147, 161, 161) none";
      file = "none none";
      directory = "rgb(38, 139, 210) none bold";
      exe = "rgb(211, 1, 2) none";
      link = "rgb(211, 54, 130) none";
      pruning = "rgb(147, 161, 161) none italic";
      perm__ = "rgb(147, 161, 161) none";
      perm_r = "none none";
      perm_w = "none none";
      perm_x = "none none";
      owner = "rgb(147, 161, 161) none";
      group = "rgb(147, 161, 161) none";
      sparse = "none none";
      git_branch = "rgb(88, 110, 117) none";
      git_insertions = "rgb(133, 153, 0) none";
      git_deletions = "rgb(211, 1, 2) none";
      git_status_current = "none none";
      git_status_modified = "rgb(181, 137, 0) none";
      git_status_new = "rgb(133, 153, 0) none";
      git_status_ignored = "rgb(147, 161, 161) none";
      git_status_conflicted = "rgb(211, 1, 2) none";
      git_status_other = "rgb(211, 1, 2) none";
      selected_line = "none rgb(238, 232, 213)";
      char_match = "rgb(133, 153, 0) none underlined";
      file_error = "rgb(203, 75, 22) none italic";
      flag_label = "none none";
      flag_value = "rgb(181, 137, 0) none bold";
      input = "none none";
      status_error = "rgb(203, 75, 22) rgb(238, 232, 213)";
      status_job = "rgb(108, 113, 196) rgb(238, 232, 213) bold";
      status_normal = "none rgb(238, 232, 213)";
      status_italic = "rgb(181, 137, 0) rgb(238, 232, 213)";
      status_bold = "rgb(88, 110, 117) rgb(238, 232, 213) bold";
      status_code = "rgb(108, 113, 196) rgb(238, 232, 213)";
      status_ellipsis = "none rgb(238, 232, 213)";
      scrollbar_track = "rgb(238, 232, 213) none";
      scrollbar_thumb = "none none";
      help_paragraph = "none none";
      help_bold = "rgb(88, 110, 117) none bold";
      help_italic = "rgb(88, 110, 117) none italic";
      help_code = "rgb(88, 110, 117) rgb(238, 232, 213)";
      help_headers = "rgb(181, 137, 0) none";
      help_table_border = "none none";
      preview_title = "rgb(147, 161, 161) rgb(238, 232, 213)";
      preview = "rgb(101, 123, 131) rgb(253, 246, 227) / rgb(147, 161, 161) rgb(238, 232, 213)";
      preview_line_number = "rgb(147, 161, 161) rgb(238, 232, 213)";
      preview_match = "None ansi(29)";
      staging_area_title = "gray(22) rgb(253, 246, 227)";
    };
  };

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
