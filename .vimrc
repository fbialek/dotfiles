set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'mattn/emmet-vim' 
Plugin 'tpope/vim-surround' 
Plugin 'tpope/vim-repeat' 
Plugin 'tpope/vim-fugitive' 
Plugin 'tpope/vim-commentary' 
Plugin 'tpope/vim-vinegar' 
Plugin 'Raimondi/delimitMate' 
Plugin 'digitaltoad/vim-pug'  
Plugin 'ternjs/tern_for_vim'  
Plugin 'scrooloose/syntastic'  
Plugin 'Valloric/YouCompleteMe'  
Plugin 'vimwiki/vimwiki'  
Plugin 'ctrlpvim/ctrlp.vim'  
Plugin 'easymotion/vim-easymotion'  
Plugin 'SirVer/ultisnips'  
Plugin 'pangloss/vim-javascript'  
Plugin 'mxw/vim-jsx'  
Plugin 'ervandew/supertab'
call vundle#end()

filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete
set encoding=utf-8
set fileencoding=utf-8

set t_ut=

" don't use colors on long lines
set synmaxcol=2120
colo gurunew

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}[%l,%v][%p%%]\ 
hi StatusLine                  ctermfg=white     ctermbg=2     cterm=NONE
hi StatusLineNC                ctermfg=white     ctermbg=8     cterm=NONE 

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set tabstop=2 softtabstop=2 expandtab shiftwidth=2 
set number

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

inoremap jj <ESC>

set noswapfile
set nobackup
set nowb

"fold tag
nnoremap <leader>ft Vatzf

nnoremap ; :
vnoremap ; :
nnoremap <Space> ;
vnoremap <Space> ;

" easy movement between splits
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['jshint']

let g:javascript_enable_domhtmlcss = 1 
let g:javascript_ignore_javaScriptdoc = 1 
let g:jsx_ext_required = 0

" let g:UltiSnipsExpandTrigger="<c-b>"
" let g:UltiSnipsJumpForwardTrigger="<c-c>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ycm options
let g:ycm_autoclose_preview_window_after_completion = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<CR>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
