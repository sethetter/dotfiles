if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/genutils'
NeoBundle 'mattn/gist-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'othree/javascript-libraries-syntax'
NeoBundle 'ns9tks/vim-l9'
NeoBundle 'intuited/lh-vim-lib'
NeoBundle 'vim-scripts/listmaps.vim'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'godlygeek/tabular'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'groenewege/vim-less'
NeoBundle 'goldfeld/vim-seek'
NeoBundle 'rstacruz/sparkup'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/webapi-vim'

let mapleader = ","

color molokai

syntax on                     " syntax highlighting
filetype plugin indent on     " filetype specific indentation
set t_Co=256                  " 256 colors
set noai                      " no auto indenting
set vb                        " use visual bell instead of a beep
set expandtab                 " spaces instead of tabs
set tabstop=2                 " tabs are two spaces wide
set shiftwidth=2              " indent by two spaces
set ruler                     " show cursor position info
set hlsearch                  " highlight search terms
set modifiable                " set modifiable so NERDTree can modify files
set laststatus=2

" swap files
set directory=~/.vim/.cache/swap
set noswapfile

autocmd BufNewFile,BufRead *.scss set ft=scss.css     " highlight scss as css
autocmd BufRead,BufNewFile *.md set filetype=markdown " recognize .md as markdown

" NeoComplCache
let g:neocomplcache_enable_at_startup = 1

" Sparkup Settings
let g:sparkup = 'bundle/sparkup/ftplugin/html/sparkup.py'
let g:sparkupExecuteMapping = ',e'

" vim-seek; disable 's' as substitute
let g:seek_subst_disable = 1

" put useful info in status bar
set statusline=%f%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

" set up some custom colors
highlight clear SignColumn
highlight DiffAdd      term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange   term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText     term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete   term=reverse cterm=bold ctermbg=red ctermfg=black
highlight CursorLineNr ctermbg=236  ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238  ctermfg=0
highlight StatusLine   ctermbg=250  ctermfg=235
highlight IncSearch    ctermbg=0    ctermfg=3
highlight Search       ctermbg=0    ctermfg=9
highlight Visual       ctermbg=3    ctermfg=0
highlight Pmenu        ctermbg=240  ctermfg=12
highlight PmenuSel     ctermbg=0    ctermfg=3
highlight SpellBad     ctermbg=0    ctermfg=1
 
" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermbg=2 ctermfg=235
  au InsertLeave * hi StatusLine ctermfg=235 ctermbg=250
endif

ca formatjson %!python -m json.tool

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

" Unite settings
let g:unite_data_directory='~/.vim/cache/unite'
let g:unite_prompt='» '
let g:unite_source_history_yank_enable = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
let g:unite_enable_start_insert = 1
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>y :<C-u>Unite -buffer-name=yank    history/yank<cr>
nnoremap <leader>b :<C-u>Unite -buffer-name=buffer  buffer<cr>
nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>
nnoremap <leader>e :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color -a'
  let g:unite_source_grep_recursive_opt=''
endif

" Other Shortcuts
nnoremap <C-t> <Esc>:tabnew<CR>
nnoremap <leader>n <Esc>:NERDTreeToggle<CR>
nnoremap <leader>T <Esc>:TagbarToggle<CR>
nmap <C-s> :CtrlPBufTagAll<CR>

"Load local vimrc
if filereadable(glob("./.vimrc.local")) 
  source ./.vimrc.local
endif
