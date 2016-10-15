set ruler
set numberwidth=1
set nu
set hidden

syntax on
colorscheme delek

let mapleader = " "

" REMAP
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap jK <ESC>
inoremap JK <ESC>

nnoremap <Leader>a :ArgWrap<CR>
nnoremap <Leader>vim :source $MYVIMRC<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>N :bN<CR>

