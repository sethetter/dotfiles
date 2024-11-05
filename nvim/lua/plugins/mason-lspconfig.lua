return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "folke/neoconf.nvim",
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        local disabled = require("neoconf").get(
          "servers." .. server_name .. ".disable"
        )
        if disabled then return end

        require("lspconfig")[server_name].setup({})
      end,
    })
  end,
}
