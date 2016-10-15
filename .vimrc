" PATHOGEN
" execute pathogen#infect()
" call pathogen#helptags()
" filetype plugin indent on

" BASIC SET OPTIONS
noremap <S-k> <NOP>
set hidden
set magic
set nocompatible
set number
set numberwidth=1
set ruler
set splitright

" TABS
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" SEARCHING
set hlsearch
set incsearch

" COLORS
syntax on
colorscheme delek
set t_Co=256
set background=dark

" LEADER
let mapleader="\<Space>"


" MACROS
"	" NAVIGATION
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap jK <ESC>
inoremap JK <ESC>
nnoremap <C-j> 26j
vnoremap <C-j> 26j
nnoremap <C-k> 26k
vnoremap <C-k> 26k

nnoremap <Space> <NOP>
nnoremap <Leader>a :ArgWrap<CR>
nnoremap <Leader>vim :source $MYVIMRC<CR>

"	" BUFFER MANIPULATION
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>Q :qall<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>N :bN<CR>

"	" TEMPLATES
nnoremap <silent> <leader>crc :r ~/.vim/templates/react-component.jsx<CR>

"	" SPELL CORRECTION
iabbrev flase false
iabbrev ture true
iabbrev cosnt const
iabbrev fucntion function

" FUGITIVE SETTINGS
autocmd BufReadPost fugitive://* set bufhidden=delete
