-- return {
--   "zbirenbaum/copilot-cmp",
--   event = "InsertEnter",
--   dependencies = { "zbirenbaum/copilot.lua" },
--   config = function()
--     vim.defer_fn(function()
--       -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
--       require("copilot").setup({
--         suggestion = { enabled = false },
--         panel = { enabled = false },
--       })
--       -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
--       require("copilot_cmp").setup()
--     end, 100)
--   end,
-- }
-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   event = "InsertEnter",
--   config = function()
--     require("copilot").setup()
--   end,
-- }
return {
  "github/copilot.vim",
}
