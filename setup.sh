#!/bin/sh

basedir=`dirname $0`
if [ "$basedir" = "." ]; then
    directory=`pwd`
else
    directory="$(pwd)/$basedir"
fi

if [ ! -h "$HOME/.vim" ]; then
    ln -s "$directory/vim" "$HOME/.vim"
fi
if [ ! -h "$HOME/.vimrc" ]; then
    ln -s "$directory/vim/vimrc" "$HOME/.vimrc"
fi
if [ ! -h "$HOME/.gvimrc" ]; then
    ln -s "$directory/vim/gvimrc" "$HOME/.gvimrc"
fi
if [ ! -h "$HOME/.zshrc" ]; then
    ln -s "$directory/zsh.zshrc" "$HOME/.zshrc"
fi

# git setup
git config --global user.name 'dean'
git config --global user.email 'dean@deanproxy.com'
git config --global color.ui 'auto'
