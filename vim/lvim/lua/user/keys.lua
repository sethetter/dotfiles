lvim.keys.normal_mode[";"]            = ":"

-- File navigation
lvim.keys.normal_mode["\\"]           = ":Neotree position=left reveal<cr>"
lvim.keys.normal_mode["E"]            = ":Neotree position=current reveal<cr>"
lvim.builtin.which_key.mappings["e"]  = {
  ":Neotree position=left toggle<cr>",
  "Toggle Neotree",
  mode = { "n" }
}
lvim.builtin.which_key.mappings["o"]  = { ":Outline<cr>", "Toggle outline sidebar" }

-- Buffer cycling
lvim.keys.normal_mode["<S-h>"]        = ":bprev<cr>"
lvim.keys.normal_mode["<S-l>"]        = ":bnext<cr>"
-- lvim.builtin.which_key.mappings["CC"] = { ":bufdo bd<cr>", "Close all buffers", mode = { "n" } }

-- Tab management
lvim.keys.normal_mode["<C-n>"]        = ":tabnext<cr>"
lvim.keys.normal_mode["<C-p>"]        = ":tabprev<cr>"
lvim.builtin.which_key.mappings["tn"] = { ":tabnew<cr>", "New tab", mode = { "n" } }
lvim.builtin.which_key.mappings["td"] = { ":tabclose<cr>", "Close tab", mode = { "n" } }

-- Theme sync
lvim.builtin.which_key.mappings["ts"] = { ":lua SyncTheme()<cr>", "Sync system theme", mode = { "n" } }

-- Horizontal scrolling
-- TODO: these don't work! I'd like C-S-l/h, but something doesn't work quite right with shift on mac
-- lvim.keys.normal_mode["<M-h>"] = "3zh"
-- lvim.keys.normal_mode["<M-l>"] = "3zl"

-- Splits
lvim.builtin.which_key.mappings["v?"] = { ":sp<cr>", "Split horizontal", mode = { "n" } }
lvim.builtin.which_key.mappings["v/"] = { ":vsp<cr>", "Split vertical", mode = { "n" } }

-- Quit
lvim.builtin.which_key.mappings["Q"]  = { ":qa<cr>", "Quit all" }
lvim.builtin.which_key.mappings["X"]  = { ":qa!<cr>", "Quit all (force)" }

-- AI
lvim.builtin.which_key.mappings["aa"] = { ":AI ", "AI complete text" }
lvim.builtin.which_key.mappings["ae"] = { ":AIEdit ", "AI edit text" }
lvim.builtin.which_key.mappings["ac"] = { ":AIChat ", "AI chat" }
lvim.builtin.which_key.mappings["ar"] = { ":AIRedo<cr>", "Redo last AI command" }

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
}

-- LSP
lvim.builtin.which_key.mappings["lR"] = {
  ":TSRemoveUnusedImports<cr>",
  "Remove unused imports (TS)",
  mode = { "n" },
}

-- <esc-j> is an alias for <alt-j>, which swaps a line up or down
-- If I press `esc` then `j` or `k` to quickly, it swaps lines unintentially.
-- Since this isn't a feature I use, I'm just disabling it.
lvim.keys.insert_mode["<A-j>"]        = false
lvim.keys.insert_mode["<A-k>"]        = false
lvim.keys.normal_mode["<A-j>"]        = false
lvim.keys.normal_mode["<A-k>"]        = false
lvim.keys.visual_block_mode["<A-j>"]  = false
lvim.keys.visual_block_mode["<A-k>"]  = false
lvim.keys.visual_block_mode["K"]      = false
lvim.keys.visual_block_mode["J"]      = false
