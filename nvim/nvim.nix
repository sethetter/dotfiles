{ pkgs }:
let
  nvim-solarized-lua = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-solarized-lua";
    src = pkgs.fetchgit {
      url = "https://github.com/ishan9299/nvim-solarized-lua";
      sha256 = "032gs63g3x62mym6nhznvywsqk1cxsgwx0fv2vyh2c929fb27ji7";
    };
    meta.homepage = "https://github.com/ishan9299/nvim-solarized-lua";
  };

  nvim-comment = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-comment";
    src = pkgs.fetchgit {
      url = "https://github.com/terrortylor/nvim-comment";
      sha256 = "039fznaldf6lzk0yp51wi7p1j3l5rvhwryvk5s3lrq78lxq2rzn2";
    };
    buildPhase = "# skip the makefile";
    meta.homepage = "https://github.com//terrortylor/nvim-comment";
  };
in
{
  enable = true;
  viAlias = true;
  plugins = with pkgs.vimPlugins; [
    {
      plugin = gitsigns-nvim;
      config = "lua require('gitsigns').setup()";
    }
    # { plugin = "hrsh7th/nvim-compe"; }
    { plugin = nvim-treesitter; }
    { plugin = telescope-nvim; }
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
  ];

  extraConfig = (builtins.readFile ./init.vim);
}
