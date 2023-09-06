-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Plugins
lvim.plugins = {
  { "ishan9299/nvim-solarized-lua" },
}

-- Display
lvim.colorscheme = "solarized-flat"
vim.opt.background = "light"

-- Opts
lvim.format_on_save.enabled = true

-- Keybindings
lvim.keys.normal_mode["<S-h>"] = ":bprev<CR>"
lvim.keys.normal_mode["<S-l>"] = ":bnext<CR>"
lvim.builtin.which_key.mappings["w?"] = { ":sp<cr>", "Split horizontal" }
lvim.builtin.which_key.mappings["w/"] = { ":vsp<cr>", "Split vertical" }
