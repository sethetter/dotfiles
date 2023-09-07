-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Plugins
lvim.plugins = {
  { "ishan9299/nvim-solarized-lua" },
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
      enabled = true,
    },
    build = function() require("gitlab.server").build(true) end,
    config = function() require("gitlab").setup() end,
  },
}

-- Display
lvim.colorscheme = "solarized-flat"
vim.opt.background = "light"

-- Opts
lvim.format_on_save.enabled = true
vim.opt.relativenumber = true

-- Core plugin changes
lvim.builtin.nvimtree.setup.view.width = 40

-- Keybindings
lvim.keys.normal_mode["<S-h>"] = ":bprev<cr>"
lvim.keys.normal_mode["<S-l>"] = ":bnext<cr>"

lvim.builtin.which_key.mappings["w?"] = { ":sp<cr>", "Split horizontal", mode = { "n" } }
lvim.builtin.which_key.mappings["w/"] = { ":vsp<cr>", "Split vertical", mode = { "n" } }

lvim.builtin.which_key.mappings["gO"] = { ":GitOpen<cr>", "Open file in github/gitlab", mode = { "n", "v" } }
lvim.builtin.which_key.mappings["gL"] = { ":GitCopy<cr>", "Open file in github/gitlab", mode = { "n", "v" } }

lvim.builtin.which_key.mappings["G"] = {
  name = "Gitlab",
  s = { "<cmd>lua require('gitlab').summary()<cr>", "View MR summary" },
  A = { "<cmd>lua require('gitlab').approve()<cr>", "Approve MR" },
  R = { "<cmd>lua require('gitlab').revoke()<cr>", "Revoke MR" },
  c = { "<cmd>lua require('gitlab').create_comment()<cr>", "Create comment" },
  n = { "<cmd>lua require('gitlab').create_note()<cr>", "Create note" },
  d = { "<cmd>lua require('gitlab').toggle_discussions()<cr>", "Toggle discussions" },
  aa = { "<cmd>lua require('gitlab').add_assignee()<cr>", "Add assignee" },
  ad = { "<cmd>lua require('gitlab').delete_assignee()<cr>", "Remove assignee" },
  rr = { "<cmd>lua require('gitlab').review()<cr>", "Review MR" },
  ra = { "<cmd>lua require('gitlab').add_reviewer()<cr>", "Add reviewer" },
  rd = { "<cmd>lua require('gitlab').delete_reviewer()<cr>", "Remove reviewer" },
  p = { "<cmd>lua require('gitlab').pipeline()<cr>", "View MR pipeline" },
}
-- DEBUG
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

-- Filetype based settings
function SetLineWrapForTextFiles(opts)
  local ft = vim.bo[opts.buf].filetype
  -- print(DumpTable(opts, 10))
  -- print(opts.buf, ft)
  if ft == "" or ft == "markdown" or ft == "text" then
    -- print("SETTING THE WRAP!")
    vim.bo[opts.buf].wrap = true
    vim.bo[opts.buf].linebreak = true
    vim.bo[opts.buf].list = false
  end
end

local myAuGroup = vim.api.nvim_create_augroup("MyGroup", { clear = true })
lvim.autocommands = {
  { "FileType", { pattern = { "*" }, group = myAuGroup, callback = SetLineWrapForTextFiles } },
  { "BufAdd",   { pattern = { "*" }, group = myAuGroup, callback = SetLineWrapForTextFiles } },
}

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

vim.cmd [[command! -range GitOpen :lua Git_open(<line1>, <line2>)]]
vim.cmd [[command! -range GitCopy :lua Git_copy(<line1>, <line2>)]]
