return {
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({}),
      })
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
    },
    opts = {},
  },
}
