return {
  "stevearc/aerial.nvim",
  config = function()
    require('aerial').setup({
      filter_kind = false,
    })
  end
}
