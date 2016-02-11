" Brief help
"
" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
"
" $ vim +BundleInstall +qall (for CLI invocation)
"
" :BundleList				" list configured bundles
" :BundleInstall(!) 			" install(update) bundles
" :BundleSearch(!) foo			" search(or refresh cache first) for foo
" :BundleClean(!)			" confirm(or auto-approve) removal of unused bundles
"
" see :h vundle
"
" NOTE: comments after Bundle commands are not allowed


set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'flazz/vim-colorschemes'
Bundle 'itchyny/lightline.vim'

"Bundle 'klen/python-mode'
Bundle 'nvie/vim-flake8'
Bundle 'Valloric/YouCompleteMe'
Bundle 'wakatime/vim-wakatime'
"Bundle 'phildawes/racer'
Plugin 'racer-rust/vim-racer'

set laststatus=2
if !has('gui_running')
      set t_Co=256
  endif

filetype plugin indent on
syntax on

colorscheme molokai
set background=dark

set fileformat=unix

set autoread
set number
set ruler
set backspace=eol,start,indent
set ignorecase
set smartcase
set hlsearch
set incsearch

set expandtab
set smarttab
set autoindent
set smartindent
set showmatch
set nobackup
"set paste
set noswapfile
"set mouse=a
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wrap
set scrolloff=10

set cursorline
highlight CursorLine term=bold cterm=bold guibg=Grey40

set splitright
set splitbelow

" set default netrw (Explore, Sexplore, Vexplore) view to tree
"let g:netrw_liststyle=3

" disable python-mode pylint-pep-8 annoyance auto-opens errors window if set
" to 1 by default
let g:pymode_line_cwindow = 0

" splitting and tabbing settings: to move between split windows
"set splitbelow
"set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" resizing splits
"nnoremap <C-UP> <C-W>+
"nnoremap <C-DOWN> <C-W>-
"nnoremap <C-LEFT> <C-W><
"nnoremap <C-RIGHT> <C-W>>
nnoremap <C-E> <C-W>=
nnoremap <C-I> <C-W>_
nnoremap <C-O> <C-W><Bar>

" kill the damned Ex mode
nnoremap Q <nop>

" whitespace shit
"match ErrorMsg '\s\+$'
"function! TrimWhiteSpace()
    "%s/\s\+$//e
"endfunction
"autocmd FileWritePre    * :call TrimWhiteSpace()
"autocmd FileAppendPre   * :call TrimWhiteSpace()
"autocmd FilterWritePre  * :call TrimWhiteSpace()
"autocmd BufWritePre     * :call TrimWhiteSpace()
"
"
"autocmd BufWritePre * :%s/\r//g
"autocmd BufWritePre * :%s///g


" RACER integration
set hidden
let g:racer_cmd = "/opt/racer/target/release/racer"
let $RUST_SRC_PATH="/usr/local/src/rust/src"

" set fileencoding
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
