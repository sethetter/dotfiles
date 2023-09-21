local lsputil = require('lspconfig/util')

local hasImportMap = lsputil.root_pattern("import_map.json")
local hasDenoJson = lsputil.root_pattern("deno.json")
local hasDenoJsonc = lsputil.root_pattern("deno.jsonc")

local isDeno = hasImportMap or hasDenoJson or hasDenoJsonc

if isDeno then
  local importMap = "deno.jsonc"
  if hasDenoJson then importMap = "deno.json" end
  if hasImportMap then importMap = "import_map.json" end

  require("lvim.lsp.manager").setup("denols", {
    settings = { import_map = importMap }
  })
else
  require("lvim.lsp.manager").setup("tsserver", {})
end
