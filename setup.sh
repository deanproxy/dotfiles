#!/bin/sh

basedir=`dirname $0`
if [ "$basedir" = "." ]; then
    directory=`pwd`
else
    directory="$(pwd)/$basedir"
fi

# Install needed stuff 
if ! dpkg -l | grep xmonad > /dev/null 2>&1; then
    sudo apt-get install xmonad
    sudo apt-get install xmobar
    sudo apt-get install xcompmgr
    sudo apt-get install trayer
fi
if ! dpkg -l | grep gmail-notify > /dev/null 2>&1; then
    sudo apt-get install gmail-notify
fi
if [ ! -d ~/.themes/OMG ]; then
    theme="omg_suite_by_nale12-d4rpdfd.zip"
    mkdir ~/.themes
    cd ~/.themes
    wget http://www.deviantart.com/download/288398137/$theme
    unzip $theme
    rm $theme
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
if [ ! -d "$HOME/.xmonad" ]; then
    ln -s "$directory/xmonad" "$HOME/.xmonad"
fi

if [ ! -f /usr/share/gnome-session/sessions/xmonad.session ]; then
    sudo cp "$directory/xmonad/sessions/xmonad.session" /usr/share/gnome-session/sessions
fi
if [ ! -f /usr/share/xsessions/xmonad-gnome.desktop ]; then
    sudo cp "$directory/xmonad/sessions/xmonad-gnome.desktop" /usr/share/xsessions
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

