call plug#begin()
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/denite.nvim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'mattn/emmet-vim' 
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-repeat' 
Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-commentary' 
Plug 'tpope/vim-vinegar' 
Plug 'justinmk/vim-sneak'
Plug 'Raimondi/delimitMate' 
Plug 'digitaltoad/vim-pug'  
Plug 'Valloric/MatchTagAlways'  
Plug 'pangloss/vim-javascript'  
Plug 'mxw/vim-jsx'  
Plug 'ervandew/supertab'
Plug 'hail2u/vim-css3-syntax'
Plug 'w0rp/ale'
Plug 'junegunn/seoul256.vim'
call plug#end()

set hidden

set undofile
set undodir=~/.undo

colo seoul256

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

" easy yank from system clipboard
noremap <enter>y "+y
noremap <enter>p "+p
noremap <enter>P "+P

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

" show white space 
set listchars=tab:>~,nbsp:_,trail:.
set list

let g:deoplete#enable_at_startup = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [ 'jsx', 'javascript.jsx', 'vue']

let g:javascript_enable_domhtmlcss = 1 
let g:jsx_ext_required = 0

autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsSnippetDirectories=[$HOME.'/UltiSnips/']

call denite#custom#var('grep', 'command', ['ack'])

nnoremap <C-p> :<C-u>Denite file_rec<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>

let g:sneak#label = 1
