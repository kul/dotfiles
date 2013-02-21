#!/bin/sh

#pathogen setup
mkdir -p ~/.vim/pathogen ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#vundle setup
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#vim colorscheme solarized setup
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/pathogen/vim-colors-solarized

#oh my zsh setup
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

ln -s `pwd`/.vimrc ~/.vimrc 
ln -s `pwd`/.zshrc ~/.zshrc 
ln -s `pwd`/.screenrc ~/.screenrc 

echo 'Setup done.'