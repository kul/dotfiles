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

backup_date=$(date +"%m-%d-%Y_%T")

backup_dotfiles() {

    mkdir -p ~/dotfbkp_$backup_date

    while [ $# -ne 0 ]; do
        cp ~/$1 ~/dotfbkp_$backup_date
        rm ~/$1
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
    wget https://raw.github.com/seebi/dircolors-solarized/master/dircolors.256dark
    mv dircolors.256dark ~/.dir_colors
fi


# vim powerline setup for Ubuntu
mkdir -p ~/.fonts
cd ~/.fonts
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
fc-cache -vf ~/.fonts
mkdir -p ~/.fonts.conf.d
cd ~/.fonts.conf.d
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

# liquid prompt
mkdir -p ~/bin
cd ~/bin
wget https://raw.github.com/nojhan/liquidprompt/master/liquidprompt

echo 'Setup done.'
