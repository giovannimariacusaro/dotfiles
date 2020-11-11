" Giovanni Maria Cusaro's .vimrc - Feel free to use!

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'fenetikm/falcon'
call plug#end()

set nocompatible
filetype plugin indent on
syntax on
set clipboard=unnamed

set timeoutlen=1000 ttimeoutlen=0
set noswapfile
set nobackup nowritebackup
set encoding=utf-8
set autoread
set undofile
set hidden
set confirm
set backspace=indent,eol,start

set modelines=0
set nomodeline

set mouse=a
set number
set ruler
set wildmenu
set ttyfast
set scrolloff=1
set sidescrolloff=5
set display+=lastline
set belloff=all
set expandtab
set smarttab
set autoindent
set shiftwidth=2
set smartindent
set softtabstop=2 tabstop=2
set et|retab
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set showmatch
set noemoji
set wrap
set linebreak
set nolist
set splitbelow splitright

set hlsearch
set ignorecase
set incsearch
set hls is

" --- LIGHTLINE ---

set termguicolors
set laststatus=2
set noshowmode

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

let g:falcon_lightline = 1
let g:lightline.colorscheme = 'falcon'

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" --- THEME ---

let g:falcon_lightline = 1
let g:lightline.colorscheme = 'falcon'
colorscheme falcon

" --- MAPPING ---

inoremap jk <ESC>

" Prev/Next Tab
nnoremap <silent> <C-k> : tabnext<CR>
nnoremap <silent> <C-j> : tabprev<CR>

" --- MISC ---

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
