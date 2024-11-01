return {
  "folke/trouble.nvim",
  opts = {
    warn_no_results = false,
    open_no_results = true,
    auto_preview = false,
    modes = {
      diagnostics = {
        format = "{severity_icon} {message:md} {item.source} {code} {pos}",
      },
      lsp_references = {
        -- some modes are configurable, see the source code for more details
        params = {
          include_declaration = false,
        },
      },
      lsp_document_symbols = {
        win = {
          position = "right",
          size = 45,
        },
        format = "{kind_icon} {symbol.name}",

      },
    },
  },
  cmd = "Trouble",
}
