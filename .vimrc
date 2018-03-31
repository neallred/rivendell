" BASIC SET OPTIONS
noremap <S-k> <NOP>
set autoread
set formatoptions+=j
set hidden
set history=1000
set magic
set nocompatible
set number
set numberwidth=1
set ruler
set scrolloff=5
set sidescrolloff=5
set splitright
set showmode
" if &encoding ==# 'latin1' && has('gui_running')
"   set encoding=utf-8
" endif
set encoding=utf-8
set fileencoding=utf-8

" chinese characters on line below

set path=$PWD/**

set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.jpeg,*.ttf
set wildignore+=*.pdf,*.psd
set wildignore+=*.xls,.*xlsx,*.doc,*.docx,*.ppt,*.pptx,*.odt
set wildignore+=*.zip,*.7z,*.gz,*.ZIP,*.rar,*.exe
set wildignore+=*.mp3,*.mp4,*.wav,*3.gp,*.webm,*.aiff,*.ogg,*.iso,*.m4a
set wildignore+=node_modules/*,DNKVD/*,choiceats/build/*,choiceats-server/build/*
set wildignore+=*\\tmp\\*,*.swp,*.swo,.git,.cabal-sandbox

set wildmenu
set wildmode=longest:full,full
set laststatus=2

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

" SHORT TABS
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" LONG TABS
" set tabstop=2
" set shiftwidth=2
" set softtabstop=2
" set expandtab

" SEARCHING
set hlsearch
set incsearch


" LEADER
let mapleader="\<Space>"


" MACROS
"	" NAVIGATION IN FILES
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

" " NAVIGATION BETWEEN FILES
nnoremap <Leader>gf *ggnf.gf<CR>
nnoremap ge *:e <C-R>0<CR>

" find word at top of file where imports are, find the path part, and jump to the file
"

" command -complete=file -nargs=1 FS edit **/*<args>
" command -nargs=1 FSS split **/*
" command -nargs=1 FSV splitv **/*
autocmd BufWinEnter <buffer> wincmd L
autocmd BufEnter * lcd %:p:h
" set autochdir


"	" BUFFER MANIPULATION
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :!mkdir -p %:h<CR> :w<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>Q :qall<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bN<CR>
" :w|%bd|e# <- original solution is this
nnoremap <Leader>k :w<CR>:%bd<CR>:e#<CR> " keep only the current buffer


"	" TEMPLATES
nnoremap <silent> <leader>rrsfc :r ~/.vim/templates/react-stateless-functional-component.jsx<CR>
nnoremap <silent> <leader>rrcc :r ~/.vim/templates/react-component-common.jsx<CR>
nnoremap <silent> <leader>rrcv :r ~/.vim/templates/react-component-verbose.jsx<CR>
" rrtc assumes chai, sinon, mocha
nnoremap <silent> <leader>rrtc :r ~/.vim/templates/react-tests-chai.js<CR> 
nnoremap <silent> <leader>rrtt :r ~/.vim/templates/react-tests-tape.js<CR>
nnoremap <silent> <leader>rrtj :r ~/.vim/templates/react-tests-jest.js<CR>
nnoremap <silent> <leader>re   :r ~/.vim/templates/elm.elm<CR>
nnoremap <silent> <leader>rf   a <c-r>=expand("%:t:r")<ESC><ESC>
nnoremap <silent> <leader>rp   a <c-r>=expand("%:p:r:h")<ESC><ESC>

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

"	" SPELL CORRECTION
"	Javascript
iabbrev flase false
iabbrev ture true
iabbrev cosnt const
iabbrev fucntion function

" Elm
iabbrev ipmort import
iabbrev modle model

" Haskell
iabbrev JUst Just
iabbrev Flase False
iabbrev Ture True
iabbrev NOthing Nothing

" other
iabbrev Serach Search
iabbrev serach search

" FUGITIVE SETTINGS
autocmd BufReadPost fugitive://* set bufhidden=delete


" https://github.com/sdiehl/haskell-vim-proto
" Each of the sections can be copied into your existing config independent of
" the other ones.

" == basic ==

set autoindent
"set clipboard=unnamedplus,autoselect

set completeopt=menuone,menu,longest

set completeopt+=longest


set cmdheight=1

" == syntastic ==

map <Leader>s :SyntasticToggleMode<CR>

set statusline=
set statusline+=%#warningmsg#
set statusline+=%f
set statusline+=%=
set statusline+=%m
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" == ghc-mod ==

" map <silent> tw :GhcModTypeInsert<CR>
" map <silent> ts :GhcModSplitFunCase<CR>
" map <silent> tq :GhcModType<CR>
" map <silent> te :GhcModTypeClear<CR>

" == neco-ghc ==

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc


" like netrw, but not ;)
function! Notrw(dirToOpen)
" e.g use with nnoremap <Leader>o/ :call Notrw($p_root)<CR>

  if winnr('$') > 1
    execute "e " . a:dirToOpen
  else
    execute "vs " . a:dirToOpen
  endif

endfunction

if filereadable(".machine_vim.vim")
  source .machine_vim.vim
endif

let g:netrw_banner = 0
let g:netrw_list_hide= '.*\.swp$'

" If netrw fails to delete its buffers, use this.
autocmd FileType netrw setl bufhidden=delete

" == tabular ==

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a, :Tabularize /<-<CR>
vmap al :Tabularize /[\[\\|,]<CR>

" == elm ==
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:elm_syntastic_show_warnings = 1
let g:elm_format_autosave = 1
