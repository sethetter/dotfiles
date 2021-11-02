return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'vijaymarupudi/nvim-fzf'
  use { 'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons'
    }
  }

  use 'terrortylor/nvim-comment'
  use '9mm/vim-closer'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use 'ishan9299/nvim-solarized-lua'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }
  }

  require('gitsigns').setup()
  require('nvim_comment').setup()
  require('nvim-tree').setup()

  -- LSP, etc
  -- use 'hrsh7th/nvim-compe'
  use 'neovim/nvim-lspconfig'

  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
end)
