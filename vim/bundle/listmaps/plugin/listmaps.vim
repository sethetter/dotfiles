" File:		listmaps.vim
" Author:	Antony Scriven <ad_scriven@postmaster.co.uk>
" Last Change:	2003-11-18
" Version:	1.3
" Description:	:Listmaps lists all mappings in all sourced files in a
"		separate buffer.
" Changes:	1	Initial upload
"		1.1	Accidental commenting of the first line fixed!
"		1.2	Searching for maps sped up (Charles E. Campbell).
"			More incorrect matches pruned (Charles E. Campbell).
"			Reading in of files sped up.
"			Overall roughly a 4x speed increase.
"		1.3	The fact that this script doesn't work on my own .exrc
"			is finally bugging me enough to fix the problems.
"			The command that adds foldmarkers:
"			 - uses \d* instead of \d+ -- fixed,
"			 - {{{ foldmarkers are broken by maps in my .exrc that
"			   add these foldmarkers -- fixed.
"			I've also added a little syntax highlighting and I
"			also delete any scripts that don't define any maps.

if exists("loaded_listmaps") | finish | endif | let loaded_listmaps = 1

command! Listmaps :silent! call s:Listmaps()<CR>

fun! s:Listmaps()                                                         " <<<1

	" Initial settings                                                <<<2
	let saved_z = @z
	let saved_eventignore = &eventignore
	let saved_ignorecase = &ignorecase
	let saved_smartcase = &smartcase
	let saved_lazyredraw = &lazyredraw
	let saved_undolevels = &undolevels

	" Try to speed things up a little. I'm just guessing at which options
	" to set here.
	set lazyredraw eventignore=all undolevels=-1
	set noignorecase nosmartcase 

	" Generate file list in a new buffer                              <<<2
	redir! @z
	silent! scriptnames
	redir END

	new __Listmaps__
	setlocal noswapfile buftype=nofile nofoldenable
	0 put z
	g/^$/d
	let @z = saved_z
	%s/^/@#/
	" Read in and process files.                                      <<<2
	" Read in each file below where it's name is listed.
	g/^/ normal! $:exe "read " . expand("<cfile>")
	" We will mark all lines that we want to keep with @. There should be
	" no lines in a VimL script that start with @. We will then
	" delete the ones we don't want later. This is much quicker than using
	" v/.../.
	" Many globals condensed into one for speed -- Charles E. Campbell.
	g/^@\@!.*\(^\|\s\+\)["']\=\(map!\=\|[nvoilc]m\%[ap]\|no\%[remap]\|[nv]n\%[oremap]!\=\|no\%[remap]!\=\|[oilc]no\%[remap]\)\>/ s/^/@/
	" Delete all remaining lines
	v/^@/ d
	" Remove markers from lines.
	%s/^@#//
	%s/^@\s*/	 /
	" Remove some lines that we know won't be maps:
	" Comments
	g/^\s*"/ d
	" Syntax definintions -- Charles E. Campbell.
	g/^\s*\(syn\s\+keyword\|[ls]et\|call\s\)/ d
	" Add foldmarkers
	let padding = "                                                                                "
	g/^\s*\d\+: / s/$/\=strpart(padding, 0, 77 - col("$")) . '[[[1'
	" Restore settings etc.                                           <<<2
	let &eventignore = saved_eventignore
	let &ignorecase = saved_ignorecase
	let &smartcase = saved_smartcase
	let &lazyredraw = saved_lazyredraw
	let &undolevels = saved_undolevels
	setf vim
	setlocal foldmarker=[[[,]]]
	setlocal foldmethod=marker
	setlocal foldenable

	" Cosmetics.                                                      <<<2
	" Remove scripts that don't define maps.
	g/\v^\s*\d+: .*\[\[\[1(\n\s*\d+: .*\[\[\[1$|%$)/ delete
	hi listmaps_underline term=underline, cterm=underline gui=underline
	hi listmaps_filename  term=bold,underline cterm=bold,underline gui=bold,underline
	"Underline the script paths.
	syn match listmaps_underline   "\v^\s*\d+: .*\ze\[\[\[1\n%(\s*\d+)@!" 
	"Make the filename stand out a bit.
	syn match listmaps_filename "\v^\s*\d+: .*[\\/]\zs\f*\ze.*\[\[\[1\n%(\s*\d+)@!" containedin=listmaps_underline
	1
endfun

" vim: se fmr=<<<,>>> fdm=marker ts=8 sw=8 sts=0 noet :
