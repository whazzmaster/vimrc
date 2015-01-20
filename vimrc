execute pathogen#infect()
syntax on
filetype plugin indent on

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Setup vim to lin go code
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" Set the color scheme
colorscheme vividchalk

" Set the font
if has('gui_running')
	set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h16
endif

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

" ===========================
"  OS-specific Configuration
" ===========================
let os = substitute(system('uname'), "\n", "", "")
if os == "Linux"
  " Setup powerline
  set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim/
else
  " On Mac, open Markdown files in Marked.app using <Leader>m
  nnoremap <Leader>m :silent !open -a Marked.app '%:p'<cr>

  " Setup powerline
  set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
endif
set laststatus=2
