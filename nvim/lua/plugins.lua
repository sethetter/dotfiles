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
    'tanvirtin/vgit.nvim', requires = { 'nvim-lua/plenary.nvim' }
  }

  require("surround").setup({ mappings_style = "sandwich" })

  require('vgit').setup()
  require('nvim_comment').setup()
  vim.cmd('let g:nvim_tree_quit_on_open =1 ')
  require('nvim-tree').setup({
    open_on_setup = true
  })

  require('lualine').setup({
    options = {
      theme = 'solarized_light',
      section_separators = {'', ''},
      component_separators = {'', ''}
    }
  })

  -- LSP, etc
  -- use 'hrsh7th/nvim-compe'
  use 'neovim/nvim-lspconfig'

  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
end)
