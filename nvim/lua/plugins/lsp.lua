return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local lspc = require("lspconfig")
      local lspconfig_defaults = lspc.util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lspconfig_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )
      lspc.lua_ls.setup({})
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {},
  },
  {
    "prisma/vim-prisma",
  },
}
