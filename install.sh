#!/bin/bash

if [ ! -d ~/.vim ] ; then
    git clone git@github.com:pivotal/vim-config.git ~/.vim
fi

~/.vim/bin/install

if [ ! -f ~/.tmux.conf ] ; then
    ln -s ~/.vim/bundle/tmux-config/tmux.conf ~/.tmux.conf
    git clone git@github.com:seebi/tmux-colors-solarized.git ~/tmux-colors-solarized
    cat ~/tmux-colors-solarized/tmuxcolors-256.conf >> ~/.tmux.conf
    rm -rf ~/tmux-colors-solarized
fi
