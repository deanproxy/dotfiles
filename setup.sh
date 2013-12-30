#!/bin/sh

basedir=`dirname $0`
if [ "$basedir" = "." ]; then
    directory=`pwd`
else
    directory="$(pwd)/$basedir"
fi

linux=1
if [ `uname` = 'Darwin' ]; then
    linux=0
fi

# This stuff is for when we're in Linux. Everything else is cross platform or OSX specific.
if [ $linux = 1 ]; then
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
    if [ ! -d "$HOME/.xmonad" ]; then
        ln -s "$directory/linux/xmonad" "$HOME/.xmonad"
    fi

    if [ ! -f /usr/share/gnome-session/sessions/xmonad.session ]; then
        sudo cp "$directory/linux/xmonad/sessions/xmonad.session" /usr/share/gnome-session/sessions
    fi
    if [ ! -f /usr/share/xsessions/xmonad-gnome.desktop ]; then
        sudo cp "$directory/linux/xmonad/sessions/xmonad-gnome.desktop" /usr/share/xsessions
    fi
    if [ ! -f ~/.xsessionrc ]; then
        ln -s "$directory/linux/xmonad/sessions/xsessionrc" ~/.xsessionrc
    fi

    # Install theme
    if [ ! -d ~/.themes/Universal ]; then
        if [ ! -d ~/.themes ]; then
            mkdir ~/.themes
        fi
        unzip -d ~/.themes "$directory/linux/universal_by_nale12-d4hne5v.zip"
    fi

    myautostart="$directory/linux/xmonad/autostart"
    for i in $(ls $myautostart/*.desktop); do
        filename=$(basename $i)
        if [ ! -f ~/.config/autostart/$filename ]; then
            ln -s $i ~/.config/autostart/$filename
        fi
    done
    if [ -z "`which zsh`" ]; then
        sudo apt-get install zsh
    fi
    if [ -z "`which curl`" ]; then
        sudo apt-get install curl
        curl=`which curl`
    fi

    # Install sublime text files
    if [ ! -d ~/.config/sublime-text-2/Packages/User ]; then
        mkdir -p ~/.config/sublime-text-2/Packages/User
    fi
    cp ~/dotfiles/SublimeText/* ~/.config/sublime-text-2/Packages/User
else
    if [ -d "~/Library/Application Support/Sublime Text 2" ]; then
        ln -s ~/dotfiles/SublimeText "~/Library/Application Support/Sublime Text 2/Packages/User"
    fi
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
if [ ! -h "$HOME/.ctags" ]; then
    rm -f "$HOME/.ctags"
    ln -s "$directory/vim/ctags" "$HOME/.ctags"
fi
if [ ! -h "$HOME/.tmux.conf" ]; then
    rm -f "$HOME/.tmux.conf"
    ln -s "$directory/tmux.conf" "$HOME/.tmux.conf"
fi

# Grab Vundle for Vim
mkdir -p ~/.vim/bundle/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

# Grab oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
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
if [ `hostname` = 'deanpad' ]; then
    # Work computer, use work e-mail address
    git config --global user.email 'dean.jones@virtustream.com'
else
    git config --global user.email 'dean@deanproxy.com'
fi
git config --global color.ui 'auto'
git config --global merge.tool opendiff
git config --global core.excludesfile ~/.gitignore

