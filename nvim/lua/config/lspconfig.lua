-- TODO: Can I add types to this?!

LangServers = {
  lua_ls = {
    settings = {
      Lua = { diagnostics = { globals = { LangServers } } },
    },
  },
  denols = false,
}
