require("config.lazy")
require("config.keys")

---@diagnostic disable-next-line: undefined-field
vim.opt.fillchars:append({ diff = "╱" })

vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = ""
vim.opt.wrap = false

-- Reserve a space in the gutter
vim.opt.signcolumn = "yes"

local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  callback = function()
    if vim.bo.filetype == "" then
      vim.opt_local.wrap = true
      vim.opt_local.linebreak = true
    end
  end,
})

-- TODO: Turn this into a convenience function that you can
-- enable or disable on a per-project and per-filetype basis.
vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]])

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   callback = function()
--     local mode = vim.api.nvim_get_mode().mode
--     -- local filetype = vim.bo.filetype
--     if vim.bo.modified == true and mode == 'n' then
--       vim.cmd('lua vim.lsp.buf.format()')
--     else
--     end
--   end
-- })
