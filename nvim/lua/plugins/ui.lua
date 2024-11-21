return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    config = function()
      require("bufferline").setup({})
    end,
  },
  {
    "tpope/vim-vinegar", -- netrw improved
  },
  {
    "stevearc/aerial.nvim",
    opts = {
      -- backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
      backends = { "lsp", "markdown", "asciidoc", "man" },
      filter_kind = false,
      layout = {
        max_width = { 40, 0.2 },
        min_width = 30,
      },
    },
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
