return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({
      hijack_netrw = true,
      disable_netrw = true,
      hijack_directories = {
        enable = true
      },
      view = {
        width = 45,
      },
    })
  end,
}
