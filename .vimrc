set encoding=utf-8
set fileencoding=utf-8
set nocompatible
filetype off
filetype plugin indent off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-ragtag'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-markdown'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'gregsexton/MatchTag'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'LaTeX-Box'
Plugin 'myusuf3/numbers.vim'
Plugin 'ervandew/screen'
Plugin 'jcfaria/Vim-R-plugin'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Raimondi/delimitMate'
Plugin 'itchyny/calendar.vim'
Plugin 'szw/vim-g'
Bundle 'kshenoy/vim-signature'

" Clojure
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'gcmt/wildfire.vim'
Plugin 'tpope/timl'

" Lua
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-lua-ftplugin'

" color scheme
Plugin 'flazz/vim-colorschemes'

let g:pathogen_disabled = []
" call add(g:pathogen_disabled, 'vim-classpath')
execute pathogen#infect('pathogen/{}')

syntax on
filetype plugin indent on
set smartindent
set expandtab
autocmd FileType python setl tabstop=4 shiftwidth=4 softtabstop=4
set tabstop=2 shiftwidth=2 softtabstop=2
set backspace=indent,eol,start
set number
set hidden
set incsearch
set history=1000
set tags=./tags,../**/tags
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
set foldmethod=marker
set foldcolumn=3
set foldlevel=99
nnoremap <space> za
vnoremap <space> zf

set pastetoggle=<F2>
vnoremap <C-c> "+y
nnoremap <F2> :set nonumber!<CR>
nnoremap ; :
inoremap kj <esc>
cnoremap kj <c-c>
nnoremap <C-n> :bn<CR>
nnoremap <C-b> :bp<CR>
nnoremap <C-x> :bd<CR>
cmap w!! w !sudo tee % >/dev/null

" set t_Co=256
set background=dark
colorscheme solarized
highlight SignColumn ctermbg=8
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:.
set linebreak
set showbreak=↪
set wrap
set textwidth=80
set colorcolumn=+1
set nosol
set synmaxcol=300

let mapleader=','
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

" Ignore tags in completion
set dictionary+=/usr/share/dict/words
set complete-=t
au FileType markdown set ignorecase infercase complete+=k
let g:tagbar_ctags_bin='/usr/bin/ctags-exuberant'

" Plugins Configurations

" Nerdtree
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeToggle<CR>

" vim r plugin
autocmd FileType r vmap <Space> <Plug>RDSendSelection
autocmd FileType r nmap <Space> <Plug>RDSendLine
let vimrplugin_notmuxconf = 1
let vimrplugin_tmux = 0

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key="<C-m>"
let g:multi_cursor_prev_key="<C-b>"
let g:multi_cursor_skip_key="<C-q>"
let g:multi_cursor_quit_key="<Esc>"

" indent guides
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" powerline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" rainbow parantheses
nnoremap <Leader>r :RainbowParenthesesToggle<CR>
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" commandt
set wildignore+=*.class,*.jar

" latex box
let g:LatexBox_latexmk_options = "-pdf"
let g:tex_comment_nospell=1

" numbers
nnoremap <F3> :NumbersToggle<CR>

" screen plugin
let g:ScreenImpl='GnuScreen'
nnoremap <Leader>im V:ScreenSend<CR>j<C-e>
vmap <Leader>m :ScreenSend<CR>

" r plugin
let vimrplugin_tmux=1
let vimrplugin_assign=0
au FileType R vmap <Space> <Plug>RDSendSelection
au FileType R nmap <Space> <Plug>RDSendLine

" git
nnoremap ,gd :Gdiff<CR>
nnoremap ,gs :Gstatus<CR>

" python
let g:jedi#popup_on_dot=0
let g:jedi#use_tabs_not_buffers = 0
" autocmd BufWritePost *.py call Flake8()

" clojure
augroup filetype_clojure
    autocmd!
    autocmd FileType clojure nnoremap <Leader>sh :Slamhound<CR>
    autocmd FileType clojure syntax keyword ClojureFunction fn conceal cchar=λ
    autocmd FileType clojure hi! link Conceal ClojureFunction
    autocmd FileType clojure setlocal conceallevel=2
augroup END

" pandoc , markdown
command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'
nmap <Leader>pc :RunSilent pandoc -o /tmp/vim-pandoc-out.html %<CR>
nmap <Leader>pp :RunSilent gnome-open /tmp/vim-pandoc-out.html<CR>

" lua
let g:lua_compiler_name='luajit'
let g:lua_compiler_args='-b -l'
let g:lua_error_format='luajit: %f:%l: %m'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap <Leader>a :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Google
nnoremap <Leader>go :Google "<C-R><C-W>"<CR>
