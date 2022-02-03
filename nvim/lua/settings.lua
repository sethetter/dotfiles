vim.cmd("let mapleader=' '")

vim.cmd('set relativenumber')
vim.cmd('set number')

vim.cmd('set encoding=utf-8')
vim.cmd('set fileencoding=utf-8')
vim.cmd('set fileencodings=utf-8')

vim.cmd('set bomb')
vim.cmd('set binary')
vim.cmd('set ttyfast')
vim.cmd('set backspace=indent,eol,start')
vim.cmd('set hidden')

vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set expandtab')
vim.cmd('set nowrap')

-- Searching
vim.cmd('set hlsearch')
vim.cmd('set incsearch')
vim.cmd('set ignorecase')
vim.cmd('set smartcase')

-- Colors
vim.cmd('set termguicolors')
vim.cmd('syntax enable')
vim.cmd('set background=light')
vim.cmd('colorscheme solarized')
vim.cmd('hi Normal guibg=NONE')

-- Filetypes
vim.cmd('au BufEnter *.graphql :set ft=graphql')

vim.o.updatetime = 100
vim.wo.signcolumn = 'yes'

-- nvim-cmp
local cmp = require'cmp'
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
  })
})

-- Format on save
local filetypes = {'ts', 'tsx', 'js', 'jsx', 'go', 'rs'}
for _, ft in ipairs(filetypes) do
  vim.cmd(string.format('autocmd BufWritePre *.%s lua vim.lsp.buf.formatting_sync(nil, 1000)', ft))
  vim.cmd(string.format('autocmd BufWritePre *.%s.in lua vim.lsp.buf.formatting_sync(nil, 1000)', ft))
end
