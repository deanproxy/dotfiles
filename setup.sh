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
if [ ! -h "$HOME/.xsessionrc" ]; then
    ln -s "$directory/xsessionrc" "$HOME/.xsessionrc"
fi
if [ ! -d "$HOME/.xmonad" ]; then
    ln -s "$directory/xmonad" "$HOME/.xmonad"
fi

# Grab oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    if [ -z "`which zsh`" ]; then
        sudo apt-get install zsh
    fi
    curl=`which curl`
    if [ -z "$curl" ]; then
        sudo apt-get install curl
        curl=`which curl`
    fi
    $curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# Install my own theme
cp $HOME/dotfiles/dean.zsh-theme $HOME/.oh-my-zsh/themes

# Make the theme active, which involves editing .zshrc
cat $HOME/.zshrc | sed 's/ZSH_THEME=\(.*\)/ZSH_THEME="dean"/' > zshrc
mv zshrc $HOME/.zshrc

# Make sure we have a 256 color term
echo >> $HOME/.zshrc
echo 'TERM="xterm-256color"' >> $HOME/.zshrc

# git setup
git config --global user.name 'dean'
if [ `hostname` = 'djones-macbook' ]; then
    # Work computer, use work e-mail address
    git config --global user.email 'djones@ncircle.com'
else
    git config --global user.email 'dean@deanproxy.com'
fi
git config --global color.ui 'auto'

