return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "dawn",
      })
      vim.api.nvim_set_option_value("background", "light", {})
      vim.cmd("colorscheme rose-pine-dawn")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        -- Auto install parsers when entering a buffer if missing
        auto_install = true,
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
          "typescript",
        },
      })
    end,
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        -- vim.api.nvim_set_option_value("background", "dark", {})
        -- vim.cmd("colorscheme rose-pine-main")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd("colorscheme rose-pine-dawn")
      end,
    },
  },
}
