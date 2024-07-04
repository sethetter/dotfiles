{ config, pkgs, ... }:

{
  home.username = "sethetter";
  home.homeDirectory = "/Users/sethetter";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  programs.fd.enable = true;

  # programs.zsh = {
  #   enable = true;
  #   oh-my-zsh = {
  #     enable = true;
  #     theme = "robbyrussell";
  #     plugins = [
  #       "git"
  #       "vi-mode"
  #       "fzf"
  #       "asdf"
  #     ];
  #   };
  # };

  programs.tmux = {
    enable = true;
    shortcut = "a";
    escapeTime = 10;
    baseIndex = 1;
    terminal = "alacritty";
    keyMode = "vi";
    sensibleOnTop = true;
    tmuxp.enable = true;

    plugins = with pkgs; [
      tmuxPlugins.sessionist
      tmuxPlugins.yank
      tmuxPlugins.tmux-fzf
      tmuxPlugins.pain-control
    ];

    extraConfig = ''
      set -g renumber-windows on

      setw -g monitor-activity on
      set -g visual-activity off

      set -g window-status-separator "  "
      set -g status-justify centre
      set -g status-left-length 40
      set -g status-style 'fg=green,none'
      set -g window-status-format ' #I #W #F '
      set -g window-status-current-style 'fg=darkgreen,bold'
      set -g window-status-activity-style 'default,default,default'
      set -g status-left ' 🤘 #[bold]#S #[default]#I:#P '
      set -g status-right '#H | %m/%d/%y | %I:%M '

      bind-key -n C-Space resize-pane -Z

      # Saner splitting.
      bind v split-window -h -l 50%
      bind s split-window -v -l 50%

      # Better name management
      bind c new-window
      bind , command-prompt "rename-window '%%'"
    '';
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    htop-vim
    jujutsu
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sethetter/etc/profile.d/hm-session-vars.sh
  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
