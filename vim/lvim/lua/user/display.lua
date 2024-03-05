lvim.colorscheme = "everforest"

vim.opt.termguicolors = true

lvim.builtin.lualine.options.theme = 'everforest'
lvim.builtin.lualine.options.section_separators = { left = '🭀', right = '🭦' }
lvim.builtin.bufferline.options.separator_style = "slope"

-- Remove neotree background color
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })

---@diagnostic disable-next-line: param-type-mismatch
vim.opt.fillchars:append { diff = "╱" }

vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = ""

function SetTransparent()
  local transparent = require("transparent")
  transparent.setup({
    extra_groups = {
      "NeoTreeNormal",
      "NeoTreeNormalNC",
      "NormalFloat",
    }
  })
  transparent.clear_prefix("NeoTree")
end

-- Sync with the system theme in the background
function SyncTheme()
  local sys_theme_file = io.open("/Users/sethetter/.theme", "r")
  local prev = vim.opt.background

  if sys_theme_file then
    local content = sys_theme_file:read "*a":gsub("%s+", "")
    sys_theme_file:close()
    if content == "dark" then
      if prev ~= "dark" then
        vim.opt.background = "dark"
        SetTransparent()
      end
    else
      if prev ~= "light" then
        vim.opt.background = "light"
        SetTransparent()
      end
    end
  end
end

vim.cmd [[
  autocmd VimEnter * lua SyncTheme()
  autocmd FocusGained * lua SyncTheme()
]]

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
