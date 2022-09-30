local config = {

	-- Configure AstroNvim updates
	updater = {
		remote = "origin", -- remote to use
		channel = "nightly", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "main", -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
	},

	-- Set colorscheme
	colorscheme = "solarized",

	-- set vim options here (vim.<first_key>.<second_key> =  value)
	options = {
		opt = {
			relativenumber = true, -- sets vim.opt.relativenumber
			background = "light",
			termguicolors = true,
			wrap = false,
		},
		g = {
			mapleader = " ", -- sets vim.g.mapleader
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
		-- All other entries override the setup() call for default plugins
		["null-ls"] = function(config)
			local null_ls = require("null-ls")
			-- Check supported formatters and linters
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			config.sources = {
				-- Set a formatter
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.prettier,
			}
			-- set up null-ls's on_attach function
			config.on_attach = function(client)
				-- NOTE: You can remove this on attach function to disable format on save
				if client.resolved_capabilities.document_formatting then
					vim.api.nvim_create_autocmd("BufWritePre", {
						desc = "Auto format before save",
						pattern = "<buffer>",
						callback = vim.lsp.buf.formatting_sync,
					})
				end
			end
			return config -- return final config table
		end,
		treesitter = {
			ensure_installed = { "lua" },
		},
		["nvim-lsp-installer"] = {
			ensure_installed = {
				"stylua",
				"shfmt",
				"prettier",
				"sumneko_lua",
				"typescript-language-server",
				"gopls",
				"goimports",
				"html",
			},
		},
		packer = {
			compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
		},
		["neo-tree"] = function(config)
			config.window.width = 40
		end,
	},

	-- LuaSnip Options
	luasnip = {
		-- Add paths for including more VS Code style snippets in luasnip
		vscode_snippet_paths = {},
		-- Extend filetypes
		filetype_extend = {
			javascript = { "javascriptreact" },
		},
	},

	-- Modify which-key registration
	["which-key"] = {
		-- Add bindings
		register_mappings = {
			-- first key is the mode, n == normal mode
			n = {
				-- second key is the prefix, <leader> prefixes
				["<leader>"] = {
					-- which-key registration table for normal mode, leader prefix
					-- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
				},
			},
		},
	},

	-- CMP Source Priorities
	-- modify here the priorities of default cmp sources
	-- higher value == higher priority
	-- The value can also be set to a boolean for disabling default sources:
	-- false == disabled
	-- true == 1000
	cmp = {
		source_priority = {
			nvim_lsp = 1000,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
	},

	-- Extend LSP configuration
	lsp = {
		on_attach = function(client, bufnr)
			-- For lang servers that already have formatting set up with
			-- null-ls, disable their local formatting.
			local skip_client_formatting = {
				["gopls"] = true,
				["tsserver"] = true,
			}
			if skip_client_formatting[client.name] then
				client.resolved_capabilities.document_formatting = false
			end
		end,

		-- override the lsp installer server-registration function
		-- server_registration = function(server, opts)
		--   require("lspconfig")[server].setup(opts)
		-- end,

		-- Add overrides for LSP server settings, the keys are the name of the server
		["server-settings"] = {
			-- example for addings schemas to yamlls
			-- yamlls = {
			--   settings = {
			--     yaml = {
			--       schemas = {
			--         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
			--         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
			--         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
			--       },
			--     },
			--   },
			-- },
		},
	},

	-- Diagnostics configuration (for vim.diagnostics.config({}))
	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	-- This function is run last
	-- good place to configure mappings and vim options
	polish = function()
		-- Set key bindings
		vim.keymap.set("n", ";", ":")

		vim.keymap.set("n", "<leader>fo", ":Goyo<CR>")

		vim.keymap.set("n", "<leader>t", ":Neotree left toggle<CR>")
		vim.keymap.set("n", "<leader>e", ":Neotree float toggle<CR>")
		vim.keymap.set("n", "<leader>ft", ":Neotree reveal_file=%<CR>")

		vim.keymap.set("n", "<leader>w/", ":vsp<CR>")
		vim.keymap.set("n", "<leader>w?", ":sp<CR>")

		vim.keymap.set("n", "<leader>go", ':exe "!gbrowse " . fnamemodify(expand("%"), ":~:.")<CR>')

		vim.keymap.set("n", "<leader>gg", function()
			astronvim.toggle_term_cmd("lazygit -ucf '/Users/sethetter/Library/Application Support/lazygit/nvim.yml'")
		end)

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
