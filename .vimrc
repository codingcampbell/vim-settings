filetype off
call pathogen#runtime_append_all_bundles()

au BufNewFile,BufRead *.hx set filetype=haxe
au BufNewFile,BufRead *.tile set filetype=php
au BufNewFile,BufRead *.phtml set filetype=php
au BufNewFile,BufRead *.mod set filetype=php
au BufNewFile,BufRead *.templ set filetype=php
au BufNewFile,BufRead *.jsv set filetype=php
au BufNewFile,BufRead *.coffee set filetype=javascript
au BufNewFile,BufRead *.json set filetype=javascript

syntax on
filetype on

" Case-insensitive search
set ic

" Line numbers
set number

" Alert when a file has been externally modified
au CursorHold,CursorHoldI * checktime

set noswapfile
set nobackup

set nowrap
set incsearch

set tabstop=4
set shiftwidth=4
set autoindent

set cursorline

" Enable mouse usage in xterm
set mouse=a
set ttymouse=xterm2

" Toggle search highlight with F6
nnoremap <F6> :set hlsearch!<CR>

" Reload file
nnoremap <F5> :e<CR>

" Open filename under cursor in new tab
nnoremap gf <C-W>gf

" Map H and L to begin/end of line
noremap H ^
noremap L $

set t_Co=256
colorscheme molokai

" Tab completion for vim commands
set wildmenu
set wildmode=list:longest,full

" Enhanced status bar
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Enter commands by pressing ; instead of :
nore ; :

" Show command being typed
set showcmd
