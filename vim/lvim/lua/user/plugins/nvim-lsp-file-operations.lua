-- Ensures LSP functions are utilized when performing filesystem operations
-- on your codebase. e.g., updating imports after moving or renaming a file.
return {
  "antosha417/nvim-lsp-file-operations",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neo-tree/neo-tree.nvim",
  },
  config = function()
    require("lsp-file-operations").setup()
  end,
}
