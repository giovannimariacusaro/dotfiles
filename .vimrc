
" Giovanni Maria Cusaro's .vimrc - feel free to use!
" Licence -  The code follows GNU License v3.0

" ==> PLUGINS
" This config is targeted for Vim 8.0+ with Plug installed
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'fenetikm/falcon'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" ==> GENERAL
set modelines=0
set nomodeline

" Convert to Unicode defaults
setglobal termencoding=utf-8 fileencodings=
scriptencoding utf-8
set encoding=utf-8
autocmd BufNewFile,BufRead  *   try
autocmd BufNewFile,BufRead  *       set encoding=utf-8
autocmd BufNewFile,BufRead  *   endtry

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set backspace=indent,eol,start
set complete-=.,t,i

set wildmenu
set wildmode=longest,list,full
set autoread
au FocusGained,BufEnter * checktime

set nobackup nowritebackup
set noswapfile

set clipboard+=unnamed

" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

set confirm

" ==> USER INTERFACE
set guicursor=
set shortmess+=I
set updatetime=100
set timeout timeoutlen=1000 ttimeoutlen=0
set showcmd
set hid
set mouse=nv

set display+=lastline
set scrolloff=5

set nu
set ruler
set ttyfast
set noerrorbells visualbell t_vb=

set smartcase
set hls is ic
set showmatch

" Highlight matches when jumping to next
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
  redraw
endfunction

" Stop highlighting
nmap <esc><esc> :noh<return>

"set linebreak

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
highlight ColorColumn ctermbg=magenta
set nolinebreak
set nowrap
set list

map <leader>w :call ToggleWrap()<CR>
let s:wrapenabled = 0
function! ToggleWrap()
  if s:wrapenabled
    highlight ColorColumn ctermbg=magenta
    set nolinebreak
    set nowrap
    set list
    unmap j
    unmap k
    unmap 0
    unmap ^
    unmap $
    let s:wrapenabled = 0
  else
    highlight ColorColumn ctermbg=NONE
    set linebreak
    set wrap
    set nolist
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

" Make 81th column stand out
call matchadd('ColorColumn', '\%81v.', 100)

" Shady characters
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

set nolinebreak
set nowrap
set list
 
" Remove trailing whitespace on save
"autocmd BufWritePre * %s/\s\+$//e

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

" Toggle 2 split windows horiz/vert
map <Leader>tv <C-w>t<C-w>H
map <Leader>th <C-w>t<C-w>K

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" ==> NERDTree

let NERDTreeShowHidden = 1
noremap <silent> <Leader>n :NERDTreeToggle<CR>

  " Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" ==> FZF Vim

let g:fzf_layout = { 'down': '40%' }
nnoremap <C-p> :<C-u>Files<CR>
