local Terminal = require("toggleterm.terminal").Terminal

-- Create a lazygit fullscreen terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float", -- This can use "horizontal" or "vertical" if float doesn't fill
  float_opts = {
    border = "none", -- or single/double if you prefer
    width = function()
      return vim.o.columns
    end, -- full width
    height = function()
      return vim.o.lines
    end, -- full height
  },
  -- adjust other options as needed
  hidden = true,
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

vim.cmd("command! LazyGit lua _LAZYGIT_TOGGLE()")
