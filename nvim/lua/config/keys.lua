local wk       = require("which-key")

local Terminal = require('toggleterm.terminal').Terminal

-- Create a lazygit fullscreen terminal
local lazygit  = Terminal:new({
  cmd = "lazygit",
  direction = "float",                           -- This can use "horizontal" or "vertical" if float doesn't fill
  float_opts = {
    border = "none",                             -- or single/double if you prefer
    width = function() return vim.o.columns end, -- full width
    height = function() return vim.o.lines end,  -- full height
  },
  -- adjust other options as needed
  hidden = true
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

vim.cmd("command! LazyGit lua _LAZYGIT_TOGGLE()")

wk.add({
  { "<C-h>",      "<C-w>h",                                                 desc = "Move focus to left pane" },
  { "<C-j>",      "<C-w>j",                                                 desc = "Move focus to below pane" },
  { "<C-k>",      "<C-w>k",                                                 desc = "Move focus to above pane" },
  { "<C-l>",      "<C-w>l",                                                 desc = "Move focus to right pane" },

  { "<M-h>",      "5zh",                                                    desc = "Scroll left" },
  { "<M-l>",      "5zl",                                                    desc = "Scroll right" },

  { "H",          ":bp<cr>",                                                desc = "Switch to previous buffer" },
  { "L",          ":bn<cr>",                                                desc = "Switch to next buffer" },
  { "<leader>d",  "<cmd>bd<cr>",                                            desc = "Close buffer" },
  { "<leader>D",  "<cmd>bd!<cr>",                                           desc = "Close buffer (force)" },
  { "<leader>bn", "<cmd>new<CR>",                                           desc = "New buffer" },
  { "<leader>bf", "<cmd>Telescope buffers<cr>",                             desc = "Buffers" },
  { "<leader>bF", "<cmd>lua vim.lsp.buf.format()<CR>",                      desc = "Format buffer" },

  { "<leader>tp", "<cmd>tabprev<cr>",                                       desc = "Previous tab" },
  { "<leader>tn", "<cmd>tabnext<cr>",                                       desc = "Next tab" },

  { "<leader>/",  "<cmd>CommentToggle<cr>",                                 desc = "Toggle comment",           mode = { "n" } },
  { "<leader>/",  "<cmd>CommentToggle<cr>",                                 desc = "Toggle comment",           mode = { "v" } },

  { "<leader>e",  "<cmd>NvimTreeToggle<cr>",                                desc = "Toggle file tree" },
  { "E",          "<cmd>NvimTreeFindFile<cr>",                              desc = "Reveal file in file tree" },
  { "<leader>h",  "<cmd>noh<cr>",                                           desc = "Clear highlight" },
  { "<leader>v/", "<cmd>vsp<cr>",                                           desc = "Split vertical" },
  { "<leader>v?", "<cmd>sp<cr>",                                            desc = "Split horizontal" },

  { "<leader>f",  "<cmd>Telescope find_files<cr>",                          desc = "Find files" },
  { "<leader>sp", "<cmd>Telescope live_grep<cr>",                           desc = "Live grep" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>",                           desc = "Help tags" },
  { "<leader>sc", "<cmd>Telescope commands<cr>",                            desc = "Commands" },

  { "<leader>m",  "<cmd>Trouble diagnostics toggle<cr>",                    desc = "Trouble diagnostics" },
  { "<leader>l",  "<cmd>Trouble lsp toggle include_declarations=false<cr>", desc = "Trouble LSP bar" },
  { "<leader>o",  "<cmd>Trouble lsp_document_symbols toggle<cr>",           desc = "Symbols outline" },

  { "<leader>Z",  "<cmd>Goyo<cr>",                                          desc = "Goyo toggle" },

  { "<leader>w",  "<cmd>w<cr>",                                             desc = "Save" },
  { "<leader>X",  "<cmd>x<cr>",                                             desc = "Save and close" },
  { "<leader>q",  "<cmd>q<cr>",                                             desc = "Quit" },
  { "<leader>Q",  "<cmd>qa<cr>",                                            desc = "Quit all" },

  { "[d",         "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",            desc = "Previous diagnostic" },
  { "]d",         "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>",            desc = "Next diagnostic" },
  { "[g",         "<cmd>Gitsigns prev_hunk<cr>",                            desc = "Previous change" },
  { "]g",         "<cmd>Gitsigns next_hunk<cr>",                            desc = "Next change" },

  { "K",          "<cmd>lua vim.lsp.buf.hover()<cr>",                       desc = "Hover" },

  { "g",          group = "goto" },
  { "gs",         "<cmd>Telescope lsp_document_symbols<cr>",                desc = "Document symbols" },
  { "gS",         "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",       desc = "Workspace symbols" },
  { "gD",         "<cmd>lua vim.lsp.buf.declaration()<cr>",                 desc = "Declaration" },
  { "gd",         "<cmd>lua vim.lsp.buf.definition()<cr>",                  desc = "Definition" },
  { "gi",         "<cmd>lua vim.lsp.buf.implementation()<cr>",              desc = "Implementation" },
  { "gr",         "<cmd>lua vim.lsp.buf.references()<cr>",                  desc = "References" },
  { "g.",         "<cmd>lua vim.lsp.buf.code_action()<cr>",                 desc = "Code action" },

  { "<leader>t",  group = "tab" },
  { "<leader>td", "<cmd>tabclose<cr>",                                      desc = "Close Tab" },
  { "<leader>tn", "<cmd>tabnew<cr>",                                        desc = "Close Tab" },

  { "<leader>g",  group = "git" },
  { "<leader>gg", "<cmd>LazyGit<cr>",                                       desc = "Lazygit" },
  { "<leader>gs", "<cmd>Telescope git_status<cr>",                          desc = "Git status" },
  { "<leader>gd", "<cmd>Gitsigns diffthis vertical=true HEAD<cr>",          desc = "File diff" },
  { "<leader>gD", "<cmd>DiffviewOpen<cr>",                                  desc = "Git diff" },
  { "<leader>Gd", ":Gitsigns diffthis vertical=true ",                      desc = "File diff provided ref" },
  { "<leader>GD", ":DiffviewOpen ",                                         desc = "Diff provided ref" },
  { "<leader>gh", "<cmd>DiffviewFileHistory<cr>",                           desc = "File history" },
  {
    "<leader>gl",
    '<cmd>lua require("gitlinker").get_buf_range_url("n", {action_callback = require("gitlinker.actions").copy_to_clipboard})<cr>',
    desc = "Copy git url",
    mode = "n",
    silent = true,
  },
  {
    "<leader>gl",
    '<cmd>lua require("gitlinker").get_buf_range_url("v", {action_callback = require("gitlinker.actions").copy_to_clipboard})<cr>',
    desc = "Copy git url",
    mode = "v",
    -- TODO: make this actually silent
    silent = true,
  },
})
