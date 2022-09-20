" This script contains mappings
"source ~/.vim/mapping.vim
" additional helper functions:
"source ~/.vim/functions.vim
"
" paste mode toggle (needed when using autoindent/smartindent)
" 
" 
"
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

imap <F12> <ESC>:call Circo()<CR>i
function! Circo()
	imap M М
	imap m м
	imap A А
	imap a а
	imap B Б
	imap b б
	imap V В
	imap v в
	imap C Ц
	imap c ц 
	imap D Д
	imap d д
	imap E Е
	imap e е
	imap F Ф
	imap f ф
	imap G Г
	imap g г
	imap H Х
	imap h х
	imap I И
	imap i и
	imap J Ј
	imap j ј
	imap K К
	imap k к
	imap L Л
	imap l л
	imap N Н
	imap n н
	imap O О
	imap o о
	imap P П
	imap p п
	imap R Р
	imap r р
	imap S С
	imap s с
	imap T Т
	imap t т
	imap U У
	imap u у
	imap Lj Љ
	imap LJ Љ
	imap lj љ
	imap NJ Њ
	imap Nj Њ
	imap nj њ
	imap CH Ћ
	imap Ch Ћ
	imap ch ћ
	imap CC Ч
	imap cc ч
	imap SS Ш
	imap ss ш
	imap DJ Ђ
	imap Dj Ђ
	imap dj ђ
	imap ZZ Ж
	imap Zz Ж
	imap zz ж
	imap <F12> <ESC>:call NoCirco()<CR>i
endfunction

function! NoCirco()
	iunmap M
	iunmap m
	iunmap A
	iunmap a
	iunmap B
	iunmap b
	iunmap V
	iunmap v
	iunmap C
	iunmap c
	iunmap D
	iunmap d
	iunmap E
	iunmap e
	iunmap F
	iunmap f
	iunmap G
	iunmap g
	iunmap H
	iunmap h
	iunmap I
	iunmap i
	iunmap J
	iunmap j
	iunmap K
	iunmap k
	iunmap L
	iunmap l
	iunmap N
	iunmap n
	iunmap O
	iunmap o
	iunmap P
	iunmap p
	iunmap R
	iunmap r
	iunmap S
	iunmap s
	iunmap T
	iunmap t
	iunmap U
	iunmap u
	iunmap LJ
	iunmap Lj
	iunmap lj
	iunmap NJ
	iunmap Nj
	iunmap nj
	iunmap CH
	iunmap Ch
	iunmap ch
	iunmap CC
	iunmap cc
	iunmap SS
	iunmap ss
	iunmap DJ
	iunmap Dj
	iunmap dj
	iunmap ZZ
	iunmap Zz
	iunmap zz
	imap <F12> <ESC>:call Circo()<CR>i
endfunction

