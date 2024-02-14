return {
  "hedyhli/outline.nvim",
  config = function()
    require("outline").setup({
      preview_window = {
        live = true,
      },
    })
  end
}
