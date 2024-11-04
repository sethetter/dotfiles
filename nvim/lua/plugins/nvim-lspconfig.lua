return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/neoconf.nvim",
  },
  config = function()
    local lspc = require("lspconfig")
    local lspconfig_defaults = lspc.util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      "force",
      lspconfig_defaults.capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    lspc.vtsls.setup({})
    lspc.eslint.setup({})
    lspc.prismals.setup({})

    lspc.denols.setup({
      settings = { deno = { enabled = false } },
    })

    lspc.gitlab_ci_ls.setup({})

    lspc.spectral.setup({})

    lspc.yamlls.setup({})

    lspc.lua_ls.setup({})
  end,
}
