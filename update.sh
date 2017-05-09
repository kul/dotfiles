#!/bin/sh
# DEPRECATED

# stash changes 
git stash

# update yourself
git pull

curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

update_git_repos() {
    # updates children directories inside $1
    wd=`pwd`
    for dir in `ls -d $1/*/`;
    do
        cd $dir
        if [ -d '.git' ]; then
            echo "Syncing $dir"
            git pull
        else
            echo '$dir doesnt seems to be a git repo, please update manually.'
        fi
    done
    cd $wd
}

# update pathogen repos
echo 'Updating pathogen repos..'
update_git_repos ~/.vim/pathogen
update_git_repos ~/.vim/bundle

echo 'Please merge your stashed changes if any.'

