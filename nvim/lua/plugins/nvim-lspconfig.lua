return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig_defaults = require("lspconfig").util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      "force",
      lspconfig_defaults.capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    require("lspconfig").vtsls.setup({})
    require("lspconfig").eslint.setup({})
    require("lspconfig").gitlab_ci_ls.setup({})
    require("lspconfig").spectral.setup({})
    require("lspconfig").yamlls.setup({})
    require("lspconfig").lua_ls.setup({})
  end,
}
