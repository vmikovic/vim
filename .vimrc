set hidden
set title
set noexpandtab
set tabstop=8
set softtabstop=8
set shiftwidth=8

set nocompatible
set showcmd

" reset to vim-defaults
if &compatible          " only if not set before:
	set nocompatible      " use vim-defaults instead of vi-defaults (easier, more user friendly)
endif

" display settings
set background=dark     " enable for dark terminals
set nowrap              " dont wrap lines
set scrolloff=2         " 2 lines above/below cursor when scrolling
set number              " show line numbers
set showmatch           " show matching bracket (briefly jump)
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set wildmenu            " completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2        " use 2 lines for the status bar
set matchtime=2         " show matching bracket for 0.2 seconds
set matchpairs+=<:>     " specially for html

" editor settings
set esckeys             " map missed escape sequences (enables keypad keys)
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set smartindent         " smart auto indenting
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode
"set expandtab           " turn a tabs into spaces
set fileformat=unix     " file mode is unix
"set fileformats=unix,dos    " only detect unix file format, displays that ^M with dos files

" system settings
set lazyredraw          " no redraws in macros
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=50          " keep 50 lines of command history
set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode



" color settings (if terminal/gui supports it)
if &t_Co > 2 || has("gui_running")
	syntax on          " enable colors
	set hlsearch       " highlight search (very useful!)
	set incsearch      " search incremently (search while typing)
	set t_Co=256   " This is may or may not needed.

	set background=dark
	colorscheme PaperColor
	set laststatus=2
endif
source ~/.vim/mapping.vim

" Use of the filetype plugins, auto completion and indentation support
filetype plugin indent on

" file type specific settings
if has("autocmd")
	" For debugging
	"set verbose=9

	" if bash is sh.
	let bash_is_sh=1

	" change to directory of current file automatically
	autocmd BufEnter * lcd %:p:h

	" Put these in an autocmd group, so that we can delete them easily.
	augroup mysettings
		au FileType xslt,xml,css,html,xhtml,javascript,sh,config,c,cpp,docbook set smartindent shiftwidth=2 softtabstop=2 expandtab
		au FileType tex set wrap shiftwidth=2 softtabstop=2 expandtab

		" Confirm to PEP8
		au FileType python set tabstop=4 softtabstop=4 expandtab shiftwidth=4 cinwords=if,elif,else,for,while,try,except,finally,def,class
	augroup END

	augroup perl
		" reset (disable previous 'augroup perl' settings)
		au!

		au BufReadPre,BufNewFile
					\ *.pl,*.pm
					\ set formatoptions=croq smartindent shiftwidth=2 softtabstop=2 cindent cinkeys='0{,0},!^F,o,O,e' " tags=./tags,tags,~/devel/tags,~/devel/C
		" formatoption:
		"   t - wrap text using textwidth
		"   c - wrap comments using textwidth (and auto insert comment leader)
		"   r - auto insert comment leader when pressing <return> in insert mode
		"   o - auto insert comment leader when pressing 'o' or 'O'.
		"   q - allow formatting of comments with "gq"
		"   a - auto formatting for paragraphs
		"   n - auto wrap numbered lists
		"
	augroup END


	" Always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside
	" an event handler (happens when dropping a file on gvim).
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\   exe "normal g`\"" |
				\ endif

endif " has("autocmd")

""""""""""Podrska za screen terminal mux""""""""""""""""""""""""""""""

function Send_to_Screen(text)
  if !exists("g:screen_sessionname") || !exists("g:screen_windowname")
    call Screen_Vars()
  end

  echo system("screen -S " . g:screen_sessionname . " -p " . g:screen_windowname . " -X stuff '" . substitute(a:text, "'", "'\\\\''", 'g') . "'")
endfunction

function Screen_Session_Names(A,L,P)
  return system("screen -ls | awk '/Attached/ {print $1}'")
endfunction

function Screen_Vars()
  if !exists("g:screen_sessionname") || !exists("g:screen_windowname")
    let g:screen_sessionname = ""
    let g:screen_windowname = "0"
  end

  let g:screen_sessionname = input("session name: ", "", "custom,Screen_Session_Names")
  let g:screen_windowname = input("window name: ", g:screen_windowname)
endfunction

vmap <C-c><C-c> "ry :call Send_to_Screen(@r)<CR>
nmap <C-c><C-c> vip<C-c><C-c>

nmap <C-c>v :call Screen_Vars()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Koristim VIM native podrsku za plugin ove
"
""call plug#begin('~/.vim/plugged')
"  Plug 'godlygeek/tabular'
"  Plug 'preservim/vim-markdown'
"call plug#end()
"
"  Plug 'mattn/emmet-vim'
"
"  =================== Status Line =================

set laststatus=2
set statusline=
"set statusline+=%1*
set statusline+=%m
set statusline+=:
set statusline+=%f
set statusline+=:
set statusline+=%c
set statusline+=:
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=:
set statusline+=%P
set statusline+=%=
set statusline+=%{StatuslineMode()}
set statusline+=\.
set statusline+=%n
set statusline+=\.
set statusline+=%r
"hi User1 ctermfg=darkcyan ctermbg=black guibg=black guifg=lightcyan

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction
