return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
  },
  config = function()
    -- Use neo-tree in place of netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('neo-tree').setup({
      window = {
        position = "current"
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        window = {
          mappings = {
            ["/"] = "noop",
            ["F"] = "fuzzy_finder",
          },
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            untracked = "",
            ignored   = "",
            unstaged  = "",
            staged    = "",
            conflict  = "",
          }
        }
      }
    })
  end
}
