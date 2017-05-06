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

" JS TABS
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
" set noexpandtab

" C++ TABS
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

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
nnoremap <Leader>gf *ggnf.gf<CR>
" find word at top of file where imports are, find the path part, and jump to
" the file

"	" BUFFER MANIPULATION
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>Q :qall<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bN<CR>

"	" TEMPLATES
nnoremap <silent> <leader>rrsfc :r ~/.vim/templates/react-stateless-functional-component.jsx<CR>
nnoremap <silent> <leader>rrcc :r ~/.vim/templates/react-component-common.jsx<CR>
nnoremap <silent> <leader>rrcv :r ~/.vim/templates/react-component-verbose.jsx<CR>
" rrtc assumes chai, sinon, mocha
nnoremap <silent> <leader>rrtc :r ~/.vim/templates/react-tests-chai.js<CR> 
nnoremap <silent> <leader>rrtt :r ~/.vim/templates/react-tests-tape.js<CR>
nnoremap <silent> <leader>rrtj :r ~/.vim/templates/react-tests-jest.js<CR>

"	" SPELL CORRECTION
iabbrev flase false
iabbrev ture true
iabbrev cosnt const
iabbrev fucntion function

" FUGITIVE SETTINGS
autocmd BufReadPost fugitive://* set bufhidden=delete
