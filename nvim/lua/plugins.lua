return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'vijaymarupudi/nvim-fzf'
  use { 'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons'
    }
  }

  use 'blackCauldron7/surround.nvim'

  use 'terrortylor/nvim-comment'
  use 'tpope/vim-surround'
  -- use '9mm/vim-closer'
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
    'tanvirtin/vgit.nvim', requires = { 'nvim-lua/plenary.nvim' }
  }

  require("surround").setup({ mappings_style = "sandwich" })

  require('vgit').setup()
  require('nvim_comment').setup()
  require('nvim-tree').setup()

  require('lualine').setup({
    options = {
      theme = 'solarized_light',
      section_separators = {'', ''},
      component_separators = {'', ''}
    }
  })

  -- LSP, etc
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
end)
