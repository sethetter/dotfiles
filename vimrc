if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'L9'
NeoBundle 'bling/vim-airline'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/genutils'
NeoBundle 'mattn/gist-vim'
NeoBundle 'intuited/lh-vim-lib'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'int3/vim-taglist-plus'
NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'michalliu/jsruntime.vim'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'groenewege/vim-less'
NeoBundle 'goldfeld/vim-seek'
NeoBundle 'tristen/vim-sparkup'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-surround'
NeoBundle 'xolox/vim-misc'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

let mapleader = ","

syntax on                     " syntax highlighting

" set main theme and airline theme
set background=dark
colorscheme solarized
hi Normal ctermbg=NONE
let g:airline_theme='solarized'

filetype plugin indent on     " filetype specific indentation
set t_Co=256                  " 256 colors
set ai                        " auto indenting
set vb                        " use visual bell instead of a beep
set expandtab                 " spaces instead of tabs
set tabstop=2                 " tabs are two spaces wide
set shiftwidth=2              " indent by two spaces
set ruler                     " show cursor position info
set hlsearch                  " highlight search terms
set modifiable                " set modifiable so NERDTree can modify files
set laststatus=2
set softtabstop=2             " how far to backspace over tabs
set backspace=indent,eol,start
set number
set nowrap

" swap files
set directory=~/.vim/.cache/swap
"set noswapfile

autocmd BufNewFile,BufRead *.scss set ft=scss.css     " highlight scss as css
autocmd BufRead,BufNewFile *.md set filetype=markdown " recognize .md as markdown

" Sparkup Settings
let g:sparkupMappingInsertModeOnly = 1
let g:sparkupDoubleQuote = 1

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['html', 'cucumber', 'feature', 'scss', 'sass'] }

" Taglist
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50
let Tlist_Inc_Winwidth = 0

" vim-seek; disable 's' as substitute
let g:seek_subst_disable = 1

" set up some custom colors
"highlight diffchange   term=reverse cterm=bold ctermbg=cyan ctermfg=black
"highlight difftext     term=reverse cterm=bold ctermbg=gray ctermfg=black
"highlight diffdelete   term=reverse cterm=bold ctermbg=red ctermfg=black
"highlight incsearch    ctermbg=0    ctermfg=3
"highlight search       ctermbg=0    ctermfg=9
"highlight visual       ctermbg=3    ctermfg=0
"highlight pmenu        ctermbg=240  ctermfg=12
"highlight pmenusel     ctermbg=0    ctermfg=3
"highlight spellbad     ctermbg=0    ctermfg=1


map ; :
noremap ;; :

" Remap C-h,j,k,l for Movement Between Panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Fugitive shortcuts
nnoremap <leader>gs <Esc>:Gstatus<CR>
nnoremap <leader>gd <Esc>:Gdiff<CR>
nnoremap <leader>gc <Esc>:Gcommit<CR>
nnoremap <leader>gb <Esc>:Gblame<CR>
nnoremap <leader>gl <Esc>:Glog<CR>
nnoremap <leader>gp <Esc>:Git push<CR>
nnoremap <leader>gu <Esc>:Git pull<CR>

" Unite
let g:unite_prompt='» '
let g:unite_data_directory='~/.vim/cache/unite'
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_source_file_rec_max_cache_files = 100000000

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
      \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
      \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

"nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  -start-insert buffer<cr>
nnoremap <leader>/ :<C-u>Unite -no-split -buffer-name=grep    -start-insert grep:.<cr>

set wildignore+=.git*
set wildignore+=*node_modules*
set wildignore+=*bower_components*
set wildignore+=*.bower-cache*
set wildignore+=*.bower-registry*
set wildignore+=*.vagrant*
set wildignore+=*.sass-cache*
set wildignore+=*tmp*

" Tell Unite to ignore certain folders for file_rec search
call unite#custom_source('file,file/new,buffer,file_rec', 'ignore_pattern', escape(substitute(join(split(&wildignore, ","), '\|'), '**/\?', "", "g"), '.'))

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  imap <buffer> <esc> <Plug>(unite_exit)
  nmap <buffer> <esc> <Plug>(unite_exit)
endfunction

" Other Shortcuts
nnoremap <C-t> <Esc>:tabnew<CR>
nnoremap <leader>n <Esc>:NERDTreeToggle<CR>
nnoremap <leader>T <Esc>:TlistToggle<CR>

"Load local vimrc
if filereadable(glob("./.vimrc.local"))
  source ./.vimrc.local
endif

NeoBundleCheck
