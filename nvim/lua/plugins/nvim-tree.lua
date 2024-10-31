return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require("nvim-tree").setup({})
    end,
}
