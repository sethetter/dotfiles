return {
  { "github/copilot.vim" },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "codecompanion" },
        },
        ft = { "codecompanion" },
      },
    },
    config = true,
  },
}
