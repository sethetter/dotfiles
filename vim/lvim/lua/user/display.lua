vim.opt.termguicolors = true

lvim.colorscheme = "everforest"
-- TODO: With this turned on, bufferline styling is broken
-- when opening lvim directory on a file or directory.
-- vim.g.everforest_better_performance = 1

lvim.builtin.lualine.options.theme = 'everforest'

lvim.builtin.bufferline.options.always_show_bufferline = true

---@diagnostic disable-next-line: undefined-field
vim.opt.fillchars:append { diff = "╱" }

vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = ""

-- Line wrapping for markdown and text files
function SetLineWrapForTextFiles(opts)
  -- Wrap lines for markdown and text files, or unset filetypes
  local ft = vim.bo[opts.buf].filetype
  if ft == "markdown" or ft == "text" then
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.wo.list = false
  else
    vim.wo.wrap = false
    vim.wo.linebreak = false
    vim.wo.list = true
  end
end

local myAuGroup = vim.api.nvim_create_augroup("MyGroup", { clear = true })
lvim.autocommands = {
  {
    "FileType", {
    pattern = { "*" },
    group = myAuGroup,
    callback = SetLineWrapForTextFiles
  }
  },
  { "BufAdd", {
    pattern = { "*" },
    group = myAuGroup,
    callback = SetLineWrapForTextFiles
  } },
}
