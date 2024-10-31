local wk = require("which-key")

wk.add({
	{ "<C-h>",      "<C-w>h",                                      desc = "Move focus to left pane" },
	{ "<C-j>",      "<C-w>j",                                      desc = "Move focus to below pane" },
	{ "<C-k>",      "<C-w>k",                                      desc = "Move focus to above pane" },
	{ "<C-l>",      "<C-w>l",                                      desc = "Move focus to right pane" },

	{ "<leader>b",  group = "buffer" },
	{ "<leader>bd", "<cmd>bd<cr>",                                 desc = "Delete Buffer" },
	{ "<leader>bf", "<cmd>lua vim.lsp.buf.format()<CR>",           desc = "Format buffer" },
	{ "<leader>c",  "<cmd>CommentToggle<cr>",                      desc = "Toggle Comment" },
	{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>",      desc = "Code Action" },
	{ "<leader>e",  "<cmd>NvimTreeToggle<cr>",                     desc = "Toggle NvimTree" },
	{ "E",          "<cmd>NvimTreeFindFile<cr>",                   desc = "Toggle NvimTree" },

	{ "<leader>f",  group = "file" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>",               desc = "Find Files" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>",                 desc = "Recent Files" },
	{ "<leader>q",  "<cmd>q<cr>",                                  desc = "Quit" },

	{ "<leader>s",  group = "search" },
	{ "<leader>sb", "<cmd>Telescope buffers<cr>",                  desc = "Buffers" },
	{ "<leader>sg", "<cmd>Telescope live_grep<cr>",                desc = "Live Grep" },
	{ "<leader>sh", "<cmd>Telescope help_tags<cr>",                desc = "Help Tags" },
	{ "<leader>w",  "<cmd>w<cr>",                                  desc = "Save" },

	{ "<leader>Q",  "<cmd>qa<cr>",                                 desc = "Quit all" },
	{ "H",          ":bp<cr>",                                     desc = "Switch to previous buffer" },
	{ "K",          "<cmd>lua vim.lsp.buf.hover()<cr>",            desc = "Hover" },
	{ "L",          ":bn<cr>",                                     desc = "Switch to next buffer" },
	{ "[d",         "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Previous Diagnostic" },
	{ "]d",         "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },

	{ "g",          group = "goto" },
	{ "gD",         "<cmd>lua vim.lsp.buf.declaration()<cr>",      desc = "Declaration" },
	{ "gd",         "<cmd>lua vim.lsp.buf.definition()<cr>",       desc = "Definition" },
	{ "gi",         "<cmd>lua vim.lsp.buf.implementation()<cr>",   desc = "Implementation" },
	{ "gr",         "<cmd>lua vim.lsp.buf.references()<cr>",       desc = "References" },

	{ "G", group = "git" },
	-- { "Gd", 
})
