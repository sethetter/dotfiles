local M = {}

local function file_exists(filepath)
  local file_stat = vim.loop.fs_stat(filepath)
  return file_stat and file_stat.type or false
end

---
-- Initializes either tsserver or denols, based on presence of
-- relevant files in project root.
---
function M.setup()
  local root = vim.fn.getcwd()
  local deno_files = { "deno.json", "deno.jsonc", "import_map.json" }

  local is_deno = false
  local import_map = ""

  for _, file in ipairs(deno_files) do
    local filepath = root .. '/' .. file
    if file_exists(filepath) then
      is_deno = true
      import_map = filepath
    end
  end

  if is_deno then
    require("lvim.lsp.manager").setup("denols", {
      settings = { import_map = import_map }
    })
  else
    require("lvim.lsp.manager").setup("tsserver", {})
  end
end

return M
