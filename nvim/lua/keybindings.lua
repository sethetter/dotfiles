local nvim_lsp = require('lspconfig')

local function set_keymap(...) vim.api.nvim_set_keymap(...) end
local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', ';', ':', opts)

-- Files
set_keymap('n', '<leader>fs', ':w<CR>', opts)
set_keymap('n', '<leader>fN', ':new<CR>', opts)
set_keymap('n', '<leader>fn', ':vnew<CR>', opts)
set_keymap('n', '<leader>fr', ':e<CR>', opts)
set_keymap('n', '<leader>fR', ':e!<CR>', opts)
set_keymap('n', '<leader>fe', ':e .<CR>', opts)

-- Windows / Buffers / Tabs
set_keymap('n', '<leader>wd', ':q<CR>', opts)
set_keymap('n', '<leader>w/', ':vsp<CR>', opts)
set_keymap('n', '<leader>w?', ':sp<CR>', opts)
set_keymap('n', '<leader>wh', '<C-w>h', opts)
set_keymap('n', '<leader>wj', '<C-w>j', opts)
set_keymap('n', '<leader>wk', '<C-w>k', opts)
set_keymap('n', '<leader>wl', '<C-w>l', opts)
set_keymap('n', '<leader>bd', ':bd<CR>', opts)
set_keymap('n', '<leader>BX', ':bufdo bd<CR>', opts)
-- set_keymap('n', '<leader>bD', ':BuffersDelete<CR>', opts)
set_keymap('n', '<leader>bn', ':bn<CR>', opts)
set_keymap('n', '<leader>bp', ':bp<CR>', opts)
set_keymap('n', '<leader>T', ':tabnew<CR>', opts)
set_keymap('n', '<leader>tn', ':tabnext<CR>', opts)
set_keymap('n', '<leader>tp', ':tabprevious<CR>', opts)
set_keymap('n', '<leader>td', ':tabclose<CR>', opts)
-- set_keymap('n', '<leader>C', ':Commands<CR>', opts)

-- Movement
set_keymap('', '<C-L>', '20zl', opts) -- Scroll 20 characters to the right
set_keymap('', '<C-H>', '20zh', opts) -- Scroll 20 characters to the left

-- Vmap for maintain Visual Mode after shifting > and <
set_keymap('v', '<', '<gv', opts)
set_keymap('v', '>', '>gv', opts)
set_keymap('n', '<', '<<', opts)
set_keymap('n', '>', '>>', opts)

-- Move visual block
set_keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
set_keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Quickfix List
set_keymap('n', '<leader>qo', ':copen<CR>', opts)
set_keymap('n', '<leader>qv', ':vert copen<CR><C-w>=', opts)
set_keymap('n', '<leader>qc', ':cclose<CR>', opts)
set_keymap('n', '<leader>qn', ':cnext<CR>', opts)
set_keymap('n', '<leader>qp', ':cprev<CR>', opts)

-- Location List
set_keymap('n', '<leader>lo', ':lopen<CR>', opts)
set_keymap('n', '<leader>lv', ':vert lopen<CR><C-w>=', opts)
set_keymap('n', '<leader>lc', ':lclose<CR>', opts)
set_keymap('n', '<leader>ln', ':lnext<CR>', opts)
set_keymap('n', '<leader>lp', ':lprev<CR>', opts)

-- Project Navigation
set_keymap('n', '<leader>pt', ':NvimTreeToggle<CR>', opts)
set_keymap('n', '<leader>pf', ":lua require('telescope.builtin').find_files()<CR>", opts)
set_keymap('n', '<leader>pb', ":lua require('telescope.builtin').buffers()<CR>", opts)
set_keymap('n', '<leader>ps', ":lua require('telescope.builtin').live_grep()<CR>", opts)

-- LSP
set_keymap('n', 'gd', ":lua require('telescope.builtin').lsp_definitions()<CR>", opts)
set_keymap('n', 'gr', ":lua require('telescope.builtin').lsp_references()<CR>", opts)
set_keymap('n', '<leader>fo', ":lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
set_keymap('n', '<leader>po', ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", opts)

-- Git
set_keymap('n', '<leader>gs', ":lua require('telescope.builtin').git_status()<CR>", opts)
set_keymap('n', '<leader>gc', ":lua require('telescope.builtin').git_commits()<CR>", opts)

-- Misc
set_keymap('', '<leader>c', ':CommentToggle<CR>', opts)
set_keymap('n', '<leader>sc', ':let @/=""<CR>', opts)

-- Autocomplete
-- set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--This line is important for auto-import
-- set_keymap("i", "<C-y>", "compe#confirm('<C-y>')", {expr = true})
-- set_keymap("i", "<CR>", "<C-y>", {})
-- set_keymap('i', '<cr>', '<cmd>compe#confirm()', { expr = true })
-- set_keymap('i', '<c-space>', '<cmd>compe#complete()', { expr = true })

-- LSP

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- TODO: Open file outline/search symbols
  -- TODO: Search workspace symbols?

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local servers = {'gopls', 'terraformls', 'solargraph', 'rls', 'tsserver', 'jsonls'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
  }
end
