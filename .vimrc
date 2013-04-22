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
Bundle 'airblade/vim-gitgutter'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Lokaltog/powerline'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'ack.vim'

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
set tags=./tags,../**/tags
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
set textwidth=80
set colorcolumn=+1

let mapleader=','
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>


" Plugins Configurations
let g:jedi#popup_on_dot=0
let g:jedi#use_tabs_not_buffers = 0

" vim r plugin
autocmd FileType r vmap <Space> <Plug>RDSendSelection
autocmd FileType r nmap <Space> <Plug>RDSendLine
let vimrplugin_notmuxconf = 1
let vimrplugin_tmux = 0

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key="<C-m>"
let g:multi_cursor_prev_key="<C-b>"
let g:multi_cursor_skip_key="<C-w>"
let g:multi_cursor_quit_key="<Esc>"

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" indent guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=green

" powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2

" ack
noremap <Leader>a :Ack <cword><CR>
