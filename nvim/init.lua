require("config.lazy")
require("config.keys")

---@diagnostic disable-next-line: undefined-field
vim.opt.fillchars:append { diff = "╱" }

vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = ""

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'


local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({}),
})
