vim.opt.termguicolors = true

lvim.colorscheme = "everforest"
vim.g.everforest_background = "hard"
vim.g.everforest_transparent_background = 1
vim.g.everforest_better_performance = 1

lvim.builtin.lualine.options.theme = 'everforest'
lvim.builtin.bufferline.options.separator_style = "thin"
lvim.builtin.bufferline.options.always_show_bufferline = true

-- Remove neotree background color
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })

---@diagnostic disable-next-line: param-type-mismatch
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
