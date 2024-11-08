return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local lspc = require("lspconfig")
      local lspconfig_defaults = lspc.util.default_config
      lspconfig_defaults.capabilities =
        vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

      lspc.lua_ls.setup({})
      lspc.vtsls.setup({})
      lspc.eslint.setup({})
      lspc.jsonls.setup({})
      lspc.bashls.setup({})
      lspc.prismals.setup({})
      lspc.rust_analyzer.setup({})
      lspc.pylsp.setup({})
      lspc.spectral.setup({})
      lspc.yamlls.setup({})
    end,
  },
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          markdown = {
            require("formatter.defaults.prettier"),
          },
          javascript = {
            require("formatter.defaults.prettier"),
          },
          javascriptreact = {
            require("formatter.defaults.prettier"),
          },
          typescript = {
            require("formatter.defaults.prettier"),
          },
          typescriptreact = {
            require("formatter.defaults.prettier"),
          },
          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      })
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
