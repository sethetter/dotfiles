-- Disable some core LunarVim plugins
lvim.builtin.lir.active = false
lvim.builtin.nvimtree.active = false

lvim.plugins = {
  { "sainnhe/everforest" },
  { "tpope/vim-surround" },
  { "rhysd/conflict-marker.vim" },
  { "rickhowe/diffchar.vim" },
  { "sindrets/diffview.nvim" },
  require("user.plugins.outline"),
  require("user.plugins.nvim-lsp-file-operations"),
  require("user.plugins.neo-tree"),
  require("user.plugins.refactoring"),
  require("user.plugins.vim-gist"),
  require("user.plugins.zen-mode"),
  require("user.plugins.copilot"),
  require("user.plugins.vim-ai"),
  require("user.plugins.transparent"),
}
