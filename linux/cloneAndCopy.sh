#! /bin/bash

# TODO: 
# create symlink to .zshrc
# configure zsh with my settings
# configure p10k theme

gitPersonal=$HOME/gitPersonal2

set -e

echo() {
    command echo ":: $*"
}

# if [ ! -d "$gitPersonal" ]; then
    echo "creating $gitPersonal folder if it does not exist"
    mkdir -p "$gitPersonal"
# fi

# if [ ! -d "$gitPersonal/dotfiles" ]; then 
    # check git installed 

    # mkdir -p "$gitPersonal/dotfiles"

    # git --version >> /dev/null
    if  git --version >> /dev/null ; then 
        if [ ! -d "$gitPersonal/dotfiles" ]; then 
            echo "cloning my dotfiles"
            git clone https://github.com/viniliuti/dotfiles.git "$gitPersonal/dotfiles"
        else 
            echo "dotfiles already exists"
            cd "$gitPersonal/dotfiles"
            git pull
        fi
    else
        echo "git not installed"
    fi 

# else 
#     echo "dotfiles already exist"
# fi
