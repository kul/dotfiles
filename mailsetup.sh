#!/bin/sh
# DEPRECATED

# colorscheme setup
# git clone https://github.com/altercation/mutt-colors-solarized
ln -s `pwd`/external/mutt-colors-solarized-dark-16.muttrc ~/.mutt/mutt-colors-solarized-dark-16.muttrc
ln -s `pwd`/external/mutt-colors-solarized-light-16.muttrc ~/.mutt/mutt-colors-solarized-light-16.muttrc

sudo apt-get install mutt offlineimap msmtp urlview notmuch sqlite
mkdir -p ~/.mail
mkdir -p ~/.mutt/temp
ln -s `pwd`/.muttrc ~/.muttrc
ln -s `pwd`/.urlview ~/.urlview
ln -s `pwd`/.offlineimaprc ~/.offlineimaprc
ln -s `pwd`/external/mailcap ~/.mutt/mailcap
ln -s `pwd`/external/view_attachment.sh ~/.mutt/view_attachment.sh

ln -s `pwd`/.notmuch-config ~/.notmuch-config
cp ./external/mutt-notmuch-py.py ~/bin/mutt-notmuch-py
(crontab -l; cat mailcron) | crontab -
