return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "klen/nvim-config-local",
    },
    config = function()
      local lspc = require("lspconfig")
      local lspconfig_defaults = lspc.util.default_config
      lspconfig_defaults.capabilities =
        vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())
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
          json = {
            require("formatter.defaults.prettier"),
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
          golang = {
            require("formatter.filetypes.go"),
          },
          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      })

      -- TODO: Turn this into a convenience function that you can
      -- enable or disable on a per-project and per-filetype basis.
      vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = "FormatAutogroup",
        pattern = "*",
        command = "FormatWrite",
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "jsonls",
          "vtsls",
          "denols",
          "eslint",
          "bashls",
          "rust_analyzer",
          "pylsp",
          "yamlls",
        },
      })

      function SetupLspHandlers()
        require("mason-lspconfig").setup_handlers({
          function(server_name)
            if LangServers[server_name] == false then
              return
            end
            require("lspconfig")[server_name].setup(LangServers[server_name] or {})
          end,
        })
      end

      -- Call this after loading local configs so the `LangServers` global
      -- can be modified in those configs as needed first.
      vim.api.nvim_create_autocmd("User", {
        pattern = "ConfigLocalFinished",
        callback = SetupLspHandlers,
      })
    end,
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
