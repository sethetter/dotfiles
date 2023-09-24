-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Plugins
lvim.plugins = {
  {
    "ishan9299/nvim-solarized-lua",
  },
  {
    "rickhowe/diffchar.vim",
  },
  {
    "mattn/vim-gist",
    event = "BufRead",
    dependencies = "mattn/webapi-vim",
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead"
  },
}

-- Display
lvim.colorscheme = "solarized-flat"
vim.opt.fillchars:append { diff = "╱" }
vim.opt.background = "light"

-- Opts
lvim.format_on_save.enabled = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = ""

-- Disable netrw so nvimtree will always be used
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Core plugin changes
-- lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.nvimtree.setup.update_cwd = false
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.actions.use_system_clipboard = false

-- Keybindings
lvim.keys.normal_mode["<S-h>"] = ":bprev<cr>"
lvim.keys.normal_mode["<S-l>"] = ":bnext<cr>"
lvim.keys.normal_mode["<S-j>"] = ":tabnext<cr>"
-- S-k shows hover info, can't use here.

lvim.builtin.which_key.mappings["E"] = { ":e .<cr>", "File explorer", mode = { "n" } }

lvim.builtin.which_key.mappings["tn"] = { ":tabnew<cr>", "New tab", mode = { "n" } }
lvim.builtin.which_key.mappings["td"] = { ":tabclose<cr>", "Close tab", mode = { "n" } }

lvim.builtin.which_key.mappings["v?"] = { ":sp<cr>", "Split horizontal", mode = { "n" } }
lvim.builtin.which_key.mappings["v/"] = { ":vsp<cr>", "Split vertical", mode = { "n" } }

lvim.builtin.which_key.mappings["gO"] = {
  ":GitOpen<cr>",
  "Open file in github/gitlab",
  mode = { "n", "v" },
  silent = true,
}
lvim.builtin.which_key.mappings["gL"] = {
  ":GitCopy<cr>",
  "Copy link to file in github/gitlab",
  mode = { "n", "v" },
  silent = true,
}
lvim.builtin.which_key.mappings["gD"] = {
  ":lua GitDiff()<cr>",
  "Diff buffer against provided target",
  mode = { "n" },
  silent = true,
}
lvim.builtin.which_key.mappings["Gd"] = {
  ":DiffviewOpen<cr>",
  "Diff all files against index",
  mode = { "n" },
  silent = true,
}
lvim.builtin.which_key.mappings["GD"] = {
  ":DiffviewOpen ",
  "Diff all files against provided target",
  mode = { "n" },
  silent = true,
}

-- Filetype based settings
function SetLineWrapForTextFiles(opts)
  local ft = vim.bo[opts.buf].filetype
  if ft == "" or ft == "markdown" or ft == "text" then
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

-- Manually configured LSPs
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "markdown",
      "json",
    },
  }
}

-- Calls the git-open command to get the URL for a specific file/line
-- in the github or gitlab remote repo.
function GitUrl(line1, line2)
  local lines = ""

  -- Check if multiple lines are selected
  if line1 ~= line2 then
    lines = line1 .. "-" .. line2
  else
    lines = line1
  end

  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  local full_path = vim.fn.expand("%:p")
  local filename = string.sub(full_path, string.len(git_root) + 2)

  -- Create the shell command
  return string.format("git-open %s %s", filename, lines)
end

function GitOpen(line1, line2)
  local git_open_cmd = GitUrl(line1, line2)
  vim.cmd(string.format("!%s | xargs open", git_open_cmd))
end

function GitCopy(line1, line2)
  local git_open_cmd = GitUrl(line1, line2)
  vim.cmd(string.format("!%s | pbcopy", git_open_cmd))
end

function GitDiff()
  local target = vim.fn.input("Diff target: ")
  require('gitsigns').diffthis(target)
end

vim.cmd [[command! -range GitOpen :lua GitOpen(<line1>, <line2>)]]
vim.cmd [[command! -range GitCopy :lua GitCopy(<line1>, <line2>)]]


---------------------------
-- Utilities
---------------------------

function DumpTable(table, depth)
  if (depth > 200) then
    print("Error: Depth > 200 in dumpTable()")
    return
  end
  for k, v in pairs(table) do
    if (type(v) == "table") then
      print(string.rep("  ", depth) .. k .. ":")
      DumpTable(v, depth + 1)
    else
      print(string.rep("  ", depth) .. k .. ": ", v)
    end
  end
end
