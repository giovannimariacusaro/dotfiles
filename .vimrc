" Giovanni Maria Cusaro's .vimrc - feel free to use!

" ==> PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'fenetikm/falcon'
Plug 'preservim/nerdtree'
call plug#end()

" ==> GENERAL
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
set encoding=utf-8

set backspace=indent,eol,start
set complete-=.,t,i

set wildmode=longest,list,full
set autoread
au FocusGained,BufEnter * checktime

set modelines=0
set nomodeline

set nobackup nowritebackup
set noswapfile

set clipboard=unnamed

set confirm
" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" ==> USER INTERFACE
set shortmess+=I
set updatetime=100
set timeoutlen=1000 ttimeoutlen=0
set wildmenu
set showcmd
set hid
set mouse=a

set display+=lastline
set scrolloff=5

set nu
set ruler
set ttyfast
set noerrorbells visualbell t_vb=

set smartcase
set hls is ic
set showmatch

set wrap nolist
set linebreak

" ==> TAB
set splitbelow splitright
set smartindent autoindent expandtab
set shiftwidth=2 softtabstop=2 tabstop=2

" ==> THEME
colorscheme falcon

" ==> LIGHTLINE
set cmdheight=2
set laststatus=2
set noshowmode

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

let g:lightline.colorscheme = 'falcon'

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" ==> MISC

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Toggle wrap mode \w
let s:wrapenabled = 0
function! ToggleWrap()
  set wrap nolist
  if s:wrapenabled
    set nolinebreak
    unmap j
    unmap k
    unmap 0
    unmap ^
    unmap $
    let s:wrapenabled = 0
  else
    set linebreak
    nnoremap j gj
    nnoremap k gk
    nnoremap 0 g0
    nnoremap ^ g^
    nnoremap $ g$
    vnoremap j gj
    vnoremap k gk
    vnoremap 0 g0
    vnoremap ^ g^
    vnoremap $ g$
    let s:wrapenabled = 1
  endif
endfunction
map <leader>w :call ToggleWrap()<CR>

" ==> MAPPING

" Esc in insert mode
inoremap jk <Esc>

" Esc in command mode
cnoremap jk <C-C>

" Remap split navigation to CTRL + hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Useful mappings for spliting
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

noremap <silent> <leader>+ :vertical resize +5<CR>
noremap <silent> <leader>- :vertical resize -5<CR>

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" ==> NERDTree

let NERDTreeShowHidden = 1
"let NERDTreeQuitOnOpen = 1
noremap <C-t> :NERDTreeToggle<CR>

  " Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

