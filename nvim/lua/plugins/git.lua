return {
  {
    "sindrets/diffview.nvim",
  },
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim",
      "nvim-tree/nvim-web-devicons",
      "rose-pine/neovim",
    },
    enabled = true,
    build = function()
      require("gitlab.server").build(true)
    end, -- Builds the Go binary
    config = function()
      require("gitlab").setup()
    end,
  },
  {
    "ruifm/gitlinker.nvim",
    opts = {
      mappings = nil,
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      diff_opts = {
        vertical = true,
      },
    },
  },
}
