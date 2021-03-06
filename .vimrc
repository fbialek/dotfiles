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
Plugin 'Valloric/MatchTagAlways'  
Plugin 'Valloric/YouCompleteMe'  
Plugin 'vimwiki/vimwiki'  
Plugin 'SirVer/ultisnips'  
Plugin 'pangloss/vim-javascript'  
Plugin 'mxw/vim-jsx'  
Plugin 'ervandew/supertab'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'junegunn/fzf'
Plugin 'w0rp/ale'
Plugin 'posva/vim-vue'
call vundle#end()

filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete
set encoding=utf-8
set fileencoding=utf-8

set t_ut=

" don't use colors on long lines
set synmaxcol=2120

colo gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark

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

inoremap fd <ESC>

" easy yank from system clipboard
noremap <enter>y "+y
noremap <enter>p "+p
noremap <enter>P "+P

set noswapfile
set nobackup
set nowb

" easy movement between splits
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" show white space 
set listchars=tab:>~,nbsp:_,trail:.
set list

"
let g:javascript_enable_domhtmlcss = 1 
" let g:javascript_ignore_javaScriptdoc = 1 
let g:jsx_ext_required = 0

autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" ycm options
let g:ycm_autoclose_preview_window_after_completion = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsSnippetDirectories=[$HOME.'/UltiSnips/']

" match tag config 
let g:mta_filetypes = { 'html': 1, 'php': 1}

au BufRead,BufNewFile *.scss *.sass set filetype=scss.css
au BufRead,BufNewFile *.jade set filetype=javascript
