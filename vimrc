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
Plug 'vim-scripts/grep.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'lifepillar/vim-solarized8'
Plug 'w0rp/ale'
Plug 'Shougo/vimproc.vim', {'do': g:make}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'

" Writing
Plug 'junegunn/goyo.vim'

" go
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" html
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" javascript / typescript
Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'

" php
Plug 'StanAngeloff/php.vim'

" fzf
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

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

set shell=/bin/sh

set ruler
set relativenumber
set number

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
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_symbols = {}

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 35
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" grep.vim
" TODO -- ignore gitignored files
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" git
let g:github_enterprise_urls = ['https://github.cms.gov']

" Do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

set autoread

" Keybindings
" -------------------------------------------------------------

" Files
nnoremap <leader>fs :w<CR>
nnoremap <leader>fr :e<CR>
nnoremap <leader>fR :e!<CR>
nnoremap <leader>fe :e .<CR>

" Commenting
nnoremap <leader>c :Commentary<CR>
vmap <leader>c :Commentary<CR>

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
nnoremap <leader>pr :ALEFindReferences<CR>
nmap gd :ALEGoToDefinition<CR>
nmap <leader>fh :ALEHover<CR>
nnoremap <leader>pn :e NOTES.sethetter.md<CR>

" Go
autocmd BufNewFile,BufRead *.go nmap <leader>fd :GoDecls<CR>
autocmd BufNewFile,BufRead *.go nmap <leader>dd <Plug>(go-doc-vertical)
autocmd BufNewFile,BufRead *.go nmap <leader>fh :GoInfo<CR>
autocmd BufNewFile,BufRead *.go nmap <leader>gE :GoIfErr<CR>

" Search
nnoremap <leader>sc :let @/=""<CR>
nnoremap <leader>sp :Rgrep<CR>
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

" Writing
nnoremap <Leader>fo :Goyo<CR>

" Git
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gh :GitGutterLineHighlightsToggle<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>go :Gbrowse<CR>
nnoremap <leader>gP :Gpush<CR>
nnoremap <leader>gL :Gpull<CR>
" trailing space intentional
nnoremap <leader>gd :Gvdiff 

" Buffers
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bf :ALEFix<CR>

" Notes
nnoremap <leader>ns :e SCRATCH.sethetter.md<CR>
nnoremap <leader>nn :e NOTES.sethetter.md<CR>

" Windows
nnoremap <leader>wd :q<CR>
nnoremap <leader>w/ :vsp<CR>
nnoremap <leader>w? :sp<CR>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

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

" Errors
nnoremap <leader>ee :ALEEnableBuffer<CR>
nnoremap <leader>et :ALEToggleBuffer<CR>
nnoremap <leader>eE :ALEEnable<CR>
nnoremap <leader>eT :ALEToggle<CR>

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
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif


" ALE
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
  \'javascript.jsx': ['tsserver', 'eslint'],
  \'javascript': ['tsserver', 'eslint'],
  \'typescript': ['tsserver', 'tslint'],
  \'rust': ['rls'],
  \'go': [],
  \}
let g:ale_fixers = {
  \'javascript': ['prettier', 'importjs', 'eslint'],
  \'typescript': ['tslint'],
  \'rust': ['rustfmt'],
  \'go': [],
  \}

" go
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2
let g:go_fmt_command = "goimports"

" haskell
let g:haskell_conceal_wide = 1
let g:haskell_multiline_strings = 1
let g:necoghc_enable_detailed_browse = 1
autocmd Filetype haskell setlocal omnifunc=necoghc#omnifunc

" html
autocmd Filetype html setlocal ts=4 sw=4 expandtab

" php
autocmd Filetype php setlocal ts=4 sw=4 expandtab

" javascript
let g:javascript_enable_domhtmlcss = 1
let g:javascript_plugin_flow = 1

" markdown
autocmd Filetype markdown setlocal wm=2 ts=2 sw=2 expandtab spell wrap linebreak

" Colors
set termguicolors
colorscheme solarized8
set background=light
hi Search cterm=NONE ctermfg=white ctermbg=black

if filereadable(".vimrc.sethetter")
  source .vimrc.sethetter
endif
