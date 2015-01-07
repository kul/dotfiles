#!/bin/sh

scriptdir=$(pwd)

#pathogen setup
mkdir -p ~/.vim/pathogen ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#vundle setup
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#vim pathogen plugins
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/pathogen/vim-colors-solarized
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pathogen/nerdtree

#oh my zsh setup
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

backup_date=$(date +"%m-%d-%Y_%T")

backup_dotfiles() {

    mkdir -p ~/dotfbkp_$backup_date

    while [ $# -ne 0 ]; do
        mv ~/$1 ~/dotfbkp_$backup_date
        ln -s `pwd`/$1 ~/$1
        shift
    done
}

backup_dotfiles .vimrc .zshrc .screenrc .ctags .minttyrc .tmux.conf

if [ ! -e ~/.envrc ]; then
    cp .envrc ~/.envrc;
fi


# solarized and dircolors setup for ubuntu
platform=`uname`
if [ $platform = 'Linux' ]; then
    git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git
    cd gnome-terminal-colors-solarized
    ./solarize
    cp solarize ~/bin
    cp external/dircolors.256dark ~/.dir_colors
fi


# fonts
mkdir -p ~/.fonts
cd ~/.fonts
cp "$scriptdir/external/Hermit*.otf" .
fc-cache -vf ~/.fonts

# liquid prompt
mkdir -p ~/bin
cd ~/bin
wget https://raw.github.com/nojhan/liquidprompt/master/liquidprompt

vim +BundleInstall +qall
echo 'Setup done.'
