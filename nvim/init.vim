"dein Scripts-----------------------------
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
  call dein#add('arakashic/chromatica.nvim')
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })

  call dein#add('icymind/NeoSolarized')
  call dein#add('ap/vim-buftabline')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('myusuf3/numbers.vim')

  call dein#add('junegunn/vim-easy-align')
  call dein#add('justinmk/vim-sneak')

  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('scrooloose/nerdcommenter')

  call dein#add('carlitux/deoplete-ternjs')
  call dein#add('ternjs/tern_for_vim')
  call dein#add('fatih/vim-go')
  call dein#add('mhartington/nvim-typescript')
  call dein#add('Quramy/tsuquyomi')
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

"End dein Scripts-------------------------

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

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

let g:chromatica#libclang_path = '/usr/lib64/llvm'
let g:chromatica#enable_at_startup = 1

let g:NERDTreeWinPos = 'right'

let g:deoplete#sources#tss#javascript_support = 1

let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

autocmd BufRead,BufNewFile *.md set textwidth=80

" Keybindings
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <C-p> :Denite file_rec<CR>
nnoremap <leader>w :w<CR>

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>

nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

let g:nvim_typescript#javsacript_support=1
