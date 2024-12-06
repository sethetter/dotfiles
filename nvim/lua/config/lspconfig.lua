-- TODO: Can I add types to this?!

LangServers = {
  lua_ls = {
    settings = {
      Lua = { diagnostics = { globals = { LangServers } } },
    },
  },
  eslint = {
    settings = {
      run = "onSave",
    },
  },
  denols = {
    root_dir = function(_, bufn)
      return vim.fs.root(bufn, { "deno.json" })
    end,
  },
  vtsls = {
    root_dir = function(_, bufn)
      if not vim.fs.root(bufn, { "deno.json" }) then
        return vim.fs.root(bufn, { "package.json", "tsconfig.json", ".git" })
      end
    end,
  },
}

-- local is_deno = vim.env.NVIM_DENO
-- if is_deno then
--   LangServers.denols = { enable = true }
--   LangServers.vtsls = false
-- else
--   LangServers.denols = false
-- end
