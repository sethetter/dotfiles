vim.opt.termguicolors = true

vim.opt.relativenumber = true
vim.opt.number = true -- shows the current line number instead of 0

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.laststatus = 3

vim.opt.scrolloff = 0
vim.opt.smoothscroll = true

vim.opt.clipboard = ""

-- Reserve a space in the gutter
vim.opt.signcolumn = "yes"

vim.opt.fillchars:append({ diff = "╱" })

-- Disable wrapping, except for buffers of certain filetype
vim.opt.wrap = false
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "gitlab", "aichat", "qf", "" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- Set .avsc files to use json filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.avsc",
  command = "set filetype=json",
})
