local config = {
	-- Configure AstroNvim updates
	updater = {
		remote = "origin", -- remote to use
		channel = "nightly", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "nightly", -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
	},

	header = {
		[[          __            __                         ]],
		[[         |  \          |  \                        ]],
		[[  ______ | ▓▓____      | ▓▓____   ______  __    __ ]],
		[[ /      \| ▓▓    \     | ▓▓    \ /      \|  \  |  \]],
		[[|  ▓▓▓▓▓▓\ ▓▓▓▓▓▓▓\    | ▓▓▓▓▓▓▓\  ▓▓▓▓▓▓\ ▓▓  | ▓▓]],
		[[| ▓▓  | ▓▓ ▓▓  | ▓▓    | ▓▓  | ▓▓ ▓▓    ▓▓ ▓▓  | ▓▓]],
		[[| ▓▓__/ ▓▓ ▓▓  | ▓▓    | ▓▓  | ▓▓ ▓▓▓▓▓▓▓▓ ▓▓__/ ▓▓]],
		[[ \▓▓    ▓▓ ▓▓  | ▓▓    | ▓▓  | ▓▓\▓▓     \\▓▓    ▓▓]],
		[[  \▓▓▓▓▓▓ \▓▓   \▓▓     \▓▓   \▓▓ \▓▓▓▓▓▓▓_\▓▓▓▓▓▓▓]],
		[[                                         |  \__| ▓▓]],
		[[                                          \▓▓    ▓▓]],
		[[                                           \▓▓▓▓▓▓ ]],
	},

	colorscheme = "solarized",

	-- set vim options here (vim.<first_key>.<second_key> =  value)
	options = {
		opt = {
			relativenumber = true,
			background = "light",
			termguicolors = true,
			wrap = false,
		},
		g = {
			mapleader = " ",
			cmp_enabled = true, -- enable completion at start
		},
	},

	-- Disable AstroNvim ui features
	ui = {
		nui_input = true,
		telescope_select = true,
	},

	-- Configure plugins
	plugins = {
		init = {
			{ "ishan9299/nvim-solarized-lua" },
			{ "LnL7/vim-nix" },
			{ "tpope/vim-surround" },
			{ "junegunn/goyo.vim" },
			{ "hashivim/vim-terraform" },
			{ "MaxMEllon/vim-jsx-pretty" },
			{ "pantharshit00/vim-prisma" },
		},
		packer = {
			compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
		},
		["neo-tree"] = function(config)
			config.window.width = 40
		end,
		["null-ls"] = function(config)
			local null_ls = require("null-ls")

			config.sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.goimports,
			}
			return config
		end,
		["mason-lspconfig"] = {
			ensure_installed = {
				"sumneko_lua",
				"typescript-language-server",
				"gopls",
				"rust-analyzer",
				"pylsp",
				"terraformls",
				"yamlls",
				"html",
			},
		},
		["mason-tool-installer"] = {
			ensure_installed = { "prettier", "stylua" },
		},
	},

	cmp = {
		source_priority = {
			nvim_lsp = 1000,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
	},

	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	mappings = {
		n = {
			[";"] = { ":", desc = "you know" },
			["<leader>qc"] = { ":cclose<CR>", desc = "close the quickfix list" },
			["<leader>qo"] = { ":copen<CR>", desc = "open the quickfix list" },
			["<leader>fO"] = { ":Goyo<CR>", desc = "Focus with Goyo" },
			["<leader>t"] = { ":Neotree left toggle<CR>", desc = "" },
			["<leader>e"] = { ":Neotree float toggle<CR>", desc = "Show neotree as float" },
			["<leader>fr"] = { ":Neotree reveal_file=%<CR>", desc = "Reveal file in Neotree" },
			["<leader>w/"] = { ":vsp<CR>", desc = "Split vertical" },
			["<leader>w?"] = { ":sp<CR>", desc = "Split horizontal" },
			["<leader>go"] = {
				':exe "!gbrowse " . fnamemodify(expand("%"), ":~:.")<CR>',
				desc = "Open in github / gitlab",
			},
		},
	},

	-- This function is run last
	polish = function()
		-- Set autocommands
		vim.api.nvim_create_augroup("packer_conf", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			desc = "Sync packer after modifying plugins.lua",
			group = "packer_conf",
			pattern = "plugins.lua",
			command = "source <afile> | PackerSync",
		})

		vim.cmd("autocmd FileType markdown set wrap linebreak nolist")

		vim.cmd("autocmd User GoyoEnter :Gitsigns toggle_signs")
		vim.cmd("autocmd User GoyoLeave :Gitsigns toggle_signs")

		-- Set up custom filetypes
		vim.filetype.add({
			-- extension = {
			--   foo = "fooscript",
			-- },
			filename = {
				["tiltfile"] = "python",
			},
			-- pattern = {
			--   ["~/%.config/foo/.*"] = "fooscript",
			-- },
		})
	end,
}

return config
