set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-commentary'
Plugin 'shougo/neocomplete.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'

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

" Pull in closetag.vim
source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Setup vim to lin go code
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" Set the color scheme
colorscheme vividchalk

" Set the dictionary
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

" Turn on line numbers
set number

" Warn on long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Set tabs
set expandtab tabstop=2 shiftwidth=2

" Autocomplete closing tags in HTML
iabbrev <// </<C-X><C-o>

" Configure NERDTree
map <C-t> :NERDTreeToggle<CR>

" Buffer configuration
nnoremap <F5> :buffers<CR>:buffer<Space>

" Strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Abbreviations
iabbrev bpry require 'pry'; binding.pry
iabbrev rpry require 'pry'; binding.remote_pry

" ===========================
"  OS-specific Configuration
" ===========================
let os = substitute(system('uname'), "\n", "", "")
if os == "Linux"
  " Setup powerline
  set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim/

  " Set the font
  if has('gui_running')
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
  endif
else
  " On Mac, open Markdown files in Marked.app using <Leader>m
  nnoremap <Leader>m :silent !open -a Marked.app '%:p'<cr>

  " Setup powerline
  set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/

  " Set the font
  if has('gui_running')
    set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h12
  endif
endif
set laststatus=2
