#!/bin/sh

scriptdir=$(pwd)

# utils for gnome terminal colors
sudo apt-get install gconf2
sudo apt-get install dconf-cli
sudo apt-get install gnome-shell
sudo apt-get install gnome-terminal

# pathogen setup
mkdir -p ~/.vim/pathogen ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# vundle setup
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle

# zsh setup
sudo apt-get install zsh
git clone git://github.com/zsh-users/antigen.git
sudo chsh -s /bin/zsh

backup_date=$(date +"%m-%d-%Y_%T")

backup_dotfiles() {

    mkdir -p ~/dotfbkp_$backup_date

    while [ $# -ne 0 ]; do
        mv ~/$1 ~/dotfbkp_$backup_date
        ln -s `pwd`/$1 ~/$1
        shift
    done
}

backup_dotfiles .vimrc .zshrc .screenrc .ctags .minttyrc .tmux.conf .ideavimrc

if [ ! -e ~/.envrc ]; then
    cp .envrc ~/.envrc;
fi

# solarized and dircolors setup for ubuntu
platform=`uname`
if [ $platform = 'Linux' ]; then
    git clone https://github.com/dracula/gnome-terminal dracula-gnome-terminal
    cd dracula-gnome-terminal
    ./install.sh
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
cd ..

mkdir -p ~/.vim/tmp
vim +PluginInstall +qall
echo 'Setup done.'
