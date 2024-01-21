return {
  "madox2/vim-ai",
  config = function()
    vim.g.vim_ai_complete = {
      engine = 'chat',
      options = { model = 'gpt-4' },
    }
    vim.g.vim_ai_edit = {
      engine = 'chat',
      options = { model = 'gpt-4' },
    }
    vim.g.vim_ai_chat = {
      options = { model = 'gpt-4' },
      ui = {
        populate_options = 1,
        scratch_buffer_keep_open = 1,
      },
    }
  end
}
