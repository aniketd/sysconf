call plug#begin('~/.nvim/plugged')

" Make sure you use single quotes
" Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/vim-easy-align'
"
" Group dependencies, vim-snippets depends on ultisnips
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" " On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
" " Using git URL
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
" " Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
" " Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
" " Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
" " Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" For colors
Plug 'flazz/vim-colorschemes'

" The most effective statusline ever...
Plug 'itchyny/lightline.vim'

" Haskell plug that's great
"Plug 'neovimhaskell/haskell-vim'

" You Complete Me.
"Plug 'Valloric/YouCompleteMe', {'do': './install.sh'}
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Neocomplete
"Plug 'Shougo/neocomplete.vim'
" Deoplete [ requires +python3 neovim ]
Plug 'Shougo/deoplete.nvim'

" Hakell plug that's even more great
"Plug 'eagletmt/neco-ghc'

" Add plugins to &runtimepath
call plug#end()





set laststatus=2
"if !has('gui_running')
set t_Co=256
"endif

filetype plugin indent on
syntax on

colorscheme Tomorrow-Night
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

set colorcolumn=80,100,120

" enable @ startup
let g:deoplete#enable_at_startup = 1
"let g:python_host_prog = 'python'

" set default netrw (Explore, Sexplore, Vexplore) view to tree
"let g:netrw_liststyle=3

" disable python-mode pylint-pep-8 annoyance auto-opens errors window if set
" to 1 by default
"let g:pymode_line_cwindow = 0

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
"set hidden
"let g:racer_cmd = '/opt/racer/target/release/racer'
"let $RUST_SRC_PATH="/usr/local/src/rust/src"
"
"" set fileencoding
"if has("multi_byte")
"  if &termencoding == ''
"    let &termencoding = &encoding
"  endif
"  set encoding=utf-8
"  setglobal fileencoding=utf-8
"  "setglobal bomb
"  set fileencodings=ucs-bom,utf-8,latin1
"endif
