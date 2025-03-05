return {
  { "b0o/schemastore.nvim" },
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
          go = {
            function()
              return {
                exe = "goimports",
                stdin = true,
              }
            end,
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
      local function not_deno(_, bufn)
        local util = require("lspconfig.util")
        if util.root_pattern("deno.json", "deno.jsonc")(bufn) then
          return nil
        end
        return util.root_pattern("package.json", "tsconfig.json", ".git")(bufn)
      end
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "lua_ls",
          "jsonls",
          "vtsls",
          "eslint",
          "bashls",
          "rust_analyzer",
          "pylsp",
          "yamlls",
          "denols",
        },
      })
      LangServers.lua_ls = {
        settings = {
          Lua = { diagnostics = { globals = { "LangServers" } } },
        },
      }
      LangServers.vtsls = {
        root_dir = not_deno,
        single_file_support = false,
      }
      LangServers.eslint = {
        root_dir = not_deno,
        single_file_support = false,
      }
      LangServers.denols = {
        root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
      }
      LangServers.yamlls = {
        settings = {
          yaml = {
            -- Disable built in schema store stuff in favor of `schemastore` plugin
            schemaStore = { enable = false, url = "" },
            schemas = require("schemastore").yaml.schemas(),

            validate = true,
            completion = true,
            hover = true,
          },
        },
      }
      LangServers.jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      }
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
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
