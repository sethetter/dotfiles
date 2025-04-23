return {
  { "akinsho/bufferline.nvim", opts = {} },
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    config = function()
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      use_libuv_file_watcher = true,
      follow_current_file = { enabled = true },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        window = {
          mappings = {
            ["/"] = "noop", -- Disable filtering, I like to search on my own
            ["F"] = "fuzzy_finder",
            ["H"] = "noop", -- Conflicts with prev buffer
            ["I"] = "toggle_hidden",
          },
        },
      },
      sources = {
        "filesystem",
        "git_status",
        "document_symbols",
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
