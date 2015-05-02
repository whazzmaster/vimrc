# vim dotfiles
My vim configuration, subject to stupidity and laziness.

## Preparing vim on Linux
The version of vim shipped with ubuntu is a minimal build; reinstall the full
version for all the bells and whistles.

        sudo apt-get remove vim-tiny
        sudo apt-get install vim

## Preparing vim on Mac OSX
Use homebrew to install.

        brew install macvim

## Pulling to a new machine

1. Clone the repo

        $ git clone https://github.com/whazzmaster/vimrc.git ~/.vim

1. Pull Vundle down into the bundle directory

        $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

1. Symlink the config files to your home directory.

        ln -n ~/.vim/vimrc ~/.vimrc
        ln -n ~/.vim/vimrc.local ~/.vimrc.local

1. Open vim and run `:PluginInstall`

1. It's Miller Time
