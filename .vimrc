" Giovanni Maria Cusaro's .vimrc - Feel free to use!

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
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
set autowrite
set undofile
set hidden
set confirm
set history=30
set backspace=indent,eol,start
set complete-=i
set nrformats-=octal

set modelines=0
set nomodeline

if has('mouse_sgr')
 set ttymouse=sgr
endif
set mouse=a
set title
set termguicolors
set number
set ruler
set wildmenu
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

" Falcon
let g:falcon_lightline = 1
let g:lightline.colorscheme = 'falcon'
colorscheme falcon


" --- MAPPING ---

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
