local wk = require("which-key")

local function qflist_is_open()
  local is_open = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      is_open = true
      break
    end
  end
  return is_open
end
local function toggle_qf_list()
  if qflist_is_open() then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
  end
end

wk.add({
  { "<C-h>", "<C-w>h", desc = "Move focus to left pane" },
  { "<C-j>", "<C-w>j", desc = "Move focus to below pane" },
  { "<C-k>", "<C-w>k", desc = "Move focus to above pane" },
  { "<C-l>", "<C-w>l", desc = "Move focus to right pane" },

  { "<M-h>", "5zh", desc = "Scroll left" },
  { "<M-l>", "5zl", desc = "Scroll right" },

  { "H", ":bp<cr>", desc = "Switch to previous buffer" },
  { "L", ":bn<cr>", desc = "Switch to next buffer" },

  -- Prevents the pane from being removed when closing a buffer
  { "<leader>d", "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>", desc = "Close buffer" },
  { "<leader>D", "<cmd>bp<bar>sp<bar>bn<bar>bd!<cr>", desc = "Close buffer (force)" },
  { "<leader>BD", "<cmd>bufdo bd<cr>", desc = "Close all buffers" },

  { "<leader>n", "<cmd>vnew<CR>", desc = "New buffer" },

  { "<C-t>", "<cmd>tabnext<cr>", desc = "Next tab", group = "tab" },
  { "<leader>td", "<cmd>tabclose<cr>", desc = "Close Tab", group = "tab" },
  { "<leader>tn", "<cmd>tabnew<cr>", desc = "New Tab", group = "tab" },

  { "<leader>CL", "<cmd>ConfigLocalEdit<cr>", desc = "Edit local nvim config" },
  { "<leader>N", "<cmd>vsp<cr><C-w>l<cmd>e NOTES.sethetter.md<cr>", desc = "Open personal notes" },

  {
    "<leader>/",
    "<cmd>CommentToggle<cr>",
    desc = "Toggle comment",
    mode = { "n" },
  },
  {
    "<leader>/",
    ":'<,'>CommentToggle<cr>",
    desc = "Toggle comment",
    mode = { "v" },
  },

  { "E", "<cmd>Neotree position=current toggle reveal<cr>", desc = "Open file explorer" },

  { "<leader>h", "<cmd>noh<cr>", desc = "Clear highlight" },
  { "<leader>v/", "<cmd>vsp<cr>", desc = "Split vertical", group = "split" },
  { "<leader>v?", "<cmd>sp<cr>", desc = "Split horizontal", group = "split" },

  {
    "<leader>f",
    "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,--iglob=!.git sort_mru=true<cr>",
    desc = "Find files",
  },
  { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
  { "<leader>sp", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
  { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },

  -- TODO: Make this a toggle?
  {
    "<leader>co",
    toggle_qf_list,
    desc = "Toggle quickfix list",
  },
  { "<leader>cn", "<cmd>cnext<cr>", desc = "Next QF item" },
  { "<leader>cp", "<cmd>cprev<cr>", desc = "Prev QF item" },

  {
    "<leader>m",
    function()
      vim.diagnostic.setqflist({ open = true, focus = true })
    end,
    desc = "Diagnostics in qf list",
  },

  { "<leader>o", "<cmd>AerialToggle<cr>", desc = "Symbols outline" },

  { "<leader>Z", "<cmd>Goyo<cr>", desc = "Goyo toggle" },

  { "<leader>w", "<cmd>w<cr>", desc = "Save" },
  { "<leader>X", "<cmd>x<cr>", desc = "Save and close" },
  { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
  { "<leader>Q", "<cmd>qa<cr>", desc = "Quit all" },

  { "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Previous diagnostic" },
  { "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next diagnostic" },
  { "[g", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous change" },
  { "]g", "<cmd>Gitsigns next_hunk<cr>", desc = "Next change" },

  { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },

  { "g", group = "goto" },
  { "gs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
  { "gS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace symbols" },
  { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Declaration" },
  { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Definition" },
  { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Implementation" },
  { "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References" },
  { "g.", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code action" },
  { "<leader>R", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename symbol" },
  { "<leader>F", "<cmd>Format<CR>", desc = "Format buffer" },

  { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Lazygit", group = "git" },
  { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status", group = "git" },
  { "<leader>gd", "<cmd>Gitsigns diffthis vertical=true HEAD<cr>", desc = "File diff", group = "git" },
  { "<leader>Gd", ":Gitsigns diffthis vertical=true ", desc = "File diff provided ref", group = "git" },
  { "<leader>GD", ":DiffviewOpen ", desc = "Diff provided ref", group = "git" },
  { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history", group = "git" },
  { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Git history", group = "git" },
  { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Git history", group = "git" },
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

  { "<leader>PP", "<cmd>Lazy<cr>", desc = "Manage plugins", group = "plugin" },
})
