set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'morhetz/gruvbox' 
Plugin 'tmhedberg/SimpylFold'
Bundle 'Valloric/YouCompleteMe'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set nu
set t_Co=256 
colorscheme default
set background=dark 
filetype plugin indent on
set tabstop=4
set expandtab
set shiftwidth=4

let python_highlight_all=1 
syntax on
:map <Leader>pp  :!python3 %<CR> 
:map <Leader>lpp :!clear; python3 %<CR> 
:map <Leader>ppt :!pytest<CR> 

set splitbelow 
set splitright 

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding of methods and classes
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
"nnoremap <space> za
nnoremap <tab> >>
vnoremap <tab> >> 
inoremap <C-w>l <esc><C-w>l i
inoremap <C-w>h <esc><C-w>h i
inoremap <C-V> <C-S-v>
" inoremap <C-S-v> <C-v>
" noremap <Up>    <Nop>
" noremap <Down>  <Nop>
" noremap <Left>  <Nop>
" noremap <Right> <Nop>
autocmd FileType py noremap - :.s/^/#/<Enter> 
autocmd FileType cpp noremap # :.s/^/\/\//<Enter> 

"au BufNewFile,BufRead *.py
au Filetype python
    \ setlocal autoindent
    \ | setlocal shiftwidth=4
    \ | setlocal expandtab
    \ | setlocal tabstop=4
    \ | setlocal fileformat=unix

set encoding=utf-8


let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Start NERDTree and put the cursor back in the other window.
"B
"autocmd VimEnter * NERDTree | wincmd p


" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"highlights all search results
set hlsearch

"turns highlights off by pressing n
nnoremap n :noh<return><esc>
