{ config, pkgs, ... }:

let
  nvim-solarized-lua = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-solarized-lua";
    src = pkgs.fetchgit {
      url = "https://github.com/ishan9299/nvim-solarized-lua";
      rev = "fa437ae65a6c1239525e4ec7f4cbf4671eaa55ba";
      sha256 = "032gs63g3x62mym6nhznvywsqk1cxsgwx0fv2vyh2c929fb27ji7";
    };
    meta.homepage = "https://github.com/ishan9299/nvim-solarized-lua";
  };

  nvim-comment = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-comment";
    src = pkgs.fetchgit {
      url = "https://github.com/terrortylor/nvim-comment";
      rev = "6363118acf86824ed11c2238292b72dc5ef8bdde";
      sha256 = "039fznaldf6lzk0yp51wi7p1j3l5rvhwryvk5s3lrq78lxq2rzn2";
    };
    buildPhase = "# skip the makefile";
    meta.homepage = "https://github.com//terrortylor/nvim-comment";
  };

  fzf-lua = pkgs.vimUtils.buildVimPlugin {
    name = "fzf-lua";
    src = pkgs.fetchgit {
      url = "https://github.com/ibhagwan/fzf-lua";
      rev = "82a477420d34e6d8611d6b02ba1edb58c6e4ee2b";
      sha256 = "12glahin6cv451khcpy7l4415pp2hhky5v2dyy6rbahmmxi2ijpr";
    };
    meta.homepage = "https://github.com/ibhagwan/fzf-lua";
  };
  nvim-fzf = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-fzf";
    src = pkgs.fetchgit {
      url = "https://github.com/vijaymarupudi/nvim-fzf";
      rev = "8905eeea65b5b92ce0eff434a016e7e2fb4a615d";
      sha256 = "0ja7hz55f706zdw5ngcn58fyjfamsg266mzkgawbydgpilvwf1mj";
    };
    meta.homepage = "https://github.com/vijaymarupudi/nvim-fzf";
  };
in
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
    pkgs.direnv
    pkgs.fd
    pkgs.git
    pkgs.ripgrep
    pkgs.tig
    pkgs.nmap
    pkgs.rnix-lsp
    pkgs.delta # TODO: configure as part of programs.git
    pkgs.wget
    # pkgs.vifm

    # Non-free, or don't work on MacOS
    # ----------------
    # pkgs.firefox
    # pkgs.obsidian
    # pkgs.slack
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    nix-direnv.enableFlakes = true;
  };

  # TODO: Migrate nvim config to nix in it's own module, call from here
  programs.neovim = {
    enable = true;
    viAlias = true;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = gitsigns-nvim;
        config = "lua require('gitsigns').setup()";
      }
      { plugin = nvim-fzf; }
      { plugin = fzf-lua; }

      {
        plugin = nvim-comment;
        config = "lua require('nvim_comment').setup()";
      }
      { plugin = vim-closer; }
      { plugin = nvim-tree-lua; }

      { plugin = nvim-web-devicons; }
      { plugin = nvim-solarized-lua; }
      { plugin = lualine-nvim; }

      { plugin = nvim-lspconfig; }
      { plugin = vim-nix; }

      # Not sure on these yet
      # { plugin = "hrsh7th/nvim-compe"; }
      # { plugin = "nvim-telescope/telescope.nvim"; }
      # { plugin = "mfussenegger/nvim-dap"; }
      # { plugin = "simrat39/rust-tools.nvim"; }
    ];

    extraConfig = (builtins.readFile ./nvim/init.vim);
  };

  programs.tmux = {
    enable = true;
    extraConfig = (builtins.readFile ./tmux.conf);
  };

  programs.bat = {
    enable = true;
    config = { theme = "Solarized (light)"; };
  };

  programs.gh.enable = true;

  programs.zsh = {
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
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    ZSH_DISABLE_COMPFIX = "true";
  };

  home.file = {
    ".tigrc".source = config.lib.file.mkOutOfStoreSymlink ./tigrc;

    # TODO: Use programs.git config instead
    ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink ./git/gitconfig;
    ".gitignore".source = config.lib.file.mkOutOfStoreSymlink ./git/gitignore;

    # ".vifm/colors/solarized-light".source = config.lib.file.mkOutOfStoreSymlink ./vifm/solarized-light.vifm;
    # ".vifm/vifmrc".source = config.lib.file.mkOutOfStoreSymlink ./vifm/vifmrc;
  };

  # TODO: obsidian config
  # TODO: font-iosevka-nerd-font (not available I think, could script download though?)
}
