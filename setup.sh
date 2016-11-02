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

    if [ -z "`which zsh`" ]; then
        sudo apt-get install zsh
    fi
    if [ -z "`which vim`" ]; then
        sudo apt-get install vim
    fi
    if [ -z "`which git`" ]; then
        sudo apt-get install git
    fi
    if [ -z "`which ruby`" ]; then
        sudo apt-get install ruby ruby-dev
    fi
    if [ -z "`which sqlite3`" ]; then
        sudo apt-get install sqlite3 libsqlite3-dev
    fi
    if [ -z "`which curl`" ]; then
        sudo apt-get install curl
        curl=`which curl`
    fi
    if [ -z "`which ctags`" ]; then
        sudo apt-get install ctags
        ctags=`which ctags`
    fi
    if [ -z "`which i3blocks`" ]; then
        sudo apt-get install i3blocks
    fi
    if [ -z "`which rofi`" ]; then
        sudo apt-get install rofi
    fi
    if [ -z "`which nm-applet`" ]; then
        sudo apt-get install nm-applet
    fi

    if [ ! -d "$HOME/.config/i3" ]; then
        mkdir -p "$HOME/.config/i3"
    fi
    cp -r ~/dotfiles/linux/i3/* "$HOME/.config/i3"

    if [ ! -d "$HOME/.local/share/fonts" ]; then
        mkdir -p "$HOME/.local/share/fonts"
    fi
    cp ~/dotfiles/linux/*.ttf "$HOME/.local/share/fonts" 

else
    if [ -d "~/Library/Application Support/Sublime Text 2" ]; then
        ln -s ~/dotfiles/SublimeText "~/Library/Application Support/Sublime Text 2/Packages/User"
    fi
    if [ -d "~/Library/Application Support/Sublime Text 3" ]; then
        ln -s ~/dotfiles/SublimeText "~/Library/Application Support/Sublime Text 3/Packages/User"
    fi
    if [ ! -d "$HOME/.atom" ]; then
        mkdir -p "$HOME/.atom"
        cp ~/dotfiles/styles.less "$HOME/.atom"
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
if [ ! -h ~/.config/gtk-3.0/gtk.css ]; then
    rm -f ~/.config/gtk-3.0/gtk.css
    ln -s "$directory/gtk.css" ~/.config/gtk-3.0/gtk.css
fi

# Grab Vundle for Vim
if [ ! -d ~/.vim/bundle/vundle ]; then
    mkdir -p ~/.vim/bundle/
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall
fi

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
if [ `hostname` = 'tacos' ]; then
    # Work computer, use work e-mail address
    git config --global user.email 'dean.jones@pamlabdev.com'
else
    git config --global user.email 'dean@deanproxy.com'
fi
git config --global color.ui 'auto'
git config --global push.default simple
git config --global merge.tool opendiff
git config --global core.excludesfile ~/.gitignore

