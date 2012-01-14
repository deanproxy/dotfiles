#!/bin/sh

directory="$(pwd)/$(dirname $0)"

ln -s "$directory/vim" "$HOME/.vim"
ln -s "$directory/vim/vimrc" "$HOME/.vimrc"
ln -s "$directory/zsh.zshrc" "$HOME/.zshrc"

if [ `uname` = "Linux" ]; then
    ln -s "$directory/vim/gvimrc" "$HOME/.gvimrc"
fi

# git setup
git config --global user.name 'dean'
git config --global user.email 'dean@deanproxy.com'
git config --global color.ui 'auto'
