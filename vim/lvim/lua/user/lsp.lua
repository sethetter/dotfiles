lvim.format_on_save.enabled = true

-- Manually configured LSPs
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "json",
    },
  }
}

function TSRemoveUnusedImports()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.removeUnused.ts" },
      diagnostics = {},
    },
  })
end

vim.cmd [[command! TSRemoveUnusedImports :lua TSRemoveUnusedImports()]]
