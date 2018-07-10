" Plugins
" ----------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Python settings
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('roxma/vim-hug-neovim-rpc')
  call dein#add('roxma/nvim-yarp')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('w0rp/ale')
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })

  call dein#add('sheerun/vim-polyglot')
  call dein#add('editorconfig/editorconfig-vim')

  call dein#add('icymind/NeoSolarized')
  call dein#add('itchyny/lightline.vim')
  call dein#add('ap/vim-buftabline')
  call dein#add('myusuf3/numbers.vim')

  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/nerdcommenter')

  " Git
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')

  " Tmux
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('tmux-plugins/vim-tmux-focus-events')

  " JavaScript
  call dein#add('pangloss/vim-javascript')

  " HTML
  call dein#add('mattn/emmet-vim')

  " Go
  call dein#add('fatih/vim-go')

  " TypeScript
  call dein#add('leafgarland/typescript-vim')
  call dein#add('Quramy/tsuquyomi')

  " Haskell
  "call dein#add('neovimhaskell/haskell-vim')
  "call dein#add('eagletmt/ghcmod-vim')
  "call dein#add('eagletmt/neco-ghc')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" Base Config
" ----------------------------------------

let mapleader=" "

filetype plugin indent on
syntax on

set relativenumber
set shiftwidth=2
set tabstop=2
set expandtab
set hidden
set laststatus=2
set noshowmode

" Colors
set background=dark
colorscheme NeoSolarized


" Plugin Config
" ---------------------------------------

"  denite
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('file_rec', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" ale
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_cache_executable_check_failures = 1
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1

" lightline
let g:lightline = { 'colorscheme': 'solarized' }

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#sources#tss#javascript_support = 1

" Chromatica
let g:chromatica#libclang_path = '/usr/lib64/llvm'
let g:chromatica#enable_at_startup = 1

" NERDTree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" tsuquyomi
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

" typescript
let g:nvim_typescript#javsacript_support=1

" markdown
autocmd BufRead,BufNewFile *.md set textwidth=80

" emmet
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_mode='i'

" go
autocmd FileType go nnoremap <leader>Gd :GoDef<CR>
autocmd FileType go nnoremap <leader>GD :GoDoc<CR>


" Keybindings
" -----------------------------------

" Files
nnoremap <leader>fs :w<CR>

" Project Navigation
nnoremap <leader>pt :NERDTreeToggle<CR>
nnoremap <leader>pT :e .<CR>
nnoremap <silent> <leader>pF :NERDTreeFind<CR>
nnoremap <leader>pb :Denite buffer<CR>
nnoremap <leader>pf :Denite file_rec<CR>
nnoremap <leader>pn :e NOTES.sethetter.md<CR>
nnoremap <C-p> :Denite file_rec<CR>
nnoremap <leader>Gd :ALEGoToDefinition<CR>

" Search
nnoremap <leader>sc :noh<CR>
nnoremap <leader>sp :Denite grep<CR>
nnoremap <leader>sP :DeniteCursorWord grep:.<CR>

" Movement
map  <Leader>jw <Plug>(easymotion-bd-w)
nmap <Leader>jw <Plug>(easymotion-overwin-w)

" Git
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gp :Gpush<CR>

" Buffers
nnoremap <leader>bd :bp\|bd #<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bf :ALEFix<CR>

" Notes
nnoremap <leader>np :e NOTES.sethetter.md<CR>
nnoremap <leader>ns :e ~/notes/scratch.md<CR>
nnoremap <leader>nd :e ~/notes/doing.md<CR>
nnoremap <leader>nl :e ~/notes/log.md<CR>

" Windows
nnoremap <leader>wd :q<CR>
nnoremap <leader>w/ :vsp<CR>
nnoremap <leader>w? :sp<CR>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

" Errors
nnoremap <leader>eo :lop<CR>
nnoremap <leader>ec :lcl<CR>
nnoremap <leader>en :lne<CR>
nnoremap <leader>ep :lpr<CR>
nnoremap <leader>ee :ALEEnableBuffer<CR>
nnoremap <leader>et :ALEToggleBuffer<CR>
nnoremap <leader>eE :ALEEnable<CR>
nnoremap <leader>eT :ALEToggle<CR>

" Dein pane movement
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-?>', '<denite:do_action:splitswitch>', 'noremap')
call denite#custom#map('insert', '<C-/>', '<denite:do_action:vsplitswitch>', 'noremap')

" Startup
" -------------------------------------
packloadall
silent! helptags ALL
