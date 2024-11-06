return {
  {
    "hrsh7th/nvim-cmp",
    opts = {},
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp"
    },
    opts = {},
  }
}
