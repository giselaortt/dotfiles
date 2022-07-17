set nu
set t_Co=256 
set rtp+=$HOME/.vim/bundle/Vundle.vim 
call vundle#begin() 
Plugin 'gmarik/Vundle.vim' 
Plugin 'morhetz/gruvbox' 
call vundle#end() 
colorscheme default
set background=dark 
filetype plugin indent on
set tabstop=4
set expandtab
set shiftwidth=4
syntax on

let python_highlight_all=1 
:map <Leader>pp  :!python3 %<CR> 
:map <Leader>lpp :!clear; python3 %<CR> 
:map <Leader>ppt :!pytest<CR> 

set splitbelow 
set splitright 

vnoremap « <<
nnoremap « <<
nnoremap <tab> >>
vnoremap <tab> >> 
vnoremap » >> 
nnoremap » >> 
