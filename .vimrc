" Giovanni Maria Cusaro's .vimrc - Feel free to use!

set nocompatible
filetype on
filetype plugin indent on
syntax on

set nobackup nowritebackup
set encoding=utf-8
set autoread
set autowrite
set hidden
set confirm
set history=30
set backspace=indent,eol,start

set modelines=0
set nomodeline

set mouse=a
set title
set number
set ruler
set wildmenu
set belloff=all

set expandtab
set smarttab
set autoindent
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
set et|retab
set colorcolumn=100
set textwidth=80
set showmatch
set noemoji
set wrap
set linebreak
set nolist
set showcmd

set splitbelow splitright

set hlsearch
set ignorecase
set incsearch
set hls is

" --- STATUS LINE ---

set laststatus=2
set noshowmode

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set statusline=
set statusline+=\ %n\           				" buffer number
set statusline+=%0*%{toupper(g:currentmode[mode()])}\ 		" The current mode
set statusline+=\ %t\ %R\ %M\ 					" Short name, ReadMode, Modified
set statusline+=%#Visual#       				" Colour
set statusline+=\ %Y\						" FileType
set statusline+=%{StatuslineGit()}				" Git
set statusline+=%=						" Right
set statusline+=%*\ %{''.(&fenc!=''?&fenc:&enc).''}\ \    	" Encoding
set statusline+=\ ☰\ %02l/%L\         				" Line
set statusline+=\ cl:\%02v\                         		" Column
set statusline+=\ %3p%%\                			" Percentage

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
