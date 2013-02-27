#!/bin/sh

#pathogen setup
mkdir -p ~/.vim/pathogen ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#vundle setup
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#vim pathogen plugins 
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/pathogen/vim-colors-solarized
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/pathogen/ctrlp.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pathogen/nerdtree

#oh my zsh setup
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

ln -s `pwd`/.vimrc ~/.vimrc 
ln -s `pwd`/.zshrc ~/.zshrc 
ln -s `pwd`/.screenrc ~/.screenrc 
ln -s `pwd`/.ctags ~/.ctags 
ln -s `pwd`/.minttyrc ~/.minttyrc 
cp .envrc ~/.envrc 

echo 'Setup done.'
