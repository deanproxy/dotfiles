#!/bin/sh

directory="$(pwd)/$(dirname $0)"

ln -s "$directory/vim" "$HOME/.vim"
ln -s "$directory/vim/vimrc" "$HOME/.vimrc"
ln -s "$directory/zsh.zshrc" "$HOME/.zshrc"

if [ `uname` = "Linux" ]; then
    ln -s "$directory/vim/gvimrc" "$HOME/.gvimrc"
fi
