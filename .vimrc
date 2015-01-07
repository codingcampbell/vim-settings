filetype off
let g:localvimrc_ask=0

call pathogen#runtime_append_all_bundles()

au BufNewFile,BufRead *.hx set filetype=haxe
au BufNewFile,BufRead *.tile set filetype=php
au BufNewFile,BufRead *.phtml set filetype=php
au BufNewFile,BufRead *.mod set filetype=php
au BufNewFile,BufRead *.templ set filetype=php
au BufNewFile,BufRead *.jsv set filetype=php
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.m set filetype=objc
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.rs set filetype=rust

" PEP-8 whitespace rules for Python
au BufNewFile,BufRead *.py setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Whitespace rules for CoffeeScript
au BufNewFile,BufRead *.coffee setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2

set nocompatible
syntax on
filetype on

let g:ctrlp_user_command = {
	\ 'types': {
		\ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
		\ 2: ['.hg', 'hg --cwd %s locate -I .'],
		\ },
	\ 'fallback': 'find %s -type f'
\ }

" Fix backspace/delete key on OSX
set backspace=2

" Case-insensitive search
set ic

" Line numbers
set number

set colorcolumn=120

" Alert when a file has been externally modified
au CursorHold,CursorHoldI * checktime

" Fix tmux delay
set timeoutlen=100
set noswapfile
set nobackup

" Fix double-trigger of fs-watch
set backupcopy=yes

set nowrap
set incsearch

set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

set expandtab

set cursorline

" Enable mouse usage in xterm
set mouse=a
set ttymouse=xterm2

" Open filename under cursor in new tab
nnoremap gf <C-W>gf

" Map H and L to begin/end of line
noremap H ^
noremap L $

set t_Co=256
colorscheme molokai
highlight clear SignColumn

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

set notimeout
let mapleader = ","

" Toggle search highlight with F6
nnoremap <Leader>s :set hlsearch!<CR>

" Show whitespace characters
set listchars=eol:$,tab:>-,trail:~
nnoremap <Leader>w :set list!<CR>

" Show indent guide
nnoremap <Leader>g :IndentGuidesToggle<CR>

" Format JSON
function FormatJSON()
  :%!python -m json.tool
  :%s/    /  /g
  :set ft=json
endfunction
nnoremap <Leader>j :call FormatJSON()<CR>

" Hack to get 256 colors to display in tmux
if !has("gui_running")
    set term=screen-256color
endif
