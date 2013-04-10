set nocp
call pathogen#infect('~/.vim/bundle')
syntax on
filetype plugin indent on
call pathogen#infect('~/.vim/bundle')
set t_Co=256
set noai
set vb
set binary noeol
set noexpandtab
set tabstop=4
set shiftwidth=4
set ruler
set number
set hlsearch
colorscheme delek
"colorscheme default
"colorscheme developer
"colorscheme void
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
au BufRead *.html set filetype=htmlm4
autocmd BufNewFile,BufRead *.scss set ft=scss.css

" Set Leader to ,
let mapleader = ","

" Powerline Settings
set rtp+=/usr/local/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set laststatus=2

" Sparkup Settings
let g:sparkup = 'bundle/sparkup/ftplugin/html/sparkup.py'
let g:sparkupExecuteMapping = ',e'

" Omnicomplete settings
set omnifunc=csscomplete#CompleteCSS

" vim-seek; disable 's' as substitute
let g:seek_subst_disable = 1

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
"Map ,t to :tabnew
nnoremap ,t <Esc>:tabnew<CR>
nnoremap ,n <Esc>:NT<CR>
nnoremap ,T <Esc>:TagbarToggle<CR>
