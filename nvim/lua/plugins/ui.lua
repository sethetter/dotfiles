return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    config = function()
      require("bufferline").setup({})
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup({
        hijack_netrw = true,
        disable_netrw = true,
        hijack_directories = {
          enable = true,
        },
        view = {
          width = 45,
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {
      warn_no_results = false,
      open_no_results = true,
      auto_preview = false,
      modes = {
        diagnostics = {
          focus = true,
          format = "{severity_icon} {message:md} {item.source} {code} {pos}",
        },
        lsp_references = {
          -- some modes are configurable, see the source code for more details
          params = {
            include_declaration = false,
          },
        },
        lsp_document_symbols = {
          focus = true,
          win = {
            position = "right",
            size = 45,
          },
          format = "{kind_icon} {symbol.name}",
        },
      },
    },
    cmd = "Trouble",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "akinsho/toggleterm.nvim",
  },
  {
    "junegunn/goyo.vim",
  },
  {
    "folke/which-key.nvim",
    opts = {},
  },
}
