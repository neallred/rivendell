" BASIC SET OPTIONS
noremap <S-k> <NOP>
set hidden
set magic
set nocompatible
set number
set numberwidth=1
set ruler
set splitright

" PATHOGEN
execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" COLORS
syntax on
set t_Co=256
set background=dark
colorscheme OceanicNext
highlight LineNr ctermfg=gray ctermbg=black

let g:jsx_ext_required = 0 " extends JSX highlighting to JS files

" TABS
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" SEARCHING
set hlsearch
set incsearch


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
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>Q :qall<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>N :bN<CR>

"	" TEMPLATES
nnoremap <silent> <leader>rrsfc :r ~/.vim/templates/react-stateless-functional-component.jsx<CR>
nnoremap <silent> <leader>rrcc :r ~/.vim/templates/react-component-common.jsx<CR>
nnoremap <silent> <leader>rrcv :r ~/.vim/templates/react-component-verbose.jsx<CR>
nnoremap <silent> <leader>rrt :r ~/.vim/templates/react-tests.js<CR>

"	" SPELL CORRECTION
iabbrev flase false
iabbrev ture true
iabbrev cosnt const
iabbrev fucntion function

" FUGITIVE SETTINGS
autocmd BufReadPost fugitive://* set bufhidden=delete
