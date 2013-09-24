call pathogen#infect('~/.vim/bundle')

" Other color schemes I like: delek, default, jellybeans, developer, void
color molokai
set nocp
syntax on
filetype plugin indent on
set t_Co=256
set noai
set vb
set binary noeol
set expandtab
set tabstop=2
set shiftwidth=2
set ruler
set relativenumber
set hlsearch
" Set modifiable so NERDTree can create new nodes and stuff
set modifiable
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
au BufRead *.html set filetype=htmlm4
autocmd BufNewFile,BufRead *.scss set ft=scss.css
au BufRead,BufNewFile *.md set filetype=markdown

" Set Leader to ,
let mapleader = ","

set laststatus=2

" NeoComplCache
let g:neocomplcache_enable_at_startup = 1

" Sparkup Settings
let g:sparkup = 'bundle/sparkup/ftplugin/html/sparkup.py'
let g:sparkupExecuteMapping = ',e'

" Omnicomplete settings
set omnifunc=csscomplete#CompleteCSS

" vim-seek; disable 's' as substitute
let g:seek_subst_disable = 1

" put useful info in status bar
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" CtrlP settings
" Opens CtrlP selection in new tab
"let g:ctrlp_prompt_mappings = {
    "\ 'AcceptSelection("e")': [],
    "\ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
    "\ }

ca formatjson %!python -m json.tool

" These functions are because I sometimes remote in from a tablet without 'esc'
" In that case, I call this function, then use 'jk' to esc
function TabletModeOn()
	inoremap jk <esc>
	cnoremap jk <c-c>
	vnoremap v <esc>
endfunc
function TabletModeOff()
	inoremap jk jk
	cnoremap jk jk
	vnoremap v v
endfunc
command TabletOn :call TabletModeOn()<CR>
command TabletOff :call TabletModeOff()<CR>

command NT NERDTreeToggle
function MoveToPrevTab()
	"there is only one window
	if tabpagenr('$') == 1 && winnr('$') == 1
		return
	endif
	"preparing new window
	let l:tab_nr = tabpagenr('$')
	let l:cur_buf = bufnr('%')
	if tabpagenr() != 1
		close!
		if l:tab_nr == tabpagenr('$')
			tabprev
		endif
		sp
	else
		close!
		exe "0tabnew"
	endif
	"opening current buffer in new window
	exe "b".l:cur_buf
endfunc

function MoveToNextTab()
	"there is only one window
	if tabpagenr('$') == 1 && winnr('$') == 1
		return
	endif
	"preparing new window
	let l:tab_nr = tabpagenr('$')
	let l:cur_buf = bufnr('%')
	if tabpagenr() < tab_nr
		close!
		if l:tab_nr == tabpagenr('$')
			tabnext
		endif
		sp
	else
		close!
		tabnew
	endif
	"opening current buffer in new window
	exe "b".l:cur_buf
endfunc

"Combine Tabs w/ Horizontal Split
nnoremap <C-m> :call MoveToNextTab()<CR>
nnoremap <C-b> :call MoveToPrevTab()<CR>
"Remap C-h,j,k,l for Movement Between Panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"Fugitive shortcuts
nnoremap ,gs <Esc>:Gstatus<CR>
nnoremap ,gd <Esc>:Gdiff<CR>
nnoremap ,gc <Esc>:Gcommit<CR>
nnoremap ,gb <Esc>:Gblame<CR>
nnoremap ,gl <Esc>:Glog<CR>
nnoremap ,gp <Esc>:Git push<CR>
"Map ,t to :tabnew
nnoremap ,t <Esc>:tabnew<CR>
nnoremap ,n <Esc>:NT<CR>
nnoremap ,T <Esc>:TagbarToggle<CR>
nmap <C-s> :CtrlPBufTagAll<CR>


"Load local vimrc
if filereadable(glob("./.vimrc.local")) 
  source ./.vimrc.local
endif
