# neovim configuration

## LSP configuration

By default, all language servers installed with mason will be setup with `lspconfig`.

To change this on a per-project basis, create a [local config](./lua/plugins/config.lua) file.

```lua
LangServers.lua_ls = false -- Disables the lang server

LangServers.vtsls = {} -- Will be passed to `require("lspconfig").vtsls.setup()`
```

If not otherwise specified, `require("lspconfig")[server_name].setup({})` will be called.
