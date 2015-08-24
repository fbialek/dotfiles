set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle.vim
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Buffergator'
Plugin 'itchyny/lightline.vim'
Plugin 'mattn/emmet-vim' 
Plugin 'tpope/vim-surround' 
Plugin 'Raimondi/delimitMate' 
Plugin 'unblevable/quick-scope'  
call vundle#end()

filetype plugin indent on

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
set encoding=utf-8
set fileencoding=utf-8

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" lightline plugin
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
if !has('gui_running')
	  set t_Co=256
  endif
" allow .hbs extension  files
au BufNewFile,BufRead *.hbs set filetype=html
  
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set number
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")s
" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
inoremap jj <ESC>
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if &term =~ "xterm\\|rxvt"
	" use an orange cursor in insert mode
	let &t_SI = "\<Esc>]12;orange\x7"
	" use a red cursor otherwise
	let &t_EI = "\<Esc>]12;red\x7"
	silent !echo -ne "\033]12;red\007"
	" reset cursor when vim exits
	autocmd VimLeave * silent !echo -ne "\033]112\007"
	" use \003]12;gray\007 for gnome-terminal
endif

if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

set relativenumber
set noswapfile
set nobackup
set nowb
nnoremap <leader>ft Vatzf
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
