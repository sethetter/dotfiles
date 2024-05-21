-- Disable some core LunarVim plugins
lvim.builtin.lir.active = false
lvim.builtin.nvimtree.active = false
lvim.builtin.project.active = false

lvim.plugins = {
  { "sainnhe/everforest" },
  { "tpope/vim-surround" },
  { "rickhowe/diffchar.vim" },
  { "rhysd/conflict-marker.vim" },
  { "sindrets/diffview.nvim" },
  require("user.plugins.outline"),
  require("user.plugins.nvim-lsp-file-operations"),
  require("user.plugins.neo-tree"),
  require("user.plugins.refactoring"),
  require("user.plugins.vim-gist"),
  require("user.plugins.copilot"),
  require("user.plugins.vim-ai"),
}
