" Install Plug
" ----------------------------------------------
if has('vim_starting')
  set nocompatible
endif

if has('python3')
  silent! python3 1
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

" Plugins
" ---------------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'lifepillar/vim-solarized8'
Plug 'Shougo/vimproc.vim', {'do': g:make}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" LSP / Languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/vim-goimports'
Plug 'mattn/emmet-vim'

" Writing
Plug 'junegunn/goyo.vim'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fszymanski/fzf-quickfix'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BuffersDelete call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

call plug#end()

" Settings
" ----------------------------------------------
let mapleader=' '

filetype plugin indent on
syntax on

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set bomb
set binary
set ttyfast
set backspace=indent,eol,start
set hidden

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap

" Make vim more responsive
set updatetime=500
set balloondelay=250

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Directories for swp files
set nobackup
set nowritebackup
set noswapfile

set fileformats=unix,dos,mac

set noerrorbells visualbell t_vb=

" set shell=/bin/sh
set shell=/usr/local/bin/fish

set ruler
set relativenumber
set number
set signcolumn=number "combines sign and number columns

let no_buffers_menu=1

set t_Co=256

" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

" Status bar
set laststatus=2
set modeline
set modelines=10
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='light'
let g:airline_highlighting_cache=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
let g:airline_skip_empty_sections = 1
let g:airline_symbols = {}

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 40
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" git
let g:github_enterprise_urls = ['https://github.cms.gov']

" Do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Default buffers to markdown
autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif

set autoread

" Keybindings
" -------------------------------------------------------------
nnoremap ; :

" Files
nnoremap <leader>fs :w<CR>
nnoremap <leader>fN :new<CR>
nnoremap <leader>fn :vnew<CR>
nnoremap <leader>fr :e<CR>
nnoremap <leader>fR :e!<CR>
nnoremap <leader>fe :e .<CR>

" Commenting
nnoremap <leader>c :Commentary<CR>
vmap <leader>c :Commentary<CR>

" Windows / Buffers / Tabs
nnoremap <leader>wd :q<CR>
nnoremap <leader>w/ :vsp<CR>
nnoremap <leader>w? :sp<CR>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>bd :bd<CR>
nnoremap <leader>BX :bufdo bd<CR>
nnoremap <leader>bD :BuffersDelete<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>T :tabnew<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>td :tabclose<CR>
nnoremap <leader>C :Commands<CR>

" Quickfix List
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qv :vert copen<CR><C-w>=
nnoremap <leader>qc :cclose<CR>
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>qp :cprev<CR>

" Location List
nnoremap <leader>lo :lopen<CR>
nnoremap <leader>lv :vert lopen<CR><C-w>=
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprev<CR>

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Project Navigation
nnoremap <leader>pt :NERDTreeToggle<CR>
nnoremap <leader>pT :e .<CR>
nnoremap <leader>pF :NERDTreeFind<CR>
nnoremap <leader>pb :Buffers<CR>
nnoremap <leader>pf :FZF -m<CR>
nnoremap <silent> <leader>pr <Plug>(coc-references)
nnoremap <silent> <leader>fd :<C-u>CocList outline<cr> " Search doc symbols
nnoremap <silent> <leader>pd :<C-u>CocList -I symbols<cr> " Search workspace symbols
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>hi :CocAction('doHover')<CR>
nnoremap <leader>pn :e NOTES.sethetter.md<CR>

" Search
nnoremap <leader>sc :let @/=""<CR>
nnoremap <leader>sp :Rg 
nnoremap <leader>sf "zyiw:exe ":let @/=@z"<CR>

" Movement
map <C-L> 20zl " Scroll 20 characters to the right
map <C-H> 20zh " Scroll 20 characters to the left

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv
nnoremap < <<
nnoremap > >>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Git
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gh :GitGutterLineHighlightsToggle<CR>
nnoremap <leader>gl :Commits<CR>
nnoremap <leader>go :Gbrowse<CR>
nnoremap <leader>gP :Gpush<CR>
nnoremap <leader>gL :Gpull<CR>
" trailing space intentional
nnoremap <leader>gd :Gvdiff 

" Notes / Writing
nnoremap <leader>ns :e SCRATCH.sethetter.md<CR>
nnoremap <leader>nn :e NOTES.sethetter.md<CR>
nnoremap <leader>fo :Goyo<CR>

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
noremap YY "+y<CR>
noremap XX "+x<CR>

" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <!-- <bang> -->0)
endif

" go
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2
" let g:go_fmt_command = "goimports"
" let g:go_def_mapping_enabled = 0 " Prevent vim-go from taking over gd mapping

" html
autocmd Filetype html setlocal ts=4 sw=4 expandtab
let g:user_emmet_leader_key='<C-x>'

" php
autocmd Filetype php setlocal ts=4 sw=4 expandtab

" javascript
let g:javascript_enable_domhtmlcss = 1
let g:javascript_plugin_flow = 1

" markdown
autocmd Filetype markdown setlocal wm=2 ts=2 sw=2 expandtab linebreak wrap
let g:vim_markdown_folding_disabled = 1
set conceallevel=2

" Colors
set termguicolors
colorscheme solarized8
set background=light
hi Search cterm=NONE ctermfg=white ctermbg=black

if filereadable(".vimrc.sethetter")
  source .vimrc.sethetter
endif
