execute pathogen#infect()
syntax on
filetype plugin indent on

" Set the color scheme
colorscheme vividchalk

" Set the font
if has('gui_running')
	set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
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

" Configure NERDTree
map <C-n> :NERDTreeToggle<CR>

" Buffer configuration
nnoremap <F5> :buffers<CR>:buffer<Space>

" ===========================
"  OS-specific Configuration
" ===========================
let os = substitute(system('uname'), "\n", "", "")
if os == "Linux"
  " Setup powerline
  source  ~/.local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
else
  " On Mac, open Markdown files in Marked.app using <Leader>m
  nnoremap <Leader>m :silent !open -a Marked.app '%:p'<cr>

  " Setup powerline
  source  /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
endif
set laststatus=2
