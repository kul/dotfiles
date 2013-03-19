set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'derekwyatt/vim-scala'
Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }

let g:pathogen_disabled = []
"call add(g:pathogen_disabled, 'vinsime')
execute pathogen#infect('pathogen/{}')

syntax on
filetype plugin indent on
set tabstop=4 shiftwidth=4 expandtab softtabstop=4
set backspace=indent,eol,start
set number
set hidden
set tags=./tags;../*/tags;/
set runtimepath^=~/.vim/bundle/ctrlp.vim

set pastetoggle=<F2>
nnoremap <F2> :set nonumber!<CR>
nnoremap ; :
ino jj <esc>
cno jj <c-c>
nnoremap <C-n> :bn<CR>
nnoremap <C-x> :bd<CR>
map <C-i> :NERDTreeToggle<CR>
cmap w!! w !sudo tee % >/dev/null

set t_Co=16
set background=dark
colorscheme solarized

let mapleader=','

" plugins configurations
let g:jedi#popup_on_dot=0
