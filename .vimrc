set encoding=utf-8
set fileencoding=utf-8
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'derekwyatt/vim-scala'
Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }
Bundle 'tpope/vim-markdown'

let g:pathogen_disabled = []
" call add(g:pathogen_disabled, 'vinsime')
call add(g:pathogen_disabled, 'vim-classpath')
execute pathogen#infect('pathogen/{}')

syntax on
filetype plugin indent on
autocmd FileType scala,jade setl tabstop=2 shiftwidth=2 expandtab softtabstop=2
set tabstop=4 shiftwidth=4 expandtab softtabstop=4
set backspace=indent,eol,start
set number
set hidden
set tags=./tags,../**/tags,/
set runtimepath^=~/.vim/bundle/ctrlp.vim
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
vnoremap <space> zf

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
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

" plugins configurations
let g:jedi#popup_on_dot=0
let g:jedi#use_tabs_not_buffers = 0

autocmd FileType r vmap <Space> <Plug>RDSendSelection
autocmd FileType r nmap <Space> <Plug>RDSendLine
let vimrplugin_notmuxconf = 1
let vimrplugin_tmux = 0
