set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Bundle 'gmarik/vundle'
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'

execute pathogen#infect('pathogen/{}')

syntax on
filetype plugin indent on
set tabstop=4 shiftwidth=4 expandtab softtabstop=4
set number
set pastetoggle=<F2>
nnoremap <F2> :set nonumber!<CR>
nnoremap ; :
ino jj <esc>
cno jj <c-c>
nnoremap <C-n> :bn<CR>
cmap w!! w !sudo tee % >/dev/null

set t_Co=16
set background=dark
colorscheme solarized

let mapleader=','
