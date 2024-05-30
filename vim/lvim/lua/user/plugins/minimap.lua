return {
  "wfxr/minimap.vim",
  config = function()
    vim.g.minimap_auto_start = 1
    vim.g.minimap_auto_start_win_enter = 1
    vim.g.minimap_git_colors = 1
    vim.g.minimap_highlight_search = 1
    -- vim.g.minimap_highlight_range = 0

    -- vim.api.nvim_set_hl(0, "minimapRange", { bg = "#e0dcc7", force = true })
    -- vim.api.nvim_set_hl(0, "minimapCursor", { bg = "#bdc3af", force = true })
    vim.cmd("hi minimapRange guibg=#e0dcc7")
    vim.cmd("hi minimapCursor guibg=#bdc3af")
  end
}
