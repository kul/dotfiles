#!/bin/bash
cd ~/.vim/pathogen/

plugins="
https://github.com/nathanaelkane/vim-indent-guides.git,n
https://github.com/terryma/vim-multiple-cursors.git,y
"

for plugin in $plugins; do
    echo $plugin
    echo -------
done
