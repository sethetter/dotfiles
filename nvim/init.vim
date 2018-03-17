" dein Scripts
" ----------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/sethetter/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/sethetter/.cache/dein')
  call dein#begin('/home/sethetter/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/sethetter/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('w0rp/ale')
  call dein#add('arakashic/chromatica.nvim')
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })

  call dein#add('icymind/NeoSolarized')
  call dein#add('ap/vim-buftabline')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('myusuf3/numbers.vim')

  call dein#add('junegunn/vim-easy-align')
  call dein#add('easymotion/vim-easymotion')

  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('scrooloose/nerdcommenter')

  " JavaScript
  call dein#add('carlitux/deoplete-ternjs')
  call dein#add('ternjs/tern_for_vim')
  call dein#add('Quramy/tsuquyomi')
  call dein#add('othree/yajs.vim')
  call dein#add('othree/javascript-libraries-syntax.vim')
  call dein#add('othree/es.next.syntax.vim')
  call dein#add('mxw/vim-jsx')
  call dein#add('jparise/vim-graphql')

  " Go
  call dein#add('fatih/vim-go')

  " TypeScript
  call dein#add('mhartington/nvim-typescript')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/deoplete-typescript')

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

" Keybindings
" -----------------------------------

" Files
nnoremap <leader>fs :w<CR>

" Project Navigation
nnoremap <leader>pt :NERDTreeToggle<CR>
nnoremap <leader>pb :Denite buffer<CR>
nnoremap <leader>pf :Denite file_rec<CR>
nnoremap <C-p> :Denite file_rec<CR>

" Search
nnoremap <leader>sc :noh<CR>
nnoremap <leader>sp :Denite grep<CR>

" Movement
map  <Leader>jw <Plug>(easymotion-bd-w)
nmap <Leader>jw <Plug>(easymotion-overwin-w)

" Git
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>

" Buffers
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

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

" Dein pane movement
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')


" Configuration
" ----------------------------------------

let mapleader=" "

filetype plugin indent on
syntax on

set relativenumber

set shiftwidth=2
set tabstop=2
set expandtab

" Colors
set background=dark
colorscheme NeoSolarized
let g:airline_theme='solarized'

" Plugin stuff
call denite#custom#var('file_rec', 'command',
        \ ['git', 'ls-files', '-co', '--exclude-standard'])

" Deoplete
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
let g:NERDTreeWinPos = 'right'

" Ale
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1

" Tsuquyomi
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

" Tern
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Typescript
let g:nvim_typescript#javsacript_support=1

" Markdown
autocmd BufRead,BufNewFile *.md set textwidth=80

" Startup
" -------------------------------------
packloadall
silent! helptags ALL
