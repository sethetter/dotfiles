-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Plugins
lvim.plugins = {
  {
    "sainnhe/everforest",
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
        -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
        require("copilot_cmp").setup()
      end, 100)
    end,
  },
  {
    "madox2/vim-ai",
    config = function()
      vim.g.vim_ai_complete = {
        engine = 'chat',
        options = { model = 'gpt-4' },
      }
      vim.g.vim_ai_edit = {
        engine = 'chat',
        options = { model = 'gpt-4' },
      }
      vim.g.vim_ai_chat = {
        options = { model = 'gpt-4' },
        ui = {
          populate_options = 1,
          scratch_buffer_keep_open = 1,
        },
      }
    end
  },
  {
    "tpope/vim-surround",
  },
  -- Ensures LSP functions are utilized when performing filesystem operations
  -- on your codebase. e.g., updating imports after moving or renaming a file.
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
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
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
    "rhysd/conflict-marker.vim"
  }
}


----------------------------
-- Display
----------------------------

vim.opt.termguicolors = true
vim.opt.background = "light"
lvim.colorscheme = "everforest"
lvim.builtin.lualine.options.theme = 'solarized_light'
lvim.builtin.lualine.options.section_separators = { left = '🭀', right = '🭦' }

---@diagnostic disable-next-line: param-type-mismatch
vim.opt.fillchars:append { diff = "╱" }

-- Opts
lvim.format_on_save.enabled = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = ""

-- Disable netrw so nvimtree will always be used
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

----------------------------
-- Core plugins
----------------------------

-- nvimtree
lvim.builtin.nvimtree.setup.actions.use_system_clipboard = false
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.view.width = { min = 40, max = 50 }
lvim.builtin.nvimtree.setup.prefer_startup_root = true

lvim.builtin.nvimtree.setup.on_attach = function(bufnr)
  local nvimtree = require('nvim-tree.api')
  nvimtree.config.mappings.default_on_attach(bufnr)
  vim.keymap.del('n', '<C-e>', { buffer = bufnr })
end
-- TODO: These get ignore because lunarvim sets them based on lvim.builtin.project.active == true
-- lvim.builtin.nvimtree.setup.update_cwd = false
-- lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = false

----------------------------
-- Keybindings
----------------------------

-- Buffer cycling
lvim.keys.normal_mode["<S-h>"] = ":bprev<cr>"
lvim.keys.normal_mode["<S-l>"] = ":bnext<cr>"

-- Tab management
lvim.keys.normal_mode["<C-n>"] = ":tabnext<cr>"
lvim.keys.normal_mode["<C-p>"] = ":tabprev<cr>"
lvim.builtin.which_key.mappings["tn"] = { ":tabnew<cr>", "New tab", mode = { "n" } }
lvim.builtin.which_key.mappings["td"] = { ":tabclose<cr>", "Close tab", mode = { "n" } }

-- Horizontal scrolling
-- TODO: these don't work! I'd like C-S-l/h, but something doesn't work quite right with shift on mac
-- lvim.keys.normal_mode["<M-h>"] = "3zh"
-- lvim.keys.normal_mode["<M-l>"] = "3zl"

lvim.builtin.which_key.mappings["v?"] = { ":sp<cr>", "Split horizontal", mode = { "n" } }
lvim.builtin.which_key.mappings["v/"] = { ":vsp<cr>", "Split vertical", mode = { "n" } }

lvim.builtin.which_key.mappings["Q"] = { ":qa<cr>", "Quit all" }
lvim.builtin.which_key.mappings["X"] = { ":qa!<cr>", "Quit all (force)" }
-- lvim.builtin.which_key.mappings["fn"] = { ":new<cr>", "New file" }

lvim.builtin.which_key.mappings["aa"] = { ":AI ", "AI complete text" }
lvim.builtin.which_key.mappings["ae"] = { ":AIEdit ", "AI edit text" }
lvim.builtin.which_key.mappings["ac"] = { ":AIChat ", "AI chat" }
lvim.builtin.which_key.mappings["ar"] = { ":AIRedo<cr>", "Redo last AI command" }

lvim.builtin.which_key.mappings["lO"] = { ":SymbolsOutline<cr>", "Toggle symbol outline" }

-- Git stuff!
lvim.builtin.which_key.mappings["gh"] = {
  ":DiffviewFileHistory %<cr>",
  "View file history",
  mode = { "n" },
  silent = true,
}
lvim.builtin.which_key.mappings["gH"] = {
  ":DiffviewFileHistory<cr>",
  "View repo history",
  mode = { "n" },
  silent = true,
}
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
  -- Wrap lines for markdown and text files, or unset filetypes
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
