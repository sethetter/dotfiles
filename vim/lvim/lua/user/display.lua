lvim.colorscheme = "everforest"

vim.opt.termguicolors = true

lvim.builtin.lualine.options.theme = 'everforest'
lvim.builtin.lualine.options.section_separators = { left = '🭀', right = '🭦' }
lvim.builtin.bufferline.options.separator_style = "slope"

---@diagnostic disable-next-line: param-type-mismatch
vim.opt.fillchars:append { diff = "╱" }

vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = ""

-- Sync with the system theme in the background
function SyncTheme()
  local sys_theme_file = io.open("/Users/sethetter/.theme", "r")
  if sys_theme_file then
    local content = sys_theme_file:read "*a":gsub("%s+", "")
    sys_theme_file:close()
    if content == "dark" then
      vim.opt.background = "dark"
    else
      vim.opt.background = "light"
    end
  end
end

if _G.sync_theme_timer then
  _G.sync_theme_timer:stop()
  _G.sync_theme_timer:close()
  _G.sync_theme_timer = nil
end

_G.sync_theme_timer = vim.loop.new_timer()
sync_theme_timer:start(0, 1000, vim.schedule_wrap(function()
  SyncTheme()
end))

SyncTheme()

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
