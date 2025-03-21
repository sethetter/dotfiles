return {
  { "akinsho/bufferline.nvim", opts = {} },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        window = {
          mappings = {
            ["/"] = "noop", -- Disable filtering, I like to search on my own
            ["F"] = "noop",
            ["H"] = "noop", -- Conflicts with prev buffer
          },
        },
      },
    },
  },
  {
    "stevearc/aerial.nvim",
    opts = {
      -- default starts with treesitter, but I like lsp
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
