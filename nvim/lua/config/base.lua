vim.opt.termguicolors = true

vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.clipboard = ""

-- Reserve a space in the gutter
vim.opt.signcolumn = "yes"

vim.opt.fillchars:append({ diff = "╱" })

-- Disable wrapping, except for buffers of certain filetype
vim.opt.wrap = false
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "gitlab", "avante", "trouble", "" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- vim.g.netrw_liststyle = 3