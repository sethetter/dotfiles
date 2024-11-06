return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "main",
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },
  { "nvim-treesitter", opts = {} },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        vim.cmd("colorscheme rose-pine-main")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd("colorscheme rose-pine-dawn")
      end,
    },
  }
}
