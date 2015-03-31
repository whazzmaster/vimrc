set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'shougo/neocomplete.vim'
Plugin 'tpope/vim-endwise'
Plugin 'junegunn/vim-easy-align'

Plugin 'alvan/vim-closetag'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'shemerey/vim-peepopen'
Plugin 'skalnik/vim-vroom'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'

" Syntax
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'plasticboy/vim-markdown'
Plugin 'wavded/vim-stylus'
Plugin 'wting/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'leshill/vim-json'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" rails
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rvm'

call vundle#end()

syntax on
filetype plugin indent on
set hidden

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

set cursorline
set cursorcolumn
