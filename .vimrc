filetype off
let g:localvimrc_ask=0

" Explicitly use bash so other parent shells (fish) don't break
set shell=/bin/bash

execute pathogen#infect()

augroup configgroup
  " Clear current autocmds
  au!

  " Custom file extensions
  au BufNewFile,BufRead *.hbs set filetype=html
  au BufNewFile,BufRead *.hx set filetype=haxe
  au BufNewFile,BufRead *.json set filetype=javascript
  au BufNewFile,BufRead *.m set filetype=objc
  au BufNewFile,BufRead *.md set filetype=markdown
  au BufNewFile,BufRead *.phtml set filetype=php
  au BufNewFile,BufRead *.rs set filetype=rust

  " Whitespace rules for Makefiles
  au FileType make set noexpandtab

  " PEP-8 whitespace rules for Python
  au BufNewFile,BufRead *.py setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

  " Whitespace rules for Rust
  au BufNewFile,BufRead *.rs setlocal filetype=rust tabstop=8 expandtab shiftwidth=4 softtabstop=4
augroup END

set nocompatible
syntax on
filetype on

" Disable CtrlP cache
let g:ctrlp_cache_dir = '/dev/null'

" Set fugitive diff to be vertical by default
set diffopt+=vertical

" Force vim-jsx to highlight even without @jsx pragma
" https://github.com/kien/ctrlp.vim.gi://github.com/mxw/vim-jsx/issues/19
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
\ }

" Long history for commands
set history=5000

" Fix backspace/delete key on OSX
set backspace=2

" Case-insensitive search
set ic

" Line numbers
set number

set colorcolumn=120

" Always show tab line
set showtabline=2

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

" No tabs :(
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

" Alias Ctrl+c to Ctrl+[
noremap  
inoremap  

" g-bracket to switch tabs
noremap g[ gT
noremap g] gt

" g-brace to move tabs
noremap g{ :tabm -1<CR>
noremap g} :tabm +1<CR>

" Toggle search highlight
nnoremap <Leader>s :set hlsearch!<CR>

" Show whitespace characters
set listchars=eol:$,tab:>-,trail:~
nnoremap <Leader>w :set list!<CR>

" Toggle wrap
nnoremap <Leader>r :set wrap!<CR>

" Show indent guide
nnoremap <Leader>g :IndentGuidesToggle<CR>

" Change background light/dark
nnoremap <Leader>d :set background=dark<CR>
nnoremap <Leader>l :set background=light<CR>

" Copy/paste using system clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>P "+P

" Line transposition
noremap <Leader>q kddpk
noremap <Leader>a ddp


" Delete all buffers
nnoremap <Leader>b :%bdelete<CR>

" Format JSON
function FormatJSON()
  :%!python -m json.tool
  :%s/    /  /g
  :set ft=json
endfunction
nnoremap <Leader>j :call FormatJSON()<CR>

" Use fugitive's git-grep in a quickfix window
command -nargs=+ Grep execute 'silent Ggrep! -i' <q-args> | cw | redraw!
map <Leader>f :Grep

" Omni-complete with tab
set hidden
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

" SHUT UP (disable beeps)
set t_vb=
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox

if !has("gui_running")
  " Disable Background Color Erase to fix tmux background clearing
  set t_ut=
endif
