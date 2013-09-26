call pathogen#infect('~/.vim/bundle')

let mapleader = ","

color molokai

set nocp                      " non-vi compatible features
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
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

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

function MoveToPrevTab()
	" there is only one window
	if tabpagenr('$') == 1 && winnr('$') == 1
		return
	endif
	" preparing new window
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
	" opening current buffer in new window
	exe "b".l:cur_buf
endfunc

function MoveToNextTab()
	" there is only one window
	if tabpagenr('$') == 1 && winnr('$') == 1
		return
	endif
	" preparing new window
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
	" opening current buffer in new window
	exe "b".l:cur_buf
endfunc

" Combine Tabs w/ Horizontal Split
nnoremap <C-m> :call MoveToNextTab()<CR>
nnoremap <C-b> :call MoveToPrevTab()<CR>
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
" Other Shortcuts
nnoremap <leader>t <Esc>:tabnew<CR>
nnoremap <leader>n <Esc>:NERDTreeToggle<CR>
nnoremap <leader>T <Esc>:TagbarToggle<CR>
nmap <C-s> :CtrlPBufTagAll<CR>

"Load local vimrc
if filereadable(glob("./.vimrc.local")) 
  source ./.vimrc.local
endif
